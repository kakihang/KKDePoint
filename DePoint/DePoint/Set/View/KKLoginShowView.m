//
//  KKLoginShowView.m
//  DePoint
//
//  Created by kaki on 16/8/10.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKLoginShowView.h"


@interface KKLoginShowView()
@property (nonatomic, weak) UIView *mainView;
@property (nonatomic, strong) UIView *loginBgView; // 登录背景的view
@property (nonatomic, strong) UIView *oneKeyLoginBgView; // 一键登录背景view
@end


@implementation KKLoginShowView

+ (instancetype)loginShowOnView:(UIView *)view {
    KKLoginShowView *loginView = [[KKLoginShowView alloc] init];
    loginView.mainView = view;
    [loginView oneKeyLoginBgView];
    
    
    [loginView quickLoginBtn];
    [loginView accLoginBtn];
    return loginView;
}

- (UIView *)loginBgView {
    if(_loginBgView == nil) {
        _loginBgView = [[UIView alloc] init];
        [self.mainView addSubview:_loginBgView];
        [_loginBgView setBackgroundColor:[UIColor grayColor]];
        [_loginBgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(64);
            make.bottom.mas_equalTo(self.oneKeyLoginBgView.mas_top);
        }];
    }
    return _loginBgView;
}

- (UILabel *)userLa {
    if(_userLa == nil) {
        _userLa = [[UILabel alloc] init];
    }
    return _userLa;
}

- (UILabel *)passLa {
    if(_passLa == nil) {
        _passLa = [[UILabel alloc] init];
    }
    return _passLa;
}

- (UITextField *)userTf {
    if(_userTf == nil) {
        
        
        _userTf = [UITextField kk_createWithPlaceholder:@"请输入手机号码"];
        [self.loginBgView addSubview:_userTf];
        [_userTf mas_makeConstraints:^(MASConstraintMaker *make) {
            
        }];
    }
    return _userTf;
}

- (UITextField *)passTf {
    if(_passTf == nil) {
        _passTf = [[UITextField alloc] init];
    }
    return _passTf;
}

- (UIButton *)quickLoginBtn {
    if(_quickLoginBtn == nil) {
        _quickLoginBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect title:@"快速登录"];
        _quickLoginBtn.backgroundColor = [UIColor yellowColor];
        [self.loginBgView addSubview:_quickLoginBtn];
        [_quickLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(KKScreenWidthPrecent(0.2));
            make.width.mas_equalTo(KKScreenWidthPrecent(0.3));
            make.height.mas_equalTo(KKScreenHeightPrecent(0.05));
            make.top.mas_equalTo(KKScreenHeightPrecent(0.1));
        }];
    }
    return _quickLoginBtn;
}

- (UIButton *)accLoginBtn {
    if(_accLoginBtn == nil) {
        _accLoginBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect title:@"账号登录"];
        _accLoginBtn.backgroundColor = [UIColor yellowColor];
        [self.loginBgView addSubview:_accLoginBtn];
        [_accLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.quickLoginBtn.mas_right);
            make.size.mas_equalTo(self.quickLoginBtn);
            make.top.mas_equalTo(self.quickLoginBtn.mas_top);
        }];
    }
    return _accLoginBtn;
}

- (UIButton *)loginBtn {
    if(_loginBtn == nil) {
        _loginBtn = [[UIButton alloc] init];
    }
    return _loginBtn;
}

- (UIButton *)forgetBtn {
    if(_forgetBtn == nil) {
        _forgetBtn = [[UIButton alloc] init];
    }
    return _forgetBtn;
}

- (UIButton *)registerBtn {
    if(_registerBtn == nil) {
        _registerBtn = [[UIButton alloc] init];
    }
    return _registerBtn;
}



- (UIView *)oneKeyLoginBgView {
    if(_oneKeyLoginBgView == nil) {
        _oneKeyLoginBgView = [[UIView alloc] init];
        [self.mainView addSubview:_oneKeyLoginBgView];
        [_oneKeyLoginBgView setBackgroundColor:[UIColor clearColor]];
        [_oneKeyLoginBgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.mas_equalTo(0);
            make.height.mas_equalTo(KKScreenHeightPrecent(0.4));
        }];
        
        // QQ一键登录
        _qqLoginBtn = [KKSquareButton buttonWithTitle:@"QQ登录" imgName:@"qq24"];
        [_oneKeyLoginBgView addSubview:_qqLoginBtn];
        [_qqLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(_oneKeyLoginBgView.mas_centerX).mas_equalTo(-KKScreenWidthPrecent(0.1));
            make.bottom.mas_equalTo(-KKScreenHeightPrecent(0.2));
            make.width.mas_equalTo(_oneKeyLoginBgView).multipliedBy(0.15);
            make.height.mas_equalTo(_qqLoginBtn.mas_width).multipliedBy(1.5);
        }];
        
        // 微信一键登录
        _wxLoginBtn = [KKSquareButton buttonWithTitle:@"微信登录" imgName:@"wx24"];
        [_oneKeyLoginBgView addSubview:_wxLoginBtn];
        [_wxLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_oneKeyLoginBgView.mas_centerX).mas_equalTo(KKScreenWidthPrecent(0.1));
            make.size.mas_equalTo(_qqLoginBtn);
            make.bottom.mas_equalTo(_qqLoginBtn);
        }];
        
        UILabel *label = [UILabel kk_labelWithText:@"一键登录"];
        [_oneKeyLoginBgView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.bottom.mas_equalTo(_wxLoginBtn.mas_top);
            make.top.mas_greaterThanOrEqualTo(10);
            make.width.mas_equalTo(KKScreenWidthPrecent(0.2));
        }];
        
        UIImageView *left = [UIImageView kk_imageWithImageName:@"login_register_left_line" mode:UIViewContentModeScaleToFill];
        [_oneKeyLoginBgView addSubview:left];
        [left mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(label);
            make.left.mas_equalTo(KKScreenWidthPrecent(0.1));
            make.right.mas_equalTo(label.mas_left).mas_equalTo(KKScreenWidthPrecent(-0.05));
        }];
        
        UIImageView *right = [UIImageView kk_imageWithImageName:@"login_register_right_line" mode:UIViewContentModeScaleToFill];
        [_oneKeyLoginBgView addSubview:right];
        [right mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(label);
            make.left.mas_equalTo(label.mas_right).mas_equalTo(KKScreenWidthPrecent(0.05));
            make.right.mas_equalTo(KKScreenWidthPrecent(-0.1));
        }];
    }
    return _oneKeyLoginBgView;
}



@end
