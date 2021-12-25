//
//  CustomTableViewCell.m
//  MVVMDemo
//
//  Created by coderyi on 15/6/28.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ChartView.h"


@implementation ChartView : UIView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    return self;
}

- (void)prepare{
    
    
    CALayer *line1 = [[CALayer alloc]init];

    line1.frame = CGRectMake(0, 0, 300, 2);
    line1.backgroundColor = UIColor.grayColor.CGColor;
    [self.layer addSublayer:line1];

    CALayer *line2 = [[CALayer alloc]init];
    line2.frame = CGRectMake(0, 0, 2, 210);
    line2.backgroundColor = UIColor.grayColor.CGColor;
    [self.layer addSublayer:line2];
    
    CALayer *line3 = [[CALayer alloc]init];
    line3.frame = CGRectMake(0, 210, 300, 2);
    line3.backgroundColor = UIColor.grayColor.CGColor;
    [self.layer addSublayer:line3];
    
    CALayer *line4 = [[CALayer alloc]init];
    line4.frame = CGRectMake(300, 0, 2, 210);
    line4.backgroundColor = UIColor.grayColor.CGColor;
    [self.layer addSublayer:line4];
    
    for (int i = 1;i<7;i++) {
        
        
        CAShapeLayer *dashLayer = [[CAShapeLayer alloc]init];
        dashLayer.strokeColor = UIColor.grayColor.CGColor;
        dashLayer.lineWidth = 1;
        [dashLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:7],[NSNumber numberWithInt:3],nil]];
        

        CGMutablePathRef path = CGPathCreateMutable();
        CGPathMoveToPoint(path, NULL, 0, i*30);
        CGPathAddLineToPoint(path, NULL, 300,i*30);

        [dashLayer setPath:path];
        CGPathRelease(path);

        [[self layer] addSublayer:dashLayer];

        
        
    }

}

- (void)prepredashVer:(NSMutableArray *)timelines{
    
    int i = 0;
    
    for (int j = 0; timelines.count;j++) {
        
        TimeLineViewModel *timeline = timelines[j];
        
        CAShapeLayer *dashLayer = [[CAShapeLayer alloc]init];
        dashLayer.strokeColor = UIColor.grayColor.CGColor;
        dashLayer.lineWidth = 1;
        [dashLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:7],[NSNumber numberWithInt:3],nil]];

        CGMutablePathRef path = CGPathCreateMutable();
        CGPathMoveToPoint(path, NULL, timeline.startPosition.x, timeline.startPosition.y);
        CGPathAddLineToPoint(path, NULL, timeline.endPosition.x, timeline.endPosition.y);

        [dashLayer setPath:path];
        CGPathRelease(path);

        [[self layer] addSublayer:dashLayer];
        
        
        CATextLayer *textlayer = [[CATextLayer alloc]init];
        textlayer.frame = CGRectMake((i * 75) - 18, 220, 100, 40);
        textlayer.frame = CGRectMake(timeline.textPosition.x,
                                     timeline.textPosition.y, 100, 40);
        textlayer.fontSize = 12;
        textlayer.alignmentMode = NSTextAlignmentLeft;
        i = i + 1;

        NSDate *now = [NSDate date];
        NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
        [outputFormatter setDateFormat:@"HH:mm"];
        NSString *newDateString = [outputFormatter stringFromDate:now];
//        NSLog(@"newDateString %@", newDateString);
        
        
//        let calendar = Calendar.current
//        let hour = calendar.component(.hour, from: date).text
//        let minutes = Int(calendar.component(.minute, from: date)) - (4-i)
//        let sec = calendar.component(.minute, from: date).text
//        textlayer.string =  hour + ":" +  minutes.text  + ":" + sec
        textlayer.string =  newDateString;
        
//        textlayer.isWrapped = YES;
        textlayer.truncationMode = kCATruncationEnd;
        textlayer.foregroundColor = UIColor.whiteColor.CGColor;

        [[self layer] addSublayer:textlayer];

    }
    
    
}


- (void)prepreTextLayer:(int)initial:(float)decimal{
    for (int i = 0;i<6;i++) {
        
        CATextLayer *textlayer = [[CATextLayer alloc]init];

        textlayer.frame = CGRectMake(305, 22 + (i*30), 100, 40);
        textlayer.fontSize = 12;
        textlayer.alignmentMode = NSTextAlignmentLeft;
        
        
        textlayer.string = @"initialValue"; //.\(decimal)\(90 - (i * 15))"
//        textlayer.isWrapped = true;
        
        textlayer.truncationMode = kCATruncationEnd;
        textlayer.foregroundColor = UIColor.whiteColor.CGColor;

        [[self layer] addSublayer:textlayer];
    }
}

- (void)prepareTimeline:(NSMutableArray *)timelines :(int)initialValue :(int)decimal :(int)value{
    
    [self prepare];
    [self prepreTextLayer:initialValue :decimal];
    [self prepredashVer:timelines];
    if (value != nil) {
        [self prepareCurrentLine:value :initialValue :decimal];
    }
}

- (void)prepareCurrentLine:(int)value :(int)initialValue :(int)decimal{
    
    CALayer *line = [[CALayer alloc]init];
    line.backgroundColor = UIColor.orangeColor.CGColor;

    line.frame = CGRectMake(0, 210 - value, 300, 1);
    [[self layer] addSublayer:line];
    
    CATextLayer *textlayer = [[CATextLayer alloc]init];


    textlayer.frame = CGRectMake(310, 210 - value, 100, 40);
    textlayer.fontSize = 8;
    textlayer.alignmentMode = NSTextAlignmentLeft;
    textlayer.string = @"initialValue";
        //.\(decimal)\(value)";
//    textlayer.isWrapped = true
    textlayer.truncationMode = kCATruncationEnd;
    textlayer.foregroundColor = UIColor.orangeColor.CGColor;

    [[self layer] addSublayer:textlayer];
}

- (void)prepareCandles:(NSMutableArray *)candles {
    
    
    for (int i = 0;i<candles.count;i++) {
        
      CandleViewModel *candle = candles[i];
    
        CALayer *stick = [[CALayer alloc]init];
        
        if (candle.level == 0) {
            stick.backgroundColor = UIColor.redColor.CGColor;
        } else {
            stick.backgroundColor = UIColor.greenColor.CGColor;
        }


        stick.frame = CGRectMake(candle.position.x, candle.position.y, candle.width, candle.height);
        [[self layer] addSublayer:stick];

    }
}

@end
