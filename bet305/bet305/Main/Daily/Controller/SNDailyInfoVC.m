//
//  SNDailyInfoVC.m
//  bet305
//
//  Created by shuni on 2018/5/17.
//  Copyright © 2018年 shuni. All rights reserved.
//

#import "SNDailyInfoVC.h"
#import "SNHeader.h"
#import "SNDailyEditVC.h"

@interface SNDailyInfoVC ()

@end

@implementation SNDailyInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadBarTitle:@"笔记详情"];
    [self loadItemWithImage:[UIImage imageNamed:@""] target:self action:@selector(editDaily) position:SNBarItemPostionRight];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark - Private method
- (void)editDaily {
    SNDailyEditVC *vc = [[SNDailyEditVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}



@end
