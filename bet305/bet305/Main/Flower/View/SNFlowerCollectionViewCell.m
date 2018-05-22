//
//  SNFlowerCollectionViewCell.m
//  bet305
//
//  Created by shuni on 2018/5/21.
//  Copyright © 2018年 shuni. All rights reserved.
//

#import "SNFlowerCollectionViewCell.h"
#import "UIImageView+WebCache.h"

@interface SNFlowerCollectionViewCell()

@property (strong, nonatomic) UIImageView *imgView;
@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UILabel *aliasLabel;
@property (strong, nonatomic) UILabel *descLabel;

@end

@implementation SNFlowerCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, self.frame.size.width - 20, 120)];
//        _imgView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:_imgView];
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 126, self.frame.size.width - 20, 20)];
        _nameLabel.font = [UIFont systemFontOfSize:15];
        _nameLabel.backgroundColor = [UIColor purpleColor];
        [self.contentView addSubview:_nameLabel];
        
        _aliasLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 150, self.frame.size.width - 20, 20)];
        _aliasLabel.textColor = [UIColor blueColor];
        _aliasLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_aliasLabel];
        
        _descLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 174, self.frame.size.width - 20, self.frame.size.height - 10 - 174)];
        _descLabel.numberOfLines = 0;
        _descLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _descLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_descLabel];
    }
    return self;
}

- (void)configFlowerModel:(SNFlowerModel *)fModel {
    NSURL *url = [NSURL URLWithString:fModel.img];
    [self.imgView sd_setImageWithURL:url];
    self.nameLabel.text = fModel.name;
    self.aliasLabel.text = [@"别名：" stringByAppendingString:fModel.alias];
    self.descLabel.text = fModel.desc;
}

@end
