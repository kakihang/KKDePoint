//
//  KKSetViewModel.m
//  DePoint
//
//  Created by kaki on 16/8/4.
//  Copyright © 2016年 liudhkk. All rights reserved.
//
#import "KKSetViewModel.h"
#import "KKAboutViewC.h"
#import "KKFeedBackVC.h"
#import "KKCustomVC.h"


#import <ShareSDK/ShareSDK.h>
#import <ShareSDKUI/ShareSDK+SSUI.h>



// 弹出分享菜单需要导入的头文件
#import <ShareSDKUI/ShareSDK+SSUI.h>
// 自定义分享菜单栏需要导入的头文件
#import <ShareSDKUI/SSUIShareActionSheetStyle.h>
// 自定义分享编辑界面所需要导入的头文件
#import <ShareSDKUI/SSUIEditorViewStyle.h>


#import <ShareSDKUI/SSUIShareActionSheetCustomItem.h>


@interface KKSetViewModel()

@property (nonatomic, strong) NSArray <NSArray *> *dataList; // 数据样式
@end




@implementation KKSetViewModel

- (instancetype)init {
    if (self = [super init]) {
    }
    return self;
}

-(NSInteger)getSectionNum {
    return self.dataList.count;
}
- (NSInteger)getRowBySection:(NSInteger)section {
    return self.dataList[section].count;
}

- (UIImage *)getIconByIndexPath:(NSIndexPath *)indexPath {
    return [UIImage imageNamed:self.dataList[indexPath.section][indexPath.row][@"icon"]];
}

- (NSString *)getTitleByIndexPath:(NSIndexPath *)indexPath {
    return self.dataList[indexPath.section][indexPath.row][@"title"];
}

- (NSString *)getAssistByIndexPath:(NSIndexPath *)indexPath {
    return self.dataList[indexPath.section][indexPath.row][@"assist"];
}

- (UIViewController *)getViewCtrlByIndexPath:(NSIndexPath *)indexPath {
    return self.dataList[indexPath.section][indexPath.row][@"viewController"];
}

- (block)getBlock:(NSIndexPath *)indexPath {
    return self.dataList[indexPath.section][indexPath.row][@"block"];
}


#pragma mark - 懒加载

- (NSArray *)dataList {
    if(_dataList == nil) {
        _dataList =
        @[@[@{@"icon":@"set_icon",  //0-0
              @"title":@"药箱"},
            @{@"icon":@"set_icon",  //0-1
              @"title":@"收藏"}],
          
          @[@{@"icon":@"set_icon",  //1-0
              @"title":@"清除缓存"}],
          
          @[@{@"icon":@"set_icon",  //2-1
              @"title":@"推荐给朋友",
              @"block":^(id obj){
                  [self shareToFriends];
              }},
            @{@"icon":@"set_icon",  //2-2
              @"title":@"给我评分",
              @"block":^(id obj){[[UIApplication sharedApplication]openURL:[NSURL URLWithString:[NSString stringWithFormat:@"itms-apps://itunes.apple.com/cn/app%@", KKAPPLESTOREADDRESS]]];}},
            @{@"icon":@"set_icon", //2-3
              @"title":@"意见反馈",
              @"block":^(id obj){
                  [self pushViewContr:[[KKFeedBackVC alloc] init] from:obj];
              }}],
          
          @[@{@"icon":@"set_icon",  //3-1
              @"title":@"关于",
              @"block":^(id obj){
                  [self pushViewContr:[[KKAboutViewC alloc] init] from:obj];
              }}]];
    }
    return _dataList;
}

- (void)pushViewContr:(UIViewController *)toVC from:(UIViewController *)fromVC {
    fromVC.hidesBottomBarWhenPushed = YES;
    toVC.view.backgroundColor = KKGLOBAL;
    [fromVC.navigationController pushViewController:toVC animated:YES];
    fromVC.hidesBottomBarWhenPushed = NO;
}

- (void)shareToFriends {
    
    //1、创建分享参数
    NSArray* imageArray = @[[UIImage imageNamed:@"shareImg.png"]];
    //（注意：图片必须要在Xcode左边目录里面，名称必须要传正确，如果要分享网络图片，可以这样传iamge参数 images:@[@"http://mob.com/Assets/images/logo.png?v=20150320"]）
    
    if (imageArray) {
        NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
        [shareParams SSDKSetupShareParamsByText:@"分享内容"
                                         images:imageArray
                                            url:[NSURL URLWithString:[NSString stringWithFormat:@"itunes.apple.com/cn/app%@", KKAPPLESTOREADDRESS]]
                                          title:@"分享标题"
                                           type:SSDKContentTypeAuto];
        //2、分享（可以弹出我们的分享菜单和编辑界面）
        [ShareSDK showShareActionSheet:nil
                                 items:nil
                           shareParams:shareParams
                   onShareStateChanged:^(SSDKResponseState state,
                                         SSDKPlatformType platformType,
                                         NSDictionary *userData,
                                         SSDKContentEntity *contentEntity,
                                         NSError *error,
                                         BOOL end) {
                       
                       switch (state) {
                           case SSDKResponseStateSuccess: {
                               UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享成功" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
                               [alertView show];
                               break;
                           }
                           case SSDKResponseStateFail: {
                               UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"分享失败" message:[NSString stringWithFormat:@"%@",error] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                               [alert show];
                               break;
                           }
                           default:
                               break;
                       }
                   }
         ];
    }
}
@end
