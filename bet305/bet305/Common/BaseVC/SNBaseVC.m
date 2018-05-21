//
//  SNBaseVC.m
//  bet305
//
//  Created by shuni on 2018/5/17.
//  Copyright © 2018年 shuni. All rights reserved.
//

#import "SNBaseVC.h"
#import "SNDefine.h"
#import "SNCommonTool.h"
#import "UIViewController+NavigationBar.h"

@interface SNBaseVC ()<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

@end

@implementation SNBaseVC

- (void)dealloc {
    NSLog(@"%@ dealloc",[self class]);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    self.isFirstLoad = YES;
    self.view.backgroundColor = kYZBackgroundColor;
    self.automaticallyAdjustsScrollViewInsets = NO;
    //子界面默认加载导航栏返回按钮
    if (self.navigationController && self.navigationController.viewControllers.firstObject != self) {
        [self loadBackBtn];
    }
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

#pragma mark -
#pragma mark - Public method
//统一的返回按钮
- (UIButton *)loadBackBtn {
    NSAssert(self.navigationController, @"此界面没有导航栏!");
    UIButton *btn = [self loadItemWithImage:[UIImage imageNamed:@"return_b"] target:self action:@selector(backClick:) position:SNBarItemPostionLeft];
    return btn;
}

- (UITableView *)addNormalList {
    UITableView *list = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    if ([[SNCommonTool sharedYZCommonTools] getIOSVersion].floatValue >= 11.0) {
        list.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    list.scrollsToTop = YES;
    list.dataSource = self;
    list.delegate = self;
    list.showsHorizontalScrollIndicator = NO;
    list.showsVerticalScrollIndicator = NO;
    list.keyboardDismissMode = UIScrollViewKeyboardDismissModeInteractive;
    list.backgroundColor = [UIColor whiteColor];
    list.separatorColor = kYZCellSeparatorColor;
    list.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:list];
    return list;
}

- (UITableView *)addNormalListWithStyle:(UITableViewStyle)style {
    UITableView *list = [[UITableView alloc] initWithFrame:CGRectZero style:style];
    if ([[SNCommonTool sharedYZCommonTools] getIOSVersion].floatValue >= 11.0) {
        list.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    list.scrollsToTop = YES;
    list.dataSource = self;
    list.delegate = self;
    list.showsHorizontalScrollIndicator = NO;
    list.showsVerticalScrollIndicator = NO;
    list.keyboardDismissMode = UIScrollViewKeyboardDismissModeInteractive;
    list.backgroundColor = [UIColor whiteColor];
    list.separatorColor = kYZCellSeparatorColor;
    list.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:list];
    return list;
}

- (UIScrollView *)addNormalScrollView {
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
    if ([[SNCommonTool sharedYZCommonTools] getIOSVersion].floatValue >= 11.0) {
        scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    scrollView.scrollsToTop = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.keyboardDismissMode = UIScrollViewKeyboardDismissModeInteractive;
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    return scrollView;
}

#pragma mark -
#pragma mark - Private method
- (void)backClick:(UIButton *)btn {
    if (self.navigationController.viewControllers.firstObject == self) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma mark -
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

#pragma mark -
#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.00001f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.00001f;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
    return view;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
    return view;
}

#pragma mark -
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
}

@end
