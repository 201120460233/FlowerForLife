//
//  UIViewController+NavigationBar.h
//  YZUser
//
//  Created by shuni on 2017/5/27.
//  Copyright © 2017年 shuni. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SNConfig.h"

@interface UIViewController (NavigationBar)

- (void)loadBarTitle:(NSString *)title;
- (void)loadBarTitle:(NSString*)title withTextColor:(UIColor *)color font:(CGFloat)font;
- (UIButton *)loadItemWithImage:(UIImage *)image target:(id)target action:(SEL)action position:(SNBarItemPostion)position;
- (NSArray *)loadItemWithImage1:(NSString *)img1 image2:(NSString *)img2 taeget:(id)target action1:(SEL)action1 action2:(SEL)action2 position:(SNBarItemPostion)position;
- (NSArray *)loadItemWithTitle1:(NSString *)title1 title2:(NSString *)title2 taeget:(id)target action1:(SEL)action1 action2:(SEL)action2 position:(SNBarItemPostion)position;
- (UIButton *)loadItemWithTitle:(NSString *)title textColor:(UIColor *)color font:(CGFloat)font target:(id)target action:(SEL)action position:(SNBarItemPostion)position;
- (void)loadItemWithCustomView:(UIView *)view position:(SNBarItemPostion)position;
- (UIButton *)loadItemWithNorImage:(NSString *)nImage selImage:(NSString *)sImage  target:(id)target action:(SEL)action position:(SNBarItemPostion)position;

//设置透明度,0.0为全透明，1.0为不透明,因为设置的adjuse的选项为NO，所以设置透明之后，需要把视图往上挪
- (void)setBarAlpha:(float)alpha;

- (void)closeLeftPanBack;
- (void)openLeftPanBack;

@end
