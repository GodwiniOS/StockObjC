//
//  RawModel.m
//  MVVMDemo
//
//  Created by mm-cy on 2018/3/9.
//  Copyright © 2018年 mm-cy. All rights reserved.
//

#import "CandleViewModel.h"

@implementation CandleViewModel
//@synthesize data;

-(instancetype)initWithHLOC:(int)highValue
                           :(int)lowValuee
                           :(int)openValue
                           :(int)closeValue{
    self = [super init];
    if(self)
    {
        self.height = (highValue);
        self.low = (lowValuee);
        self.open = (openValue);
        self.close = (closeValue);
        _width = 1;
//        _space = 0.5;
        _level = 0;
    }
    return self;
}


-(instancetype)initWithHLOC:(int)highValue
                           :(int)lowValuee
                           :(int)openValue
                           :(int)closeValue
                           :(int)heightValue
                           :(PositionModel *)positionValue
                           :(int)levelValue{
    self = [super init];
    if(self)
    {
        self.height = (highValue);
        self.low = (lowValuee);
        self.open = (openValue);
        self.close = (closeValue);
        self.height = (heightValue);
        self.position = positionValue;
        self.level = (levelValue);
            
    }
    return self;
}

-(BOOL) randomBool
{
    int tmp = (arc4random() % 10);
    if(tmp % 2 == 0)
        return YES;
    return NO;
}

- (id)nextCandle:(int)indexValue{
    
    bool validation = NO;
    
//    CandleViewModel *candleViewModel = [[CandleViewModel alloc]init];
    int newClose = 0;
    int newHigh = 0;
    int newLow = 0;
    int newOpen = 0;
    int newHeight = 0;
    int newLevel = 0;//low
    PositionModel *newPosition = [[PositionModel alloc]init];

    while (!validation) {
        
        int random = 10 + arc4random() % (60 - 10);

        newOpen = _close;
        if (self.randomBool){
            newLevel = 1; // high
        } else {
            newLevel = 0;
        }
        
        float keyDec = ((float)(random))/5;
        int keyInt = (int)keyDec;


        if (newLevel == 1) {
            newClose = newOpen + (int)keyInt;
            newHigh = newClose + 5;
            newLow = newClose - 5;
        } else {
            newClose = newOpen - (int)keyInt;
            newHigh = newOpen + 5;
            newLow = newOpen - 5;
        }
        
        newHeight = _high - _low;

        newPosition.x = (float)indexValue * 1.5; // 1.5
        newPosition.y = 210 - (float)newHigh;
        
        validation = NO;
        if (newPosition.y > 15) { // new rule 15
            if (newPosition.y < 190) {
                validation = YES;
            }
        }
    }
    
    CandleViewModel *candleVM = [[CandleViewModel alloc]initWithHLOC:newHigh :newLow :newOpen :newClose :newHeight :newPosition :newLevel];
    return candleVM;
}



@end
