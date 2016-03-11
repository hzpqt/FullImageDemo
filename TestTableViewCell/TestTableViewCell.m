//
//  TestTableViewCell.m
//  FullImageDemo
//
//  Created by pqt on 16/3/11.
//  Copyright © 2016年 pqt. All rights reserved.
//

#import "TestTableViewCell.h"

@interface TestTableViewCell ()

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation TestTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setCellContent:(UIImage *)image
{
    self.imageView.image = image;
    
    CGFloat scaleSize = image.size.width/image.size.height;
    CGRect oldFrame = self.imageView.frame;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.imageView setFrame:CGRectMake(oldFrame.origin.x, 0, scaleSize * oldFrame.size.height, oldFrame.size.height)];
        [self setNeedsLayout];
    });

}

@end
