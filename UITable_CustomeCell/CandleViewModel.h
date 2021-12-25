//
//  RawModel.h
//  MVVMDemo
//
//  Created by mm-cy on 2018/3/9.
//  Copyright © 2018年 mm-cy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PositionModel.h"

@interface CandleViewModel : NSObject

@property (nonatomic) int high;
@property (nonatomic) int low;
@property (nonatomic) int open;
@property (nonatomic) int close;


@property (nonatomic) int height;
@property (nonatomic) int width;
@property (nonatomic) float *space;

@property (nonatomic) PositionModel *position;

@property (nonatomic) int level;


-(instancetype)initWithHLOC:(int)highValue
                           :(int)lowValuee
                           :(int)openValue
                           :(int)closeValue;

-(instancetype)initWithHLOC:(int)highValue
                           :(int)lowValuee
                           :(int)openValue
                           :(int)closeValue
                           :(int)heightValue
                           :(PositionModel *)positionValue
                           :(int)levelValue;

//-(self)nextCandle:(NSInteger *)index;

-(id)nextCandle:(int)indexValue;

@end


