//
//  KKRegisterViewC.m
//  DePoint
//
//  Created by kaki on 16/8/11.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKRegisterViewC.h"
#import "KKRegisterShowView.h"

@interface KKRegisterViewC ()
@property (nonatomic, weak) KKRegisterShowView *showView; //
@end

@implementation KKRegisterViewC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavTitle:@"注册" tintColor:KKGLOTINTCOLOR backgroundColor:[UIColor clearColor]];
    [self setNavBottmLinehidden:YES];
    [self.view kk_viewWithVisualEffName:@"130313604324531250"];
    
    KKRegisterShowView *showView = [KKRegisterShowView registerShowOnView:self.view];
    self.showView = showView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    NSLog(@"%s", __func__);
}

@end
