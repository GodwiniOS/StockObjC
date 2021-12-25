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
    
    
    UIView *chartView = [[UIView alloc] initWithFrame:CGRectMake(0, 30, 360, 340)];
    [self.view addSubview:chartView];
//    [chartView.layer.sublayers.for]
    
    for (CALayer *layer in chartView.layer.sublayers) {
        [layer removeFromSuperlayer];
    }
    
    int first = 1;
    int second = 56;
    _viewModel = [[ChartViewModel alloc] init];
    [self.chartView prepareTimeline:_viewModel.timeLines:first :second :nil];
    [self.chartView prepareCandles:_viewModel.candles];

}


- (void)viewDidAppear:(BOOL)animated{
    [self handleTimer];
}


- (void)handleTimer {

    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(eventToFire:) userInfo:nil repeats:YES]; // Fire every 4 seconds.

}


- (void)eventToFire:(NSTimer*)timer {
    
    for (CALayer *layer in _chartView.layer.sublayers) {
        if (layer != nil){
            continue;;
        }
        [layer removeFromSuperlayer];
    }
    
    [self.viewModel generateNew];
    int first = 1;
    int second = 56;
    [self.chartView prepareTimeline:_viewModel.timeLines :first :second :_viewModel.candles.lastObject.open];
    [self.chartView prepareCandles:_viewModel.candles];
}


@end
