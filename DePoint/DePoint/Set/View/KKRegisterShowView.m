//
//  KKRegisterShowView.m
//  DePoint
//
//  Created by kaki on 16/8/11.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKRegisterShowView.h"
#import "KKSquareButton.h"

@interface KKRegisterShowView()
@property (nonatomic, strong) KKSquareButton *headIconButton; //
@property (nonatomic, weak) UIView *view; //
@end


@implementation KKRegisterShowView

+ (instancetype)registerShowOnView:(UIView *)view{
    KKRegisterShowView *registerView = [[KKRegisterShowView alloc] init];
    registerView.view = view;
    [registerView setupView];
    return registerView;
}

- (void)setupView {
    _headIconButton = [KKSquareButton buttonWithTitle:@"选择头像" imgName:@"set_head_login_user"];
    _headIconButton.backgroundColor = [UIColor orangeColor];
    [_view addSubview:_headIconButton];
    [_headIconButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(64 + KKScreenHeightPrecent(0.05));
        make.centerX.mas_equalTo(0);
        make.height.mas_equalTo(KKScreenHeightPrecent(0.1));
        make.width.mas_equalTo(_headIconButton.mas_height).mas_equalTo(-25);
    }];
    
    CGFloat height = KKScreenHeightPrecent(0.05);
    CGFloat labelWidth = KKScreenWidthPrecent(0.2);
    CGFloat margin = KKScreenWidthPrecent(0.15);
    CGFloat phoneTfWidth = KKScreenWidthPrecent(0.3);
    CGFloat sendMsgWidth = KKScreenWidthPrecent(0.2);
    
    KKJustifiedLabel *phoneLa = [KKJustifiedLabel kk_labelWithText:@"手机号码"];
    phoneLa.backgroundColor = [UIColor orangeColor];
    [_view addSubview:phoneLa];
    [phoneLa mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(margin);
        make.top.mas_equalTo(_headIconButton.mas_bottom).mas_equalTo(margin);
        make.height.mas_equalTo(height);
        make.width.mas_equalTo(labelWidth);
    }];
    
    UITextField *phoneTf = [UITextField kk_createWithPlaceholder:@"请输入手机号码"];
    phoneTf.backgroundColor = [UIColor yellowColor];
    [_view addSubview:phoneTf];
    [phoneTf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(phoneLa.mas_right);
        make.height.mas_equalTo(phoneLa);
        make.top.mas_equalTo(phoneLa);
        make.width.mas_equalTo(phoneTfWidth);
    }];
    
    UIButton *sendMsg = [UIButton kk_buttonWithTitle:@"发送验证码"];
    sendMsg.backgroundColor = [UIColor orangeColor];
    [_view addSubview:sendMsg];
    [sendMsg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(phoneTf.mas_right);
        make.height.mas_equalTo(phoneTf);
        make.width.mas_equalTo(sendMsgWidth);
    }];
}

@end
