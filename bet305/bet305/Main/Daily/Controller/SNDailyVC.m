//
//  SNDailyVC.m
//  bet305
//
//  Created by shuni on 2018/5/17.
//  Copyright © 2018年 shuni. All rights reserved.
//

#import "SNDailyVC.h"
#import "SNHeader.h"
#import "SNDailyInfoVC.h"
#import "SNDailyEditVC.h"

static NSString * const SNDailyCell = @"SNDailyCell";

@interface SNDailyVC ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation SNDailyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadBarTitle:@"笔记"];
    [self loadItemWithImage:[UIImage imageNamed:@"add"] target:self action:@selector(addNewDaily) position:SNBarItemPostionRight];
    [self setupUI];
    [self.dataArray addObjectsFromArray:@[@"笔记1", @"笔记2", @"笔记3", @"笔记4", @"笔记5"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark - Lazy load
- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}

#pragma mark -
#pragma mark - Private method
- (void)setupUI {
    self.tableView = [self addNormalListWithStyle:UITableViewStylePlain];
    self.tableView.frame = self.view.bounds;
    self.tableView.rowHeight = 86;
    self.tableView.backgroundColor = kYZBackgroundColor;
    self.tableView.separatorColor = UIColorFromRGB(0x16091B);
    [self.tableView reloadData];
}

- (void)addNewDaily {
    SNDailyEditVC *vc = [[SNDailyEditVC alloc] init];
    [vc loadBarTitle:@"新建笔记"];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark -
#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SNDailyCell];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:SNDailyCell];
    }
    cell.backgroundColor = UIColorFromRGB(0x281c2d);
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_arrow_r"]];
    cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.text = @"20分钟前";
    cell.textLabel.font = [UIFont systemFontOfSize:18];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:13];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

#pragma mark -
#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    SNDailyInfoVC *vc = [[SNDailyInfoVC alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
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

- (nullable NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"删除";
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.dataArray removeObjectAtIndex:indexPath.row];
    [tableView reloadData];
}

@end
