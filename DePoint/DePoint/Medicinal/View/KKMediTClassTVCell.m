//
//  KKMediTClassTVCell.m
//  DePoint
//
//  Created by kaki on 16/8/8.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKMediTClassTVCell.h"

@implementation KKMediTClassTVCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (UIButton *)firstBt {
    if(_firstBt == nil) {
        _firstBt = [[UIButton alloc] init];
        [self.contentView addSubview:_firstBt];
        [_firstBt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_firstBt setBackgroundColor:[UIColor greenColor]];
        [_firstBt bk_addEventHandler:^(id sender) {
            [self.KKCellClickDelgate cellClickIndex:0];
        } forControlEvents:UIControlEventTouchUpInside];
        [_firstBt mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(100, 30)).priorityHigh();
            make.bottom.mas_equalTo(-10);
        }];
    }
    return _firstBt;
}

@end
