//
//  XPListViewCell.m
//  DePoint
//
//  Created by apple on 16/8/6.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "XPListViewCell.h"

@implementation XPListViewCell
- (UIImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[UIImageView alloc] init];
        _iconIV.contentMode = UIViewContentModeScaleAspectFill;
        _iconIV.clipsToBounds = YES;
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(-10);
            make.top.equalTo(self.nameLb.mas_bottom).equalTo(10);
            make.left.equalTo(10);
            make.size.equalTo(CGSizeMake(100, 80)).priorityHigh();
        }];
    }
    return _iconIV;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font = [UIFont systemFontOfSize:12];
        _titleLb.numberOfLines = 4;
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.iconIV);
            make.left.equalTo(self.iconIV.mas_right).equalTo(10);
            make.right.equalTo(-5);
        }];
    }
    return _titleLb;
}

- (UILabel *)nameLb {
    if(_nameLb == nil) {
        _nameLb = [[UILabel alloc] init];
        _nameLb.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_nameLb];
        [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.top.equalTo(10);
            make.height.equalTo(25).priorityHigh();
        }];
    }
    return _nameLb;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    //去掉分割线。让cell不顶到头.
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        self.separatorInset = UIEdgeInsetsZero;
        self.layoutMargins = UIEdgeInsetsZero;
        self.preservesSuperviewLayoutMargins = NO;
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

   
}

@end