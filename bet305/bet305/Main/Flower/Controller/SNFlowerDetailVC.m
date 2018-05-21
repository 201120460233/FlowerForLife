//
//  SNFlowerDetailVC.m
//  bet305
//
//  Created by shuni on 2018/5/21.
//  Copyright © 2018年 shuni. All rights reserved.
//

#import "SNFlowerDetailVC.h"
#import "SNHeader.h"
#import "LCBannerView.h"

static NSString * const SNFlowerDetailCell = @"SNFlowerDetailCell";

@interface SNFlowerDetailVC ()<LCBannerViewDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) LCBannerView *bannerView;
@property (nonatomic, strong) NSMutableArray *bannerArray;

@end

@implementation SNFlowerDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadBarTitle:self.flowerModel.name];
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark - Lazy Load
- (NSMutableArray *)bannerArray {
    if (!_bannerArray) {
        _bannerArray = [NSMutableArray array];
    }
    return _bannerArray;
}

#pragma mark -
#pragma mark - Private method
- (void)setupUI {
    self.tableView = [self addNormalListWithStyle:UITableViewStyleGrouped];
    self.tableView.frame = self.view.bounds;
    self.tableView.backgroundColor = kYZBackgroundColor;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view);
    }];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:SNFlowerDetailCell];
    [self.tableView reloadData];
    [self createTableHeaderView];
}

- (void)createTableHeaderView {
    CGRect rect = CGRectMake(0, 0, kScreenWidth, 240);
    self.bannerView = [LCBannerView bannerViewWithFrame:rect delegate:self imageURLs:self.flowerModel.imgArray placeholderImageName:@"" timeInterval:3. currentPageIndicatorTintColor:[UIColor whiteColor] pageIndicatorTintColor:[UIColor grayColor]];
    [self.view addSubview:self.bannerView];
    self.tableView.tableHeaderView = self.bannerView;
}

#pragma mark -
#pragma mark - UITableViwDatasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.flowerModel.infoArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SNFlowerDetailCell];
    cell.backgroundColor = UIColorFromRGB(0x281c2d);
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSDictionary *dic = [self.flowerModel.infoArray objectAtIndex:indexPath.section];
    cell.textLabel.text = [dic allValues][0];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.font = [UIFont systemFontOfSize:18];
    return cell;
}

#pragma mark -
#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 44)];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, kScreenWidth - 20, 44)];
    label.text = [self.flowerModel.infoArray[section] allKeys][0];
    label.textColor = [UIColor greenColor];
    label.font = [UIFont systemFontOfSize:18];
    [headView addSubview:label];
    
    return headView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44;
}

@end
