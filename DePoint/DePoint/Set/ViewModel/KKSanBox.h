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
#import "KKCollectionModel.h"



@interface KKSanBox : NSObject

+ (instancetype)shareSanBox;

- (void)kk_saveMdeicChest:(KKMedicineChestModel *)medicChestModel;
- (void)kk_deleteMedic:(KKMedicineChestModel *)medicChestModel;
- (NSArray <KKMedicineChestModel *> *)kk_getMdeicChest;

//- (void)kk_saveMdeicHistory:(KKMedicineChestModel *)medicModel;
//- (void)kk_deleteMedicHistory:(KKMedicineChestModel *)medicModel;
//- (NSArray <KKMedicineChestModel *> *)kk_getMdeicHistory;

- (void)kk_saveDisease:(KKCollectionModel *)collectionModel;
- (void)kk_deleteDisease:(KKCollectionModel *)collectionModel;
- (NSArray <KKCollectionModel *> *)kk_getDisease;


@end
