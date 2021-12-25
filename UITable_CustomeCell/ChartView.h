//
//  CustomTableViewCell.h
//  MVVMDemo
//
//  Created by coderyi on 15/6/28.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PositionModel.h"
#import "CandleViewModel.h"
@interface ChartView : UIView

- (instancetype)initWithFrame:(CGRect)frame;
- (void) prepredashVer:(NSMutableArray*)timelines;
- (void) prepreTextLayer:(int)initialValue:(float)decimal;
- (void) prepareTimeline:(NSMutableArray*)timelines:(int)initialValue:(int)decimal:(int)value;
- (void) prepareCurrentLine:(int)value:(int)initialValue:(int)decimal;
- (void) prepareCandles:(NSMutableArray*)candles;


@end
