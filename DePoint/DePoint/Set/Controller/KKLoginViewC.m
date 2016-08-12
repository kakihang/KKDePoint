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

@interface KKLoginViewC()
@property (nonatomic, weak) KKLoginShowView *showView; //
@end


@implementation KKLoginViewC
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavTitle:@"登录" tintColor:KKGLOTINTCOLOR backgroundColor:[UIColor clearColor]];
    [self setNavBottmLinehidden:YES];
    
    [self.view kk_viewWithVisualEffName:@"130313604324531250"];
    
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
        _showView = [KKLoginShowView loginShowOnView:self.view];
    }
    return _showView;
}

- (void)dealloc {
    
    NSLog(@"%s", __func__);
}

@end
