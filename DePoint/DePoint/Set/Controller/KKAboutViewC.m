//
//  KKAboutViewC.m
//  DePoint
//
//  Created by kaki on 16/8/4.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKAboutViewC.h"

#import "KKSanBox.h"

@implementation KKAboutViewC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNabbarBackgroundColor:KKGLOBARCOLOR];
    [self setNavBarTitle:@"关于"];
    
    // 设置导航栏返回按钮 渲染颜色
    [self setNavBarTintColor:KKGLOTINTCOLOR];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    KKMedicineChestModel *m = [[KKMedicineChestModel alloc] init];
    m.mcMode = KKMedicChModeDetail;
    m.detail.medicName = @"风油精";
    [KKSANBOX kk_saveMdeicChest:m];
    
    NSArray *arr = [KKSANBOX kk_getMdeicChest];
    [arr enumerateObjectsUsingBlock:^(KKMedicineChestModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"%@ %@", obj.detail.medicName, obj.saveDate);
    }];
}


@end
