//
//  KKFrameTabC.m
//  DePoint
//
//  Created by kaki on 16/7/22.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKFrameTabC.h"

#import "KKMediVCtrl.h"
#import "KKDisVCtrl.h"
#import "KKNearVCtrl.h"
#import "KKSetVCtrl.h"




@implementation KKFrameTabC


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 修改tabBar的渲染颜色
    self.tabBar.barTintColor = KKCOLOR(228, 228, 228, 1);
    self.tabBar.tintColor = KKCOLOR(80, 120, 150, 1);
    
    // 统一设置所有UITabBarItem属性
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:KKFrameTaBarFont]} forState:UIControlStateNormal];
    [item setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:KKFrameTaBarFont]} forState:UIControlStateSelected];
    
    // 添加yaopin搜索子控制器
    [self setupViewController:[[KKMediVCtrl alloc] init]
                     navTitle:@"药品搜索"
                  tabBarTitle:@"药品搜索"
                        image:KKIMAGE(@"sear")
                selectedImage:KKIMAGE(@"sear")];
    
    // 添加病类子控制器
    [self setupViewController:[[KKDisVCtrl alloc] init]
                     navTitle:@"病类搜索"
                  tabBarTitle:@"病类搜索"
                        image:KKIMAGE(@"dis")
                selectedImage:KKIMAGE(@"dis")];
    
    // 添加附近子控制器
    [self setupViewController:[[KKNearVCtrl alloc] init]
                     navTitle:@"附近"
                  tabBarTitle:@"附近"
                        image:KKIMAGE(@"near")
                selectedImage:KKIMAGE(@"near")];
    
    // 添加附近子控制器
    [self setupViewController:[[KKSetVCtrl alloc] init]
                     navTitle:@"我的"
                  tabBarTitle:@"我的"
                        image:KKIMAGE(@"set")
                selectedImage:KKIMAGE(@"set")];
}




- (void)setupViewController:(UIViewController *)viewController
                   navTitle:(NSString *)navTitle
                tabBarTitle:(NSString *)tabBarTitle
                      image:(UIImage *)image
              selectedImage:(UIImage *)selectedImage {
    
    /** 统一设置子控制器底色、导航栏颜色 **/
    // 如有特殊需求请求具体子控制器内修改
    viewController.view.backgroundColor = KKGLOBAL;
    //    viewController.tabBarController.tabBar.backgroundColor = KKCOLOR(228, 228, 228, 1);;
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    viewController.tabBarItem.title = tabBarTitle;
    viewController.tabBarItem.image = image;
    viewController.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.navigationController.navigationBar.barTintColor = KKCOLOR(228, 228, 228, 1);
    viewController.navigationItem.title = navTitle;
    
    // 添加子控制器
    [self addChildViewController:nav];
}


@end
