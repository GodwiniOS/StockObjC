//
//  RawModel.h
//  MVVMDemo
//
//  Created by mm-cy on 2018/3/9.
//  Copyright © 2018年 mm-cy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PositionModel.h"

@interface PositionModel : NSObject


@property (nonatomic) float x;
@property (nonatomic) float y;


-(instancetype)init:(float)xValue
                           :(float)yValuee;
@end


