//
//  KKLoginViewC.m
//  DePoint
//
//  Created by kaki on 16/8/4.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKLoginViewC.h"
#import "KKLoginShowView.h"
#import "KKRegisterViewC.h"
#import "KKCheckUtil.h"

#import <TencentOpenAPI/TencentOAuth.h>
#import <BmobSDK/Bmob.h>
#import "KKSmsProc.h"
#import "KKLoginProc.h"

@interface KKLoginViewC() <TencentSessionDelegate>
@property (nonatomic, strong)TencentOAuth *tencentOAuth;
@property (nonatomic, weak) KKLoginShowView *showView; //
@end


@implementation KKLoginViewC {
    NSInteger _sec;
    __block BOOL _isQuickLogin;
    NSString *_tmpPhone;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavTitle:@"登录" tintColor:KKGLOTINTCOLOR backgroundColor:[UIColor clearColor]];
    [self setNavBottmLinehidden:YES];
    [self.view kk_viewWithVisualEffName:@"130313604324531250"];
    _sec = 0;
    
    [self showView];
    
    UIButton *registerButton = [UIButton kk_buttonWithTitle:@"注册"];
    [self setNavBarRightBtn:registerButton];
    
    __weak typeof(self) weakSelf = self;
    [registerButton bk_addEventHandler:^(id sender) {
        weakSelf.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:[[KKRegisterViewC alloc] init] animated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
}

- (KKLoginShowView *)showView {
    if(_showView == nil) {
        __weak typeof(self) weakSelf = self;
        _showView = [KKLoginShowView loginShowOnView:self.view];
        [_showView.loginBtn addTarget:self action:@selector(clickLoginButton) forControlEvents:UIControlEventTouchUpInside];
        [_showView.sendMag addTarget:self action:@selector(clickSendMsg) forControlEvents:UIControlEventTouchUpInside];
        [_showView.userTf addTarget:self action:@selector(textFieldValueChange) forControlEvents:UIControlEventAllEditingEvents];
        [_showView.passTf addTarget:self action:@selector(textFieldValueChange) forControlEvents:UIControlEventAllEditingEvents];
        [_showView.qqLoginBtn addTarget:self action:@selector(clickQQlogin) forControlEvents:UIControlEventTouchUpInside];
        [_showView.wxLoginBtn addTarget:self action:@selector(clickWXText) forControlEvents:UIControlEventTouchUpInside];
        [_showView.quickLoginBtn bk_addEventHandler:^(id sender) {
            _isQuickLogin = YES;
            [weakSelf.view endEditing:YES];
            [weakSelf textFieldValueChange];
        } forControlEvents:UIControlEventTouchUpInside];
        [_showView.accLoginBtn bk_addEventHandler:^(id sender) {
            _isQuickLogin = NO;
            [weakSelf.view endEditing:YES];
            [weakSelf textFieldValueChange];
        } forControlEvents:UIControlEventTouchUpInside];
        _isQuickLogin = YES;
    }
    return _showView;
}

- (void)dealloc {
    NSLog(@"%s", __func__);
}

- (void)textFieldValueChange {
    if (_isQuickLogin) {
        self.showView.sendMag.enabled = self.showView.userTf.text.length == 11 && _sec <= 0;
        self.showView.loginBtn.enabled = (self.showView.userTf.text.length == 11 && (self.showView.passTf.text.length == 4 || self.showView.passTf.text.length == 6));
    } else {
        self.showView.loginBtn.enabled = ([self.showView.userTf hasText] && [self.showView.passTf hasText]);
    }
}

- (void)clickLoginButton {
    [self.view showHUD];
    if (_isQuickLogin) {
        [self checkSms];
    } else {
        __weak typeof(self) weakSelf = self;
        [KKLoginProc kk_loginWithAccount:self.showView.userTf.text password:self.showView.passTf.text complehandler:^(NSError *error) {
            [weakSelf.view hideHUD];
            if (!error) {
                NSLog(@"登录成功");
                [weakSelf.navigationController popViewControllerAnimated:YES];
            } else {
                NSLog(@"账号或密码不正确: %@",error);
                [weakSelf.view kk_showAlertNoTitleWithMessage:@"账号或密码不正确"];
            }
        }];
    }
}

- (void)clickSendMsg {
    [self.view showHUD];
    [self sendSms];
    [self setSendAgainButton];
}

#pragma mark - 发送倒数

- (void)setSendAgainButton {
    _sec = KKSendMsgWaitSec;
    self.showView.sendMag.enabled = NO;
    [self runSecond:nil];
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(runSecond:) userInfo:nil repeats:YES];
}

- (void)runSecond:(NSTimer *)timer {
    if (_sec <= 0) {
        [self.showView.sendMag setTitle:@"重新获取" forState:UIControlStateNormal];
        [timer invalidate];
        timer = nil;
        self.showView.sendMag.enabled = YES;
        return;
    }
    [self.showView.sendMag setTitle:[NSString stringWithFormat:@"%zd%@", _sec--, @"s后发送"] forState:UIControlStateDisabled];
}

