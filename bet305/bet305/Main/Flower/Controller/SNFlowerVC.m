//
//  SNFlowerVC.m
//  bet305
//
//  Created by shuni on 2018/5/17.
//  Copyright © 2018年 shuni. All rights reserved.
//

#import "SNFlowerVC.h"
#import "SNHeader.h"
#import "SNFlowerLayout.h"
#import "SNFlowerCollectionViewCell.h"
#import "SNFlowerModel.h"
#import "SNFlowerDetailVC.h"

@interface SNFlowerVC ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation SNFlowerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Flowers" ofType:@".plist"];
    NSArray *arr = [NSArray arrayWithContentsOfFile:path];
    for (NSDictionary *dic in arr) {
        SNFlowerModel *model = [[SNFlowerModel alloc] initWithDic:dic];
        [self.dataArray addObject: model];
    }
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark - Lazy load
- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

#pragma mark -
#pragma mark - Private method
- (void)setupUI {
    SNFlowerLayout *layout = [[SNFlowerLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.itemCount = (int)self.dataArray.count;
    layout.sectionInset = UIEdgeInsetsMake(20, 10, 20, 10);
//    layout.itemSize = CGSizeMake(150, 196);
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = kYZBackgroundColor;
    [self.collectionView registerClass:[SNFlowerCollectionViewCell class] forCellWithReuseIdentifier:@"MyCell"];
    [self.view addSubview:self.collectionView];
}

#pragma mark -
#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SNFlowerCollectionViewCell *myCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyCell" forIndexPath:indexPath];
    [myCell setBackgroundColor:[UIColor whiteColor]];
    [myCell configFlowerModel:self.dataArray[indexPath.row]];
    return myCell;
}

#pragma mark -
#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    SNFlowerDetailVC *vc = [[SNFlowerDetailVC alloc] init];
    vc.flowerModel = [self.dataArray objectAtIndex:indexPath.row];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

////UICollectionViewDelegateFlowLayout去改变单元格大小:
//-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    
//    CGFloat height=100+(arc4random()%100);
//    return  CGSizeMake(100, height);
//    
//}

@end
