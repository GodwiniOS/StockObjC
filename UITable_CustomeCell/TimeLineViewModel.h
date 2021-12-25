//
//  sdhjshd.m
//  UITable_CustomeCell
//
//  Created by Godwin A on 25/12/21.
//  Copyright © 2021 YOUNGSIC KIM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PositionModel.h"

@interface TimeLineViewModel : NSObject


@property (nonatomic) PositionModel* startPosition;
@property (nonatomic) PositionModel* endPosition;
@property (nonatomic) PositionModel* textPosition;


-(instancetype)init:(PositionModel*)startPosition
                   :(PositionModel*)endPosition
                   :(PositionModel*)textPosition;
@end
