//
//  XPDetailCell.m
//  DePoint
//
//  Created by apple on 16/8/6.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "XPDetailCell.h"

@implementation XPDetailCell
- (UILabel *)nameLb {
    if(_nameLb == nil) {
        _nameLb = [[UILabel alloc] init];
        _nameLb.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:_nameLb];
        [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.top.equalTo(5);
        }];
    }
    return _nameLb;
}
- (UIImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[UIImageView alloc] init];
        _iconIV.contentMode = UIViewContentModeScaleAspectFill;
        _iconIV.clipsToBounds = YES;
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.top.equalTo(self.nameLb.mas_bottom).equalTo(0);
            make.size.equalTo(CGSizeMake(200, 140)).priorityHigh();
        }];
    }
    return _iconIV;
}

- (UITextView *)textLb {
    CGFloat height = self.contentView.frame.size.height -185 ;
    if(_textLb == nil) {
        _textLb = [[UITextView alloc] init];
        _textLb.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_textLb];
        [_textLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(self.contentView.mas_width);
            make.top.equalTo(self.iconIV.mas_bottom);
            make.left.equalTo(0);
            make.height.equalTo(height);
        }];
    }
    return _textLb;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end