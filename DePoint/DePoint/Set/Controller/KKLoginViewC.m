//
//  KKLoginViewC.m
//  DePoint
//
//  Created by kaki on 16/8/4.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKLoginViewC.h"
#import "KKLoginShowView.h"

@interface KKLoginViewC()
@property (nonatomic, strong) KKLoginShowView *showView; //
@end


@implementation KKLoginViewC
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavTitle:@"登录" tintColor:KKGLOTINTCOLOR backgroundColor:[UIColor clearColor]];
    [self setNavBottmLinehidden:YES];
    
    [self.view kk_viewWithVisualEffName:@"130313604324531250"];
    
    [self showView];
}

- (KKLoginShowView *)showView {
    if(_showView == nil) {
        _showView = [KKLoginShowView loginShowOnView:self.view];
    }
    return _showView;
}

@end
