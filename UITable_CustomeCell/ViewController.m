//
//  HeaderViewCell.m
//  UITable_CustomeCell
//
//  Created by Godwin A on 24/12/21.
//  Copyright © 2021 YOUNGSIC KIM. All rights reserved.
//

#import "ViewController.h"
#import "ChartViewController.h"

@interface ViewController ()
@end

@implementation ViewController {
    NSArray *currencyTitle;
    NSMutableArray *askvalues;
    NSMutableArray *bidValues;
    
    NSMutableArray *nextBidValues;
    NSMutableArray *nextAskvalues;
    NSMutableArray *lowHighBid;
    NSMutableArray *lowHighAsk;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    currencyTitle = [NSArray arrayWithObjects:@"EURUSD",@"XAGUSD",@"GBPUSD",@"USDJPY",@"LTCUSD" ,@"ETHUSD" ,@"EURAUD",@"EURCHF" ,@"EURGBP",@"EURJPY",@"GBPAUD",nil];
    
    
    askvalues = [NSMutableArray array];
    bidValues = [NSMutableArray array];
    lowHighAsk = [NSMutableArray array];
    lowHighBid = [NSMutableArray array];

    for (NSInteger i = 0; i <= [currencyTitle count]; i++) {
        NSInteger ask = 11111 + arc4random() % (99999 - 11111);
        NSInteger bid = 11111 + arc4random() % (99999 - 11111);
        [askvalues addObject:[NSNumber numberWithInteger:ask]];
        [bidValues addObject:[NSNumber numberWithInteger:bid]];
        [lowHighAsk addObject:[NSNumber numberWithInt:0]];
        [lowHighBid addObject:[NSNumber numberWithInt:0]];
    }
    [_tableview setDelegate:self];
    [_tableview setDataSource:self];
}


- (void)viewDidAppear:(BOOL)animated{
    [self handleTimer];
}


- (void)handleTimer {

    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(eventToFire:) userInfo:nil repeats:YES]; // Fire every 4 seconds.

}

-(BOOL) randomBool
{
    int tmp = (arc4random() % 10);
    if(tmp % 2 == 0)
        return YES;
    return NO;
}

- (void)eventToFire:(NSTimer*)timer {
    

    nextAskvalues = [NSMutableArray array];
    nextBidValues = [NSMutableArray array];
    lowHighBid = [NSMutableArray array];
    lowHighAsk = [NSMutableArray array];

    for (NSInteger i = 0; i <= [currencyTitle count]; i++) {
        
        NSInteger ask = 11111 + arc4random() % (99999 - 11111);
        NSInteger bid = 11111 + arc4random() % (99999 - 11111);
        
        BOOL randomORNotBid = (self.randomBool);
        BOOL randomORNotAsk = (self.randomBool);
        
        if (randomORNotAsk) {
            [nextAskvalues addObject:[NSNumber numberWithInteger:[askvalues[i] integerValue]] ];
        } else {
            [nextAskvalues addObject:[NSNumber numberWithInteger:ask]];
        }
        
        if (randomORNotBid) {
            [nextBidValues addObject:[NSNumber numberWithInteger:[bidValues[i]integerValue]]];
        } else {
            [nextBidValues addObject:[NSNumber numberWithInteger:bid]];
        }
        

        
        NSInteger bidPrevious  = [bidValues[i] integerValue];
        NSInteger askPrevious  = [askvalues[i] integerValue];

        if (randomORNotBid) {
            [lowHighBid insertObject:[NSNumber numberWithInt:0] atIndex:i];
        } else if (bidPrevious > bid) {
            [lowHighBid insertObject:[NSNumber numberWithInt:1] atIndex:i];
        } else {
            [lowHighBid insertObject:[NSNumber numberWithInt:2] atIndex:i];
        }
        
        
        if (randomORNotAsk) {
            [lowHighAsk insertObject:[NSNumber numberWithInt:0] atIndex:i];
        } else if (askPrevious > ask) {
            [lowHighAsk insertObject:[NSNumber numberWithInt:1] atIndex:i];
        } else {
            [lowHighAsk insertObject:[NSNumber numberWithInt:2] atIndex:i];
        }
    }
    
    
     bidValues = nextBidValues;
     askvalues = nextAskvalues;
    [_tableview reloadData];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [currencyTitle count] + 1;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ChartViewController *charVC =
        [[ChartViewController alloc]
            initWithNibName:@"ChartViewController" bundle:nil];
    
    __weak typeof(self) weakSelf = self;
    charVC.title = [currencyTitle objectAtIndex:indexPath.row-1];
    [weakSelf.navigationController pushViewController:charVC animated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        static NSString *headercellString = @"HeaderViewCell";
        UITableViewCell *headercell = (CustomCell *)[tableView dequeueReusableCellWithIdentifier:headercellString];
        if(headercell == nil) {
            NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"HeaderViewCell" owner:self options:nil];
            headercell = [nib objectAtIndex:0];
        }
        return  headercell;
    }
    static NSString *simpleTableIdentifier = @"CustomCell";

    
    
    CustomCell *cell = (CustomCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if(cell == nil) {
        NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"CustomCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    
    
    cell.Label_subject.text = [currencyTitle objectAtIndex:indexPath.row-1];
    
    if (indexPath.row-1 == 1) {
        cell.ImageView_thumbnail.image = [UIImage imageNamed:[NSString stringWithFormat:@"currencyC"]];

    } else {
        cell.ImageView_thumbnail.image = [UIImage imageNamed:[NSString stringWithFormat:@"currencyM"]];
    }

    
    NSString *bidText = [NSString stringWithFormat:@"%@", bidValues[indexPath.row-1]];
    NSString *askText = [NSString stringWithFormat:@"%@", askvalues[indexPath.row-1]];
        
    
    cell.bidThirdLAbel.text = [bidText substringFromIndex: [bidText length] - 1];
    cell.askThirdLabel.text =  [askText substringFromIndex: [askText length] - 1];

    bidText = [bidText substringToIndex:[bidText length] - 1];
    askText = [askText substringToIndex:[askText length] - 1];

    
    NSString *midValueAsk = [askText substringFromIndex: [askText length] - 2];
    NSString *midValueBid = [bidText substringFromIndex: [bidText length] - 2];
    
    cell.bidSecondLabel.text = [@"." stringByAppendingString:midValueBid];
    cell.askSecond.text =  [@"." stringByAppendingString:midValueAsk];
    
    bidText = [bidText substringToIndex:[bidText length] - 2];
    askText = [askText substringToIndex:[askText length] - 2];

    cell.bidFirstLabel.text = [bidText substringFromIndex: [bidText length] - 2];
    cell.askFirstLabel.text =  [askText substringFromIndex: [askText length] - 2];
    
    
    if ([lowHighAsk[indexPath.row-1] integerValue] == 0) {
        cell.askLabel.backgroundColor = UIColor.darkGrayColor;
    } else if ([lowHighAsk[indexPath.row-1] integerValue] == 1) {
        cell.askLabel.backgroundColor = UIColor.redColor;
    } else {
        cell.askLabel.backgroundColor = UIColor.greenColor;
    }
    
    
    if ([lowHighBid[indexPath.row-1] integerValue] == 0) {
        cell.Label_subtitle.backgroundColor = UIColor.darkGrayColor;
    } else if ([lowHighBid[indexPath.row-1] integerValue] == 1) {
        cell.Label_subtitle.backgroundColor = UIColor.redColor;
    } else {
        cell.Label_subtitle.backgroundColor = UIColor.greenColor;
    }
    
    return cell;
}

@end
