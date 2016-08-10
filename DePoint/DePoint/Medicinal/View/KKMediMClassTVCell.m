//
//  KKMediMClassTVCell.m
//  DePoint
//
//  Created by kaki on 16/8/8.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKMediMClassTVCell.h"

@implementation KKMediMClassTVCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


- (UILabel *)label {
    if(_label == nil) {
        _label = [[UILabel alloc] init];
        [self.contentView addSubview:_label];
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(10);
            make.bottom.mas_equalTo(-10);
            make.centerY.mas_equalTo(0);
        }];
    }
    return _label;
}

@end
