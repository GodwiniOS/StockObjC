//
//  ViewController.h
//  UITable_CustomeCell
//
//  Created by YOUNGSIC KIM on 2017-05-13.
//  Copyright © 2017 YOUNGSIC KIM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PositionModel.h"
#import "CandleViewModel.h"

@interface ChartViewModel : NSObject

@property(strong, nonatomic) NSMutableArray<CandleViewModel *> *candles;
@property(strong, nonatomic) NSMutableArray<TimeLineViewModel *> *timeLines;

@property (nonatomic, strong) PositionModel *currentStockStart;
@property (nonatomic, strong) PositionModel *currentStockEnd;

-(instancetype)initWithHLOC;
- (void) initialValuesGenerator;
- (void) generateNew;
@end





