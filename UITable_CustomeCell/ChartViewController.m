//
//  ChartViewController.m
//  UITable_CustomeCell
//
//  Created by Godwin A on 25/12/21.
//  Copyright © 2021 YOUNGSIC KIM. All rights reserved.
//

#import "ChartViewController.h"

@interface ChartViewController ()

@end

@implementation ChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)viewDidAppear:(BOOL)animated{
    [self handleTimer];
}


- (void)handleTimer {

    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(eventToFire:) userInfo:nil repeats:YES]; // Fire every 4 seconds.

}


- (void)eventToFire:(NSTimer*)timer {
    
}


@end
