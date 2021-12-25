//
//  TimeLineViewModel.m
//  UITable_CustomeCell
//
//  Created by Godwin A on 25/12/21.
//  Copyright © 2021 YOUNGSIC KIM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TimeLineViewModel.h"

@implementation TimeLineViewModel
- (instancetype)init:(PositionModel *)startPositionValue :(PositionModel *)endPositionValue :(PositionModel *)textPositionValue{
    _startPosition = startPositionValue;
    _endPosition = endPositionValue;
    _textPosition = textPositionValue;
    return self;
}
@end
