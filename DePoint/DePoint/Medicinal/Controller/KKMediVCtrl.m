//
//  KKMediVCtrl.m
//  DePoint
//
//  Created by kaki on 16/7/22.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKMediVCtrl.h"
#import "XPDrugController.h"
#import "XPPushController.h"


#import "KKMediTVC.h"

@implementation KKMediVCtrl
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.layer.cornerRadius = 32;
    button.frame = CGRectMake(KWidth / 2 -32, WHeigth / 2 -64, 64, 64);
    button.backgroundColor = [UIColor blueColor];
    [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    UIButton *kkBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:kkBtn];
    [kkBtn setFrame:CGRectMake(200, WHeigth/2+50, 40, 40)];
    [kkBtn setBackgroundColor:[UIColor yellowColor]];
    [kkBtn setTitle:@"KK" forState:UIControlStateNormal];
    [kkBtn bk_addEventHandler:^(id sender) {
        KKMediTVC *kktvc = [[KKMediTVC alloc] initWithStyle:UITableViewStyleGrouped];
        [self.navigationController pushViewController:kktvc animated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
}
-(void)click:(UIButton *)sender{
    XPDrugController *vc = [[XPDrugController alloc]init];
    UINavigationController *tt= [[UINavigationController alloc]initWithRootViewController:vc];
    XPPushController *pu = [[XPPushController alloc]init];
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:pu];
    RESideMenu *sideMenu = [[RESideMenu alloc]initWithContentViewController:navi leftMenuViewController:tt rightMenuViewController:nil];
    sideMenu.panGestureEnabled = YES;
    sideMenu.fadeMenuView = NO;
    sideMenu.scaleContentView = NO;
    sideMenu.scaleBackgroundImageView =NO;
    sideMenu.contentViewInPortraitOffsetCenterX =-(self.view.frame.size.width / 2 -140);
    sideMenu.bouncesHorizontally = YES;
    sideMenu.menuPrefersStatusBarHidden = YES;
    [self presentViewController:sideMenu animated:YES completion:nil];
    
}

@end
