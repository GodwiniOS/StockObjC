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

-(instancetype)initWithHLOC:(int *)highValue
                           :(int *)lowValuee
                           :(int *)openValue
                           :(int *)closeValue{
    self = [super init];
    if(self)
    {
        self.height = *(highValue);
        self.low = *(lowValuee);
        self.open = *(openValue);
        self.close = *(closeValue);
    }
    return self;
}


-(instancetype)initWithHLOC:(int *)highValue
                           :(int *)lowValuee
                           :(int *)openValue
                           :(int *)closeValue
                           :(int *)heightValue
                           :(PositionModel *)positionValue
                           :(int *)levelValue{
    self = [super init];
    if(self)
    {
        self.height = *(highValue);
        self.low = *(lowValuee);
        self.open = *(openValue);
        self.close = *(closeValue);
        self.height = *(heightValue);
        self.position = positionValue;
        self.level = *(levelValue);
            
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
    
    CandleViewModel *candleViewModel = [CandleViewModel alloc];
    while (!validation) {
        
        int random = 10 + arc4random() % (20 - 10);

        NSInteger newOpen = [self close];
        NSInteger newLevel = 0;//low

        if (self.randomBool){
            newLevel = 1; // high
        }
//            let newClose = newLevel == .High ? newOpen + Int(random) : newOpen - Int(random)
        
        long keyDec = ((long)(random))/5;
        int keyInt = (int)keyDec;



        NSInteger newClose = newOpen - (NSInteger)keyInt;
        NSInteger newHigh = newOpen + 5;
        NSInteger newLow = newOpen - 5;
        NSInteger newHeight = _high - _low;
        if (newLevel == 1) {
            newClose = newOpen + (NSInteger)keyInt;
            newHigh = newClose + 5;
            newLow = newClose - 5;
        }
        
//        let newClose = newLevel == .High ? newOpen + Int(random/5) : newOpen - Int(random/5)

//        let newHigh = newLevel == .High ? newClose + 5 : newOpen + 5
//        let newLow = newLevel == .High ? newClose - 5 : newOpen - 5
//        let newHeight = high - low
        
        PositionModel *newPosition = [PositionModel alloc];
        newPosition.x = (float)indexValue * 1.5;
        newPosition.y = 210 - (float)newHigh;
//        let newPosition = Position(x: Float(index) * 1.5, y: Float(210 - newHigh))
        
        
        validation = NO;
        if (newPosition.y > 15) {
            if (newPosition.y < 190) {
                validation = YES;
            }
        }
        
//        validation = newPosition.y > 15 && newPosition.y < 190
        
        
        CandleViewModel *candleVM = [[CandleViewModel alloc]initWithHLOC:&newHigh :&newLow :&newOpen :&newClose :&newHeight :newPosition :&newLevel];
        candleViewModel = candleVM;
    }
    
    return candleViewModel;
}



@end
