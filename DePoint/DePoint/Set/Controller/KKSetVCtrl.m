//
//  KKSetVCtrl.m
//  DePoint
//
//  Created by kaki on 16/7/22.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKSetVCtrl.h"

@interface KKSetVCtrl()
// 药箱模型
@property (nonatomic, strong) KKMedicineChestModel *medicChesM;
@end


@implementation KKSetVCtrl
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.medicChesM.mcMode = KKMedicChModeProduct;
    self.medicChesM.products.barCode = @"23456701999912315";
    [KKSANBOX kk_saveMdeicChest:self.medicChesM];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSArray <KKMedicineChestModel *> *array = [KKSANBOX kk_getMdeicChest];
    NSLog(@"--%@--", array);
    
    [array enumerateObjectsUsingBlock:^(KKMedicineChestModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"%@ %@", obj.products.barCode, obj.saveDate);
    }];
}


- (KKMedicineChestModel *)medicChesM {
    if(_medicChesM == nil) {
        _medicChesM = [[KKMedicineChestModel alloc] init];
    }
    return _medicChesM;
}

@end
