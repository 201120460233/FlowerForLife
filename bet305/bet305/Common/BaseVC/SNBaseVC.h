//
//  SNBaseVC.h
//  bet305
//
//  Created by shuni on 2018/5/17.
//  Copyright © 2018年 shuni. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SNBaseVC : UIViewController

@property (nonatomic, assign) BOOL isFirstLoad;

//统一的返回按钮
- (UIButton *)loadBackBtn;
- (UITableView *)addNormalList;
- (UITableView *)addNormalListWithStyle:(UITableViewStyle)style;
- (UIScrollView *)addNormalScrollView;

@end