#pragma mark - 普通登录处理


#pragma mark - QQ登录

- (void)clickQQlogin {
    if ([TencentOAuth iphoneQQInstalled]) {
        //注册
        _tencentOAuth = [[TencentOAuth alloc] initWithAppId:KKTENAPIKEY andDelegate:self];
        //授权
        NSArray *permissions = [NSArray arrayWithObjects:kOPEN_PERMISSION_GET_INFO,nil];
        //        NSArray *permissions= [NSArray arrayWithObjects:@"get_user_info", @"get_simple_userinfo", @"add_t", nil];
        [_tencentOAuth authorize:permissions inSafari:YES];
        //获取用户信息
        [_tencentOAuth getUserInfo];
    } else {
        [KKCheckUtil showAlertWithMessage:@"没有安装qq客户端" delegate:self];
    }
    
}

- (void)tencentDidLogin{
    NSLog(@"%s", __func__);
    if (_tencentOAuth.accessToken && 0 != [_tencentOAuth.accessToken length]){
        
        [_tencentOAuth getUserInfo];
        
        //  记录登录用户的OpenID、Token以及过期时间
        NSString *accessToken = _tencentOAuth.accessToken;
        NSString *uid = _tencentOAuth.openId;
        NSDate *expiresDate = _tencentOAuth.expirationDate;
        NSLog(@"acessToken:%@",accessToken);
        NSLog(@"UserId:%@",uid);
        NSLog(@"expiresDate:%@",expiresDate);
        NSDictionary *dic = @{@"access_token":accessToken,@"uid":uid,@"expirationDate":expiresDate};
        
        //通过授权信息注册登录
        [BmobUser loginInBackgroundWithAuthorDictionary:dic platform:BmobSNSPlatformQQ block:^(BmobUser *user, NSError *error) {
            if (error) {
                NSLog(@"weibo login error:%@",error);
            } else if (user){
                NSLog(@"user objectid is :%@",user.objectId);
                //跳转
                //                ShowUserMessageViewController *showUser = [[ShowUserMessageViewController alloc] init];
                //                showUser.title = @"用户信息";
                //                
                //                [self.navigationController pushViewController:showUser animated:YES];
            }
        }];
    }
}

- (void)tencentDidNotNetWork {
    
    NSLog(@"%s", __func__);
}

- (void)tencentDidNotLogin:(BOOL)cancelled {
    NSLog(@"%s", __func__);
}

-(void)getUserInfoResponse:(APIResponse *)response {
    NSLog(@"respons:%@",response.jsonResponse);
}

#pragma mark - 微信
- (void)clickWXText {
    BmobUser *user = [BmobUser getCurrentUser];
    NSLog(@"%@|%@|%@|%@", user.username, user.password, user.email, user.mobilePhoneNumber);
    NSLog(@"%zd", [TencentOAuth authorizeState]);;
    NSLog(@"%p", self.tencentOAuth);
}

#pragma mark - 短信登录处理
- (void)sendSms {
    _tmpPhone = self.showView.userTf.text;
    __weak typeof(self) weakSelf = self;
    [KKSmsProc kk_smsSendByPhone:_tmpPhone completionHandler:^(NSError *error, NSString *errMsg) {
        [weakSelf.view hideHUD];
        if (!error) {
            NSLog(@"发送成功");
            [weakSelf.view showWarning:@"发送成功"];
        } else {
            NSLog(@"发送失败: %@", error);
            [weakSelf.view kk_showAlertNoTitleWithMessage:errMsg];
        }
    }];
}

- (void)checkSms {
    __weak typeof(self) weakSelf = self;
    _tmpPhone = _tmpPhone?_tmpPhone:self.showView.userTf.text;
    [KKSmsProc kk_smsCheckByPhone:_tmpPhone smsCode:self.showView.passTf.text completionHandler:^(NSError *error, NSString *errMsg) {
        if (!error) {
            NSLog(@"%@:%@ 校验成功", _tmpPhone, weakSelf.showView.passTf.text);
            [KKLoginProc kk_registerWithPhone:_tmpPhone complehandler:^(BOOL isSuccessful, NSError *error) {
                [weakSelf.view hideHUD];
                if (!error) {
                    NSLog(@"登录成功");
                    [weakSelf.navigationController popViewControllerAnimated:YES];
                } else {
                    NSLog(@"登录失败: %@", error);
                    [weakSelf.view kk_showAlertNoTitleWithMessage:@"登录失败"];
                }
            }];
        } else {
            [weakSelf.view hideHUD];
            NSLog(@"验证失败: %@", error);
            [weakSelf.view kk_showAlertNoTitleWithMessage:errMsg];
        }
    }];
}

@end

