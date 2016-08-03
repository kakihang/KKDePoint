//
//  KKSanBox.h
//  DePoint
//
//  Created by kaki on 16/8/3.
//  Copyright © 2016年 liudhkk. All rights reserved.
//


#define KKSANBOX [KKSanBox shareSanBox]

#import <Foundation/Foundation.h>
#import "KKMedicineChestModel.h"


typedef NS_ENUM(NSUInteger, KKSanBoxType) {
    KKSanBoxTypeMedicSupervision,
    KKSanBoxTypeMedicProduct,
    KKSanBoxTypeMedicDetail,
    KKSanBoxTypeMedicHistory,
    KKSanBoxTypeDiseaseDetail,
    KKSanBoxTypeDiseaseHistory,
};

@interface KKSanBox : NSObject

+ (instancetype)shareSanBox;

- (void)kk_saveMdeicChest:(KKMedicineChestModel *)medicChestModel;
- (void)kk_deleteMedic:(KKMedicineChestModel *)medicChestModel;
- (NSArray <KKMedicineChestModel *> *)kk_getMdeicChest;


@end
