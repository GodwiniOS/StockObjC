//
//  ChartViewModel.m
//  UITable_CustomeCell
//
//  Created by Godwin A on 25/12/21.
//  Copyright © 2021 YOUNGSIC KIM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChartViewModel.h"
#import "CandleViewModel.h"

@implementation ChartViewModel : NSObject

- (instancetype)init{
    [self initialValuesGenerator];
    return self;
}

//- (instancetype)initWithHLOC{
//    return self;
//}

- (void)initialValuesGenerator{
    
    CandleViewModel *first = [[CandleViewModel alloc]initWithHLOC:180 :150 :175 :155];
    _candles = [[NSMutableArray alloc] init];

    [_candles addObject:first];

    for(int i=1;i<200;i++) {
        
        CandleViewModel *candlevm = _candles[i-1];
        CandleViewModel *newCandle = [candlevm nextCandle:i];
        [_candles addObject:newCandle];
    }
    
    
    for (int i = 1;i<5;i++) {

        PositionModel *start = [[PositionModel alloc]init:i * 75 :0];
        PositionModel *end = [[PositionModel alloc]init:i * 75 :210];
        PositionModel *text = [[PositionModel alloc]init:(i * 75) - 18 :220];

        TimeLineViewModel *timeLine = [[TimeLineViewModel alloc] init:start :end :text];
        [_timeLines addObject:timeLine];
    }

}

- (void)generateNew{
    [_candles removeObjectAtIndex:0];
    
    CandleViewModel * newCandle = [_candles[198] nextCandle:199];
    [_candles addObject:newCandle];

    for(int i=0;i<200;i++){
        _candles[i].position.x = i * 1.5;
    }
    
    _Bool addNew = NO;
    
    for(int index=0;index<_timeLines.count;index++){
        
        float newX = _timeLines[index].endPosition.x - 1.5;

        if (newX < 0) {
            addNew = YES;
        }
        
        _timeLines[index].startPosition.x = newX;
        _timeLines[index].endPosition.x = newX;
        _timeLines[index].textPosition.x = newX - 18;
    }
    
    
    if (addNew == YES) {
        
        [_timeLines removeObjectAtIndex:0];
        
        PositionModel *start = [[PositionModel alloc]init:300 :0];
        PositionModel *end = [[PositionModel alloc]init:300:210];
        PositionModel *text = [[PositionModel alloc]init:300-18:220];
        
        TimeLineViewModel *newTimeLine = [[TimeLineViewModel alloc] init:start :end :text];
        [_timeLines addObject:newTimeLine];
    }
    
}

@end


        






//    func generateNew() {
//
//
//        candles.removeFirst()
//        let newCandle = candles[198].nextCandle(199)
//        candles.append(newCandle)
//
//        for index in 0..<200 {
//            candles[index].position.x = Float(index) * 1.5
//        }
//
//
//        var addNew = false
//        for index in 0..<timeLines.count {
//
//            let newX = timeLines[index].endPosition.x - 1.5
//
//            if newX < 0 {
//                addNew = true
//            }
//
//            timeLines[index].startPosition.x = newX
//            timeLines[index].endPosition.x = newX
//            timeLines[index].textPosition.x = newX - 18
//        }
//
//        if addNew {
//
//            timeLines.removeFirst()
//            timeLines.append(TimeLineViewModel(startPosition: Position(x: 300, y: 0),
//                                               endPosition: Position(x: 300, y: 210),
//                                               textPosition: Position(x: 300-18, y: 220)))
//        }
//    }
//}
