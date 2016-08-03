//
//  KKMedicineChestModel.m
//  DePoint
//
//  Created by kaki on 16/8/3.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKMedicineChestModel.h"



static NSString *KKMedicineChestModel_supervision = @"KKMedicineChestModel_supervision";
static NSString *KKMedicineChestModel_mcMode = @"KKMedicineChestModel_mcMode";
static NSString *KKMedicineChestModel_remarks = @"KKMedicineChestModel_remarks";
//static NSString *KKMedicineChestModel_key = @"KKMedicineChestModel_key";
@implementation KKMedicineChestModel

//- (instancetype)init {
//    if (self = [super init]) {
//        [self supervision];
//        [self product];
//        [self detail];
//    }
//    return self;
//}

- (supervisionCode *)supervision {
    if(_supervision == nil) {
        _supervision = [[supervisionCode alloc] init];
    }
    return _supervision;
}

- (productCode *)products {
    if(_products == nil) {
        _products = [[productCode alloc] init];
    }
    return _products;
}

- (MedicDetail *)detail {
    if(_detail == nil) {
        _detail = [[MedicDetail alloc] init];
    }
    return _detail;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.supervision forKey:KKMedicineChestModel_supervision];
    [aCoder encodeInteger:self.mcMode forKey:KKMedicineChestModel_mcMode];
    [aCoder encodeObject:self.remarks forKey:KKMedicineChestModel_remarks];
    //    [aCoder encodeObject:self.key forKey:KKMedicineChestModel_key];
}
- (id)initWithCoder:(NSCoder *)aDecoder {
    self.supervision = [aDecoder decodeObjectForKey:KKMedicineChestModel_supervision];
    self.mcMode = [aDecoder decodeIntegerForKey:KKMedicineChestModel_mcMode];
    self.remarks = [aDecoder decodeObjectForKey:KKMedicineChestModel_remarks];
    //    self.key = [aDecoder decodeObjectForKey:KKMedicineChestModel_key];
    return self;
}
@end



static NSString *supervisionCode_expiry_date = @"supervisionCode_expiry_date";
@implementation supervisionCode
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.expiry_date forKey:supervisionCode_expiry_date];
}
- (id)initWithCoder:(NSCoder *)aDecoder {
    self.expiry_date = [aDecoder decodeObjectForKey:supervisionCode_expiry_date];
    return self;
}
@end



static NSString *productCode_barCode = @"productCode_barCode";
@implementation productCode
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.barCode forKey:productCode_barCode];
}
- (id)initWithCoder:(NSCoder *)aDecoder {
    self.barCode = [aDecoder decodeObjectForKey:productCode_barCode];
    return self;
}
@end




static NSString *MedicDetail_medicName = @"MedicDetail_medicName";
@implementation MedicDetail
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.medicName forKey:MedicDetail_medicName];
}
- (id)initWithCoder:(NSCoder *)aDecoder {
    self.medicName = [aDecoder decodeObjectForKey:MedicDetail_medicName];
    return self;
}
@end
//
//@implementation Numbers
//
//@end
//
//
//@implementation Codes
//
//@end


