//
//  SNHomeVC.m
//  bet305
//
//  Created by shuni on 2018/5/18.
//  Copyright © 2018年 shuni. All rights reserved.
//

#import "SNHomeVC.h"
#import "SNHeader.h"
#import "LCBannerView.h"

static NSString * const SNHomeCell = @"SNHomeCell";

@interface SNHomeVC ()<LCBannerViewDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) LCBannerView *bannerView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) NSMutableArray *bannerArray;

@end

@implementation SNHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Home" ofType:@".plist"];
    NSArray *arr = [NSArray arrayWithContentsOfFile:path];
    [self.dataArray addObjectsFromArray:arr];
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark - Lazy Load
- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

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
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:SNHomeCell];
    [self.tableView reloadData];
    [self createTableHeaderView];
}

- (void)createTableHeaderView {
    CGRect rect = CGRectMake(0, 0, kScreenWidth, 240);
    NSArray *imgs = @[@"http://pic1.huashichang.com/2018/0519/21/5b0020a4f1733_200_140.jpg", @"http://pic1.huashichang.com/2018/0519/21/5b0020a5771aa_200_140.jpg", @"http://pic1.huashichang.com/2018/0519/21/5b0020a655aa1_200_140.jpg", @"http://pic1.huashichang.com/2018/0519/21/5b0020a6c8196_200_140.jpg", @"http://pic1.huashichang.com/2018/0519/21/5b0020a91f019_200_140.jpg", @"http://pic1.huashichang.com/2018/0519/21/5b0020ab20ddc_200_140.jpg", @"http://pic1.huashichang.com/2018/0519/21/5b0020ae72f8a_200_140.jpg", @"http://pic1.huashichang.com/2018/0519/21/5b0020b11ffe7_200_140.jpg"];
    self.bannerView = [LCBannerView bannerViewWithFrame:rect delegate:self imageURLs:imgs  placeholderImageName:@"" timeInterval:3. currentPageIndicatorTintColor:[UIColor whiteColor] pageIndicatorTintColor:[UIColor grayColor]];
    [self.view addSubview:self.bannerView];
    self.tableView.tableHeaderView = self.bannerView;
}

#pragma mark -
#pragma mark - UITableViwDatasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.dataArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSDictionary *dic = [self.dataArray objectAtIndex:section];
    NSString *key = [[dic allKeys] objectAtIndex:0];
    return [dic[key] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SNHomeCell];
    cell.backgroundColor = UIColorFromRGB(0x281c2d);
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = @"cell";
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
    label.text = [[[self.dataArray objectAtIndex:section] allKeys] objectAtIndex:0];
    label.textColor = [UIColor greenColor];
    label.font = [UIFont systemFontOfSize:18];
    [headView addSubview:label];
    
    return headView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44;
}

@end
