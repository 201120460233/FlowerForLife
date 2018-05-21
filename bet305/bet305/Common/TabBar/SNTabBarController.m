//
//  SNTabBarController.m
//  bet305
//
//  Created by shuni on 2018/5/17.
//  Copyright © 2018年 shuni. All rights reserved.
//

#import "SNTabBarController.h"
#import "SNHomeVC.h"
#import "SNFlowerVC.h"
#import "SNDailyVC.h"
#import "SNMyVC.h"
#import "SNNavigationController.h"
#import "SNDefine.h"

@interface SNTabBarController ()<UITabBarControllerDelegate>

@end

@implementation SNTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    self.tabBar.barTintColor = kYZTabBarColor;
    self.tabBar.tintColor = kYZTabBarTextSelColor;
    [self addChildViewControllers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addChildViewControllers {
    SNHomeVC *home = [[SNHomeVC alloc] init];
    [self addChildVC:home title:@"首页" norImg:@"tabBar_me_click_icon" selImg:@"tabBar_me_icon"];
    
    SNDailyVC *daily = [[SNDailyVC alloc] init];
    [self addChildVC:daily title:@"书单" norImg:@"tabBar_new_click_icon" selImg:@"tabBar_new_icon"];
    
    SNFlowerVC *flower = [[SNFlowerVC alloc] init];
    [self addChildVC:flower title:@"养花" norImg:@"tabBar_new_click_icon" selImg:@"tabBar_new_icon"];
    
    SNMyVC *me = [[SNMyVC alloc] init];
    [self addChildVC:me title:@"我的" norImg:@"tabBar_friendTrends_click_icon" selImg:@"tabBar_friendTrends_icon"];
}


- (void)addChildVC:(UIViewController *)vc title:(NSString *)title norImg:(NSString *)nImg selImg:(NSString *)sImg {
    SNNavigationController *nav = [[SNNavigationController alloc] initWithRootViewController:vc];
    //如果同时有 navigationbar 和 tabbar 的时候最好分别设置它们的 title
    vc.navigationItem.title = title;
    nav.tabBarItem.title = title;
    nav.tabBarItem.image = [UIImage imageNamed:nImg];
    nav.tabBarItem.selectedImage = [UIImage imageNamed:sImg];
    
    [self addChildViewController:nav];
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    return YES;
}

@end
