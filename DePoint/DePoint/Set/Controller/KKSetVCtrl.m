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
    
    NSArray *array = [KKSANBOX kk_getMdeicChest];
    NSLog(@"--%@--", array);
    
    self.medicChesM.mcMode = KKMedicChModeProduct;
    self.medicChesM.products.barCode = @"234567845678567";
    [KKSANBOX kk_saveMdeicChest:self.medicChesM];
}



- (KKMedicineChestModel *)medicChesM {
    if(_medicChesM == nil) {
        _medicChesM = [[KKMedicineChestModel alloc] init];
    }
    return _medicChesM;
}

@end
