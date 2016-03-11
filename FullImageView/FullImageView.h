//
//  FullImageView.h
//  HXCoach
//
//  Created by pqt on 16/3/9.
//  Copyright © 2016年 hexin. All rights reserved.
//

#import <UIKit/UIKit.h>

//获取当前设备对应的height
#define Screen_height (MAX([[UIScreen mainScreen] bounds].size.height, [[UIScreen mainScreen] bounds].size.width))
//获取当前设备对应的width
#define Screen_width (MIN([[UIScreen mainScreen] bounds].size.height, [[UIScreen mainScreen] bounds].size.width))

@interface FullImageView : UIView

-(instancetype)initWithFrame:(CGRect)frame withImage:(UIImage *)img withTarget:(id)target withSEL:(SEL)selctor withOriginFrame:(CGRect)orginFrame;

-(void)showInView:(UIView *)superView;
-(void)hiddeSelf;
@end
