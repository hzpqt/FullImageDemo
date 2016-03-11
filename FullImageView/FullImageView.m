//
//  FullImageView.m
//  HXCoach
//
//  Created by pqt on 16/3/9.
//  Copyright © 2016年 hexin. All rights reserved.
//

#import "FullImageView.h"
#import "HexColors.h"

@interface FullImageView ()

@property (strong,nonatomic) UIImageView *imageView;
@property (strong,nonatomic) UIButton *lookOriginalImageButton;
@property (assign,nonatomic) CGRect imageViewOriginFrame;
@property (assign,nonatomic) CGFloat scaleSizeY;

@end

@implementation FullImageView

-(instancetype)initWithFrame:(CGRect)frame withImage:(UIImage *)img withTarget:(id)target withSEL:(SEL)selctor withOriginFrame:(CGRect)orginFrame
{
    if (self = [super initWithFrame:frame])
    {
        CGFloat scaleSize = img.size.height/img.size.width;
        self.scaleSizeY = scaleSize;
        self.imageViewOriginFrame = orginFrame;
        
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, Screen_width, Screen_width * scaleSize)];
        self.imageView.image = img;
        self.imageView.contentMode=UIViewContentModeScaleAspectFit;
        [self addSubview:self.imageView];
        
        self.lookOriginalImageButton  = [[UIButton alloc] initWithFrame:CGRectMake(Screen_width/2 - 40, Screen_height - 45, 80, 20)];
        self.lookOriginalImageButton.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8f];
        [self.lookOriginalImageButton setTitle:@"查看原图" forState:UIControlStateNormal];
        [self.lookOriginalImageButton setTitleColor:[UIColor colorWithHexString:@"cccccc"] forState:UIControlStateNormal];
        [self.lookOriginalImageButton.titleLabel setFont:[UIFont systemFontOfSize:10.f]];
        self.lookOriginalImageButton.tag = 9999;
        self.lookOriginalImageButton.layer.cornerRadius = 10.f;
        self.lookOriginalImageButton.layer.masksToBounds = YES;
        [self.lookOriginalImageButton addTarget:target action:selctor forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.lookOriginalImageButton];
        
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.9f];
        
        
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGestureZoomOut:)]];
    }
    
    return self;
}

-(void)showInView:(UIView *)superView
{
    [superView addSubview:self];
    
    self.alpha = 0.2;
    
    self.imageView.frame = self.imageViewOriginFrame;
    
    [UIView animateWithDuration:0.5 animations:^{

        self.alpha = 1;
        self.imageView.frame = CGRectMake(0, (Screen_height - Screen_width * self.scaleSizeY) / 2, Screen_width, Screen_width * self.scaleSizeY);

    } completion:^(BOOL finished) {
        self.lookOriginalImageButton.hidden = NO;
    }];
}

-(void)hiddeSelf
{
    self.lookOriginalImageButton.hidden = YES;
    
    self.backgroundColor = [UIColor clearColor];
    
    [UIView animateWithDuration:0.5 animations:^{
        self.imageView.frame = self.imageViewOriginFrame;
        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

#pragma mark 缩小图片手势
-(void)handleTapGestureZoomOut:(UITapGestureRecognizer *)tap
{
    [self hiddeSelf];
}
@end
