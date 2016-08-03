//
//  KKSanBox.m
//  DePoint
//
//  Created by kaki on 16/8/3.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKSanBox.h"


// 归档解档地址
#define KKMEDICCHESTPATH [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"DeliveryPoint.medicchest.sanbox.plist"]

@interface KKSanBox()
@property (nonatomic, strong) NSMutableDictionary *medicDatas;
@end



@implementation KKSanBox

// 归档
- (void)saveToSanBox:(NSDictionary *)dict path:(NSString *)path {
    [NSKeyedArchiver archiveRootObject:dict toFile:path];
    NSLog(@"%@", path);
}
// 解档
- (NSDictionary *)getFromSanBox:(NSString *)path {
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




#pragma mark - 药箱

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

- (void)kk_saveMdeicChest:(KKMedicineChestModel *)medicChestModel {
    NSString *key = [self getMedicCheKey:medicChestModel];
    medicChestModel.saveDate = [NSDate kk_currentDatebyFormat:@"yyyy-MM-dd"];
    [self.medicDatas setObject:medicChestModel forKey:key];
    [self saveToSanBox:self.medicDatas path:KKMEDICCHESTPATH];
}

- (void)kk_deleteMedic:(KKMedicineChestModel *)medicChestModel {
    NSString *key = [self getMedicCheKey:medicChestModel];
    [self.medicDatas removeObjectForKey:key];
    [self saveToSanBox:self.medicDatas path:KKMEDICCHESTPATH];
}

- (NSArray <KKMedicineChestModel *> *)kk_getMdeicChest {
    NSArray *keys = [self.medicDatas keysSortedByValueUsingComparator:^NSComparisonResult(KKMedicineChestModel *  _Nonnull obj1, KKMedicineChestModel *  _Nonnull obj2) {
        return [obj2.saveDate compare:obj1.saveDate];
    }];
    
    NSMutableArray *arrry = [NSMutableArray array];
    for (NSString *key in keys) {
        [arrry addObject:self.medicDatas[key]];
    }
    return arrry.copy;
}

- (NSMutableDictionary *)medicDatas {
    if(_medicDatas == nil) {
        _medicDatas = [NSMutableDictionary dictionary];
        [_medicDatas addEntriesFromDictionary:[self getFromSanBox:KKMEDICCHESTPATH]];
    }
    return _medicDatas;
}

@end
