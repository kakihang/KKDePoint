//
//  KKMedicineChestModel.m
//  DePoint
//
//  Created by kaki on 16/8/3.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKMedicineChestModel.h"



@implementation KKMedicineChestModel

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
    KKFILE;
}
- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        KKSOLFILE;
    }
    
    return self;
}
@end

@implementation supervisionCode
- (void)encodeWithCoder:(NSCoder *)aCoder {
    KKFILE;
}
- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        KKSOLFILE;
    }
    return self;
}
@end


@implementation productCode
- (void)encodeWithCoder:(NSCoder *)aCoder {
    KKFILE;
}
- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        KKSOLFILE;
    }
    return self;
}
@end



@implementation MedicDetail
- (void)encodeWithCoder:(NSCoder *)aCoder {
    KKFILE;
}
- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        KKSOLFILE;
    }
    return self;
}

- (NSArray<Numbers *> *)numbers {
    if(_numbers == nil) {
        _numbers = [[NSArray<Numbers *> alloc] init];
    }
    return _numbers;
}

- (NSArray<Codes *> *)codes {
    if(_codes == nil) {
        _codes = [[NSArray<Codes *> alloc] init];
    }
    return _codes;
}

@end


@implementation Numbers
- (void)encodeWithCoder:(NSCoder *)aCoder {
    KKFILE;
}
- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        KKSOLFILE;
    }
    return self;
}
@end


@implementation Codes
- (void)encodeWithCoder:(NSCoder *)aCoder {
    KKFILE;
}
- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        KKSOLFILE;
    }
    return self;
} 
@end 





