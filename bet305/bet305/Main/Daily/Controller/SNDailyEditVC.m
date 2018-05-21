//
//  SNDailyEditVC.m
//  bet305
//
//  Created by shuni on 2018/5/17.
//  Copyright © 2018年 shuni. All rights reserved.
//

#import "SNDailyEditVC.h"
#import "SNHeader.h"
#import "YYTextView.h"

@interface SNDailyEditVC ()<YYTextViewDelegate>

@end

@implementation SNDailyEditVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadItemWithTitle:@"保存" textColor:[UIColor whiteColor] font:18 target:self action:@selector(saveDaily) position:SNBarItemPostionRight];
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark - Private method
- (void)setupUI {
    YYTextView *textView = [[YYTextView alloc] initWithFrame:CGRectMake(15, 15, kScreenWidth-30, kScreenHeight - 200)];
    textView.layer.cornerRadius = 4.f;
    textView.layer.masksToBounds = YES;
    textView.layer.borderWidth = 1.f;
    textView.layer.borderColor = [UIColor whiteColor].CGColor;
    textView.delegate = self;
    textView.textColor = [UIColor whiteColor];
    textView.placeholderTextColor = [UIColor whiteColor];
    textView.placeholderText = self.curDaily.length > 0 ? self.curDaily : @"快来记录下你的专属日记吧～";
    [self.view addSubview:textView];
}

- (void)saveDaily {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
