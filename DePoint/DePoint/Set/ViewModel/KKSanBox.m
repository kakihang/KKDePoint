//
//  KKSanBox.m
//  DePoint
//
//  Created by kaki on 16/8/3.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKSanBox.h"


// 归档解档地址
#define KKMEDICCHESTPATH [[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"Preferences/DeliveryPoint.medic.chest.sanbox.plist"]

#define KKMEDICHISTORYPATH [[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"Preferences/DeliveryPoint.medic.history.sanbox.plist"]

#define KKDISEASEPATH [[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"Preferences/DeliveryPoint.disea.collection.sanbox.plist"]

@interface KKSanBox()
@property (nonatomic, strong) NSMutableDictionary *medicDatas; // 药箱
@property (nonatomic, strong) NSMutableDictionary *medicHistory; // 扫码历史
@property (nonatomic, strong) NSMutableDictionary *collectionDatas; // 病类收藏
@end



@implementation KKSanBox

// 归档
- (void)saveToSanBox:(NSDictionary *)dict path:(NSString *)path {
    [NSKeyedArchiver archiveRootObject:dict toFile:path];
    NSLog(@"%@", path);
}
// 解档
- (id)getFromSanBox:(NSString *)path {
    NSLog(@"%@", path);
    return [NSKeyedUnarchiver unarchiveObjectWithFile:path];
}



static KKSanBox *sanBox_ = nil;
+ (instancetype)shareSanBox {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (sanBox_ == nil) {
            sanBox_ = [[KKSanBox alloc] init];
            [sanBox_ medicDatas]; //初始化
        }
    });
    return sanBox_;
}




#pragma mark -

- (void)saveMedic:(KKMedicineChestModel *)model
         dataList:(NSMutableDictionary *)dataList
             path:(NSString *)path {
    NSString *key = [self getMedicCheKey:model];
    model.saveDate = [NSDate kk_currentDatebyFormat:@"yyyy-MM-dd HH:mm:ss"];
    [dataList setObject:model forKey:key];
    [self saveToSanBox:self.medicDatas path:path];
}

- (void)deleteMedic:(KKMedicineChestModel *)model
           dataList:(NSMutableDictionary *)dataList
               path:(NSString *)path {
    NSString *key = [self getMedicCheKey:model];
    [dataList removeObjectForKey:key];
    [self saveToSanBox:dataList path:path];
}

- (NSArray *)getMedic:(NSDictionary *)dataList {
    NSArray *keys = [dataList keysSortedByValueUsingComparator:^NSComparisonResult(KKMedicineChestModel *  _Nonnull obj1, KKMedicineChestModel *  _Nonnull obj2) {
        return [obj2.saveDate compare:obj1.saveDate];
    }];
    NSMutableArray *arrry = [NSMutableArray array];
    for (NSString *key in keys) {
        [arrry addObject:dataList[key]];
    }
    return arrry.copy;
}

- (NSString *)getMedicCheKey:(KKMedicineChestModel *)medicChestModel {
    NSString *key;
    switch (medicChestModel.mcMode) {
        case KKMedicChModeSupersision: {
            key = medicChestModel.supervision.codeCode;
            break;
        }
        case KKMedicChModeProduct: {
            key =  medicChestModel.products.barCode;
            break;
        }
        case KKMedicChModeDetail: {
            key =  medicChestModel.detail.medicName;
            break;
        }
        default: {
            NSAssert1(NO, @"%s: medicChestModel must have value", __FUNCTION__);
            return nil;
        }
    }
    NSAssert1((key.length!=0), @"%s: medicChestModel had error value(keywords was null)", __FUNCTION__);
    return key;
}

#pragma mark - 药箱

- (void)kk_saveMdeicChest:(KKMedicineChestModel *)medicChestModel {
    [self saveMedic:medicChestModel dataList:self.medicDatas path:KKMEDICCHESTPATH];
}

- (void)kk_deleteMedic:(KKMedicineChestModel *)medicChestModel {
    [self deleteMedic:medicChestModel dataList:self.medicDatas path:KKMEDICCHESTPATH];
}

- (NSArray <KKMedicineChestModel *> *)kk_getMdeicChest {
    return [self getMedic:self.medicDatas];
}


#pragma mark - 扫码历史

- (void)kk_saveMdeicHistory:(KKMedicineChestModel *)medicModel {
    [self saveMedic:medicModel dataList:self.medicHistory path:KKMEDICHISTORYPATH];
}

- (void)kk_deleteMedicHistory:(KKMedicineChestModel *)medicModel {
    [self deleteMedic:medicModel dataList:self.medicHistory path:KKMEDICHISTORYPATH];
}

- (NSArray <KKMedicineChestModel *> *)kk_getMdeicHistory {
    return [self getMedic:self.medicHistory];
}


#pragma mark - 病类收藏

- (void)kk_saveDisease:(KKCollectionModel *)collectionModel {
    collectionModel.saveDate = [NSDate kk_currentDatebyFormat:@"yyyy-MM-dd HH:mm:ss"];
    [self.collectionDatas setObject:collectionModel forKey:collectionModel.name];
    [self saveToSanBox:self.collectionDatas path:KKDISEASEPATH];
}

- (void)kk_deleteDisease:(KKCollectionModel *)collectionModel {
    NSString *key = collectionModel.name;
    [self.collectionDatas removeObjectForKey:key];
    [self saveToSanBox:self.collectionDatas path:KKDISEASEPATH];
}

- (NSArray <KKCollectionModel *> *)kk_getDisease {
    NSArray *keys = [self.collectionDatas keysSortedByValueUsingComparator:^NSComparisonResult(KKCollectionModel *  _Nonnull obj1, KKCollectionModel *  _Nonnull obj2) {
        return [obj2.saveDate compare:obj1.saveDate];
    }];
    NSMutableArray *arrry = [NSMutableArray array];
    for (NSString *key in keys) {
        [arrry addObject:self.collectionDatas[key]];
    }
    return arrry.copy;
}



#pragma mark - 懒加载

- (NSMutableDictionary *)medicDatas {
    if(_medicDatas == nil) {
        _medicDatas = [NSMutableDictionary dictionary];
        [_medicDatas addEntriesFromDictionary:[self getFromSanBox:KKMEDICCHESTPATH]];
    }
    return _medicDatas;
}

- (NSMutableDictionary *)medicHistory {
    if(_medicHistory == nil) {
        _medicHistory = [[NSMutableDictionary alloc] init];
        [_medicHistory addEntriesFromDictionary:[self getFromSanBox:KKMEDICHISTORYPATH]];
    }
    return _medicHistory;
}

- (NSMutableDictionary *)collectionDatas {
    if(_collectionDatas == nil) {
        _collectionDatas = [[NSMutableDictionary alloc] init];
        [_collectionDatas addEntriesFromDictionary:[self getFromSanBox:KKDISEASEPATH]];
    }
    return _collectionDatas;
}

@end
