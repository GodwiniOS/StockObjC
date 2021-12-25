//
//  ChartViewController.h
//  UITable_CustomeCell
//
//  Created by Godwin A on 25/12/21.
//  Copyright © 2021 YOUNGSIC KIM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChartViewModel.h"
#import "ChartView.h"
NS_ASSUME_NONNULL_BEGIN


@interface ChartViewController : UIViewController

@property (nonatomic, strong) ChartViewModel *viewModel;
@property (weak, nonatomic) IBOutlet ChartView *chartView;

@end

NS_ASSUME_NONNULL_END
