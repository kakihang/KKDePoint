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

@interface KKLoginViewC() <TencentSessionDelegate, UIWebViewDelegate>
@property (nonatomic, strong)TencentOAuth *tencentOAuth;
@property (nonatomic, weak) KKLoginShowView *showView; //
@property (nonatomic, strong) UIWebView *qqWebView; //
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
        [weakSelf.navigationController pushViewController:[[KKRegisterViewC alloc] initWitTitle:@"注册" isRegister:YES] animated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
}

- (KKLoginShowView *)showView {
    if(_showView == nil) {
        __weak typeof(self) weakSelf = self;
        _showView = [KKLoginShowView loginShowOnView:self.view];
        [_showView.loginBtn addTarget:self action:@selector(clickLoginButton) forControlEvents:UIControlEventTouchUpInside];
        [_showView.sendMag addTarget:self action:@selector(clickSendMsg) forControlEvents:UIControlEventTouchUpInside];
        [_showView.forgetBtn addTarget:self action:@selector(clickForgetButton) forControlEvents:UIControlEventTouchUpInside];
        [_showView.userTf addTarget:self action:@selector(textFieldValueChange) forControlEvents:UIControlEventAllEditingEvents];
        [_showView.passTf addTarget:self action:@selector(textFieldValueChange) forControlEvents:UIControlEventAllEditingEvents];
        [_showView.qqLoginBtn addTarget:self action:@selector(clickQQlogin) forControlEvents:UIControlEventTouchUpInside];
        //        [_showView.wxLoginBtn addTarget:self action:@selector(clickWXText) forControlEvents:UIControlEventTouchUpInside];
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

- (void)clickForgetButton {
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:[[KKRegisterViewC alloc] initWitTitle:@"重置密码" isRegister:NO] animated:YES];
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

/** QQ互联需要注册网站 **/
//- (void)webQQLogin {
//    NSLog(@"%s", __func__);
//    _qqWebView=[[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//    _qqWebView.backgroundColor = [UIColor whiteColor];
//    _qqWebView.delegate =self;
//    NSString *urlStr = [NSString stringWithFormat:@"https://graph.qq.com/oauth2.0/authorize?response_type=token&client_id=%@&display=mobile&redirect_uri=http://addon.discuz.com", APIKEY];
//    
//    NSURLRequest *request=[[NSURLRequest alloc] initWithURL:[NSURL URLWithString:urlStr]];
//    [_qqWebView loadRequest:request];
//    [_qqWebView setUserInteractionEnabled:YES];
//    
//    [self.view addSubview:_qqWebView];
//}
//- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
//    NSLog(@"%s", __func__);
//    NSString *requestString = [[[request URL] absoluteString] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    
//    //    if ([requestString hasPrefix:@"QQLoginTest://"]) {
//    //
//    //如果是自己定义的协议, 再截取协议中的方法和参数, 判断无误后在这里手动调用oc方法
//    
//    if ([requestString hasPrefix:@"http://qzs.qq.com"]) {
//        
//        NSLog(@"requestString:%@",requestString);
//        
//        NSString *paramsStr = [[requestString componentsSeparatedByString:@"#&"] lastObject];
//        NSArray *paramsArr = [paramsStr componentsSeparatedByString:@"&"];
//        
//        NSString *openid = [[paramsArr[0] componentsSeparatedByString:@"="] lastObject];
//        NSString *token = [[paramsArr[2] componentsSeparatedByString:@"="] lastObject];
//        
//        
//        [self getUserInfoWithToken:token openId:openid];
//    }
//    
//    
//    return YES;
//}
//
//- (void)getUserInfoWithToken:(NSString *)token openId:(NSString *)openid{
//    NSLog(@"%s", __func__);
//    // https://graph.qq.com/user/get_simple_userinfo?access_token=F6XXXXD005CCF705D&oauth_consumer_key=XXXX463&openid=40XXXBA5D8667C&format=json
//    
//    NSString *url = [NSString stringWithFormat:@"https://graph.qq.com/user/get_simple_userinfo?access_token=%@&openid=%@&oauth_consumer_key=%@&format=json", token, openid, APIKEY];
//    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        NSURL *zoneUrl = [NSURL URLWithString:url];
//        NSString *zoneStr = [NSString stringWithContentsOfURL:zoneUrl encoding:NSUTF8StringEncoding error:nil];
//        NSData *data = [zoneStr dataUsingEncoding:NSUTF8StringEncoding];
//        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            if (data)
//            {
//                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
//                NSLog(@"DIC:%@",dic);
//                // 登录成功 可以获取用户信息
//                /*
//                 {
//                 "ret": 0,
//                 "msg": "",
//                 "is_lost": 0,
//                 "nickname": "ZZZZZZZ",
//                 "gender": "男",
//                 "province": "北京",
//                 "city": "海淀",
//                 "figureurl": "http://qzapp.qlogXXX32A09044BA5D8667C/30",
//                 "figureurl_1": "http://qzapp.qlogo.XXXXA09044BA5D8667C/50",
//                 "figureurl_2": "http://qzapp.qlogo.cnXXXX44BA5D8667C/100",
//                 "figureurl_qq_1": "http://q.qlogoXXXF89F646432A09044BA5D8667C/40",
//                 "figureurl_qq_2": "http://q.qlogo.XXXX46432A09044BA5D8667C/100",
//                 "is_yellow_vip": "0",
//                 "vip": "0",
//                 "yellow_vip_level": "0",
//                 "level": "0",
//                 "is_yellow_year_vip": "0"
//                 }
//                 */
//                
//                
//                _qqWebView.hidden = YES;
//                //                self.head.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[dic objectForKey:@"figureurl_qq_2"]]]];
//                //                self.nick.text = dic[@"nickname"];
//                
//            }
//        });
//        
//    });
//}




- (void)clickQQlogin {
    NSLog(@"%zd  %zd", [TencentOAuth iphoneQQInstalled], [TencentOAuth iphoneQQSupportSSOLogin]);
    if ([TencentOAuth iphoneQQInstalled]) {
        _tencentOAuth = [[TencentOAuth alloc] initWithAppId:KKTENAPIKEY andDelegate:self];
        NSArray *permissions = [NSArray arrayWithObjects:kOPEN_PERMISSION_GET_INFO,nil];
        [_tencentOAuth authorize:permissions inSafari:YES];
        [_tencentOAuth getUserInfo];
    } else {
        [KKCheckUtil showAlertWithMessage:@"没有安装qq客户端" delegate:self];
    }
}

- (void)tencentDidLogin{
    NSLog(@"%s", __func__);
    if (_tencentOAuth.accessToken && 0 != [_tencentOAuth.accessToken length]){
        
        [_tencentOAuth getUserInfo];
        
        NSString *accessToken = _tencentOAuth.accessToken;
        NSString *uid = _tencentOAuth.openId;
        NSDate *expiresDate = _tencentOAuth.expirationDate;
        NSLog(@"acessToken:%@",accessToken);
        NSLog(@"UserId:%@",uid);
        NSLog(@"expiresDate:%@",expiresDate);
        NSDictionary *dic = @{@"access_token":accessToken,@"uid":uid,@"expirationDate":expiresDate};
        
        //通过授权信息注册登录
        [self.view showHUD];
        __weak typeof(self) weakSelf = self;
        [KKLoginProc kk_thirdLoginWithDictionary:dic platform:BmobSNSPlatformQQ complehandler:^(NSError *error, NSString *username) {
            [weakSelf.view hideHUD];
            if (error || !username) {
                NSLog(@"weibo login error:%@",error);
                [weakSelf.view kk_showAlertNoTitleWithMessage:@"处理失败，请使用快速登录"];
            } else {
                NSLog(@"user objectid is :%@", username);
                [weakSelf.view showWarning:@"登录成功"];
                [weakSelf.navigationController popToRootViewControllerAnimated:YES];
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
//- (void)clickWXText {
////    [self webQQLogin];
//    //    BmobUser *user = [BmobUser getCurrentUser];
//    //    NSLog(@"%@|%@|%@|%@", user.username, user.password, user.email, user.mobilePhoneNumber);
//    //    NSLog(@"%zd", [TencentOAuth authorizeState]);;
//    //    NSLog(@"%p", self.tencentOAuth);
//}

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

