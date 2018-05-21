//
//  SNMyVC.m
//  bet305
//
//  Created by shuni on 2018/5/17.
//  Copyright © 2018年 shuni. All rights reserved.
//

#import "SNMyVC.h"
#import "SNHeader.h"
#import "SNDailyVC.h"

static NSString * const SNMyCell = @"SNMyCell";

@interface SNMyVC ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *titles;

@end

@implementation SNMyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self.titles addObjectsFromArray:@[@[@"笔记", @"收藏"], @[@"账号", @"设置", @"关于"]]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark - Lazy load
- (NSArray *)titles {
    if (!_titles) {
        _titles = [[NSMutableArray alloc] init];
    }
    return _titles;
}

#pragma mark -
#pragma mark - Private method
- (void)setupUI {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 200)];
    [self.view addSubview:view];
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 200)];
    imgView.image = [UIImage imageNamed:@"me_bg"];
    imgView.contentMode = UIViewContentModeScaleAspectFit;
    [view addSubview:imgView];
    
    UIImageView *iconImgView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth / 2 - 40, 60, 80, 80)];
    iconImgView.image = [UIImage imageNamed:@"head"];
    [view addSubview:iconImgView];
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 150, kScreenWidth, 20)];
    nameLabel.text = @"shuni";
    nameLabel.textColor = [UIColor whiteColor];
    nameLabel.font = [UIFont systemFontOfSize:16];
    nameLabel.textAlignment = NSTextAlignmentCenter;
    [view addSubview:nameLabel];
    
    self.tableView = [self addNormalListWithStyle:UITableViewStylePlain];
    self.tableView.frame = CGRectMake(0, 200, kScreenWidth, kScreenHeight - 200);
    self.tableView.rowHeight = 56;
    self.tableView.scrollEnabled = NO;
    self.tableView.backgroundColor = kYZBackgroundColor;
    self.tableView.separatorColor = UIColorFromRGB(0x16091B);
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:SNMyCell];
    [self.tableView reloadData];
}

#pragma mark -
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.titles.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.titles[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SNMyCell];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SNMyCell];
    }
    cell.backgroundColor = UIColorFromRGB(0x281c2d);
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_arrow_r"]];
    cell.textLabel.text = [[self.titles objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont systemFontOfSize:18];
    return cell;
}

#pragma mark -
#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    SNBaseVC *vc = [[SNBaseVC alloc] init];
    if (indexPath.section == 0 && indexPath.row == 0) {
        vc = [[SNDailyVC alloc] init];
    }
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return section == 0 ? .0001 : 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return .0001;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(0, 0, kScreenWidth, 10);
    view.backgroundColor = kYZBackgroundColor;
    return view;
}

@end
