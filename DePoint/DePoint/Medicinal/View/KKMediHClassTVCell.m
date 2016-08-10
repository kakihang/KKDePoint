//
//  KKMediHClassTVCell.m
//  DePoint
//
//  Created by kaki on 16/8/8.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKMediHClassTVCell.h"

@implementation KKMediHClassTVCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


- (UIButton *)medFirstBt {
    if(_medFirstBt == nil) {
        _medFirstBt = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.contentView addSubview:_medFirstBt];
        [_medFirstBt setBackgroundColor:[UIColor greenColor]];
        [_medFirstBt mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(80, 30));
        }];
        [self medFirstLb];
    }
    return _medFirstBt;
}

- (UILabel *)medFirstLb {
    if(_medFirstLb == nil) {
        _medFirstLb = [[UILabel alloc] init];
        [self.contentView addSubview:_medFirstLb];
        _medFirstLb.textAlignment = NSTextAlignmentCenter;
        [_medFirstLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.medFirstBt);
            make.top.mas_equalTo(self.medFirstBt.mas_bottom);
            make.bottom.mas_equalTo(-10);
        }];
    }
    return _medFirstLb;
}

- (UIButton *)medSecondBt {
    if(_medSecondBt == nil) {
        _medSecondBt = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.contentView addSubview:_medSecondBt];
        [_medSecondBt setBackgroundColor:[UIColor greenColor]];
        [_medSecondBt mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.medFirstBt.mas_right).mas_equalTo(10);
            make.centerY.mas_equalTo(self.medFirstBt);
            make.size.mas_equalTo(self.medFirstBt);
        }];
        [self medSecondLb];
    }
    return _medSecondBt;
}

- (UILabel *)medSecondLb {
    if(_medSecondLb == nil) {
        _medSecondLb = [[UILabel alloc] init];
        [self.contentView addSubview:_medSecondLb];
        _medSecondLb.textAlignment = NSTextAlignmentCenter;
        [_medSecondLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.medSecondBt);
            make.top.mas_equalTo(self.medSecondBt.mas_bottom);
            make.bottom.mas_equalTo(-10);
        }];
    }
    return _medSecondLb;
}

- (UIButton *)medThirdBt {
    if(_medThirdBt == nil) {
        _medThirdBt = [[UIButton alloc] init];
    }
    return _medThirdBt;
}

- (UILabel *)medThirdLb {
    if(_medThirdLb == nil) {
        _medThirdLb = [[UILabel alloc] init];
    }
    return _medThirdLb;
}




@end
