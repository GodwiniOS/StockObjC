//
//  HeaderViewCell.m
//  UITable_CustomeCell
//
//  Created by Godwin A on 22/12/21.
//  Copyright © 2021 YOUNGSIC KIM. All rights reserved.
//

#ifndef CustomCell_h
#define CustomCell_h


#endif /* CustomCell_h */

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell {
    
}

@property (strong, nonatomic) IBOutlet UIImageView *ImageView_thumbnail;
@property (strong, nonatomic) IBOutlet UILabel *Label_subject;
@property (strong, nonatomic) IBOutlet UILabel *Label_subtitle;
@property (strong, nonatomic) IBOutlet UILabel *askLabel;

@property (weak, nonatomic) IBOutlet UILabel *bidFirstLabel;
@property (weak, nonatomic) IBOutlet UILabel *bidThirdLAbel;
@property (weak, nonatomic) IBOutlet UILabel *bidSecondLabel;

@property (weak, nonatomic) IBOutlet UILabel *askFirstLabel;
@property (weak, nonatomic) IBOutlet UILabel *askSecond;
@property (weak, nonatomic) IBOutlet UILabel *askThirdLabel;

@end
