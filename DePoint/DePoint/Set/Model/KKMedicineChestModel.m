//
//  KKMedicineChestModel.m
//  DePoint
//
//  Created by kaki on 16/8/3.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKMedicineChestModel.h"



static NSString *KKMedicineChestModel_supervision = @"KKMedicineChestModel_supervision";
static NSString *KKMedicineChestModel_products = @"KKMedicineChestModel_products";
static NSString *KKMedicineChestModel_detail = @"KKMedicineChestModel_detail";
static NSString *KKMedicineChestModel_mcMode = @"KKMedicineChestModel_mcMode";
static NSString *KKMedicineChestModel_remarks = @"KKMedicineChestModel_remarks";
static NSString *KKMedicineChestModel_saveDate = @"KKMedicineChestModel_saveDate";
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
    [aCoder encodeObject:self.supervision forKey:KKMedicineChestModel_supervision];
    [aCoder encodeObject:self.products forKey:KKMedicineChestModel_products];
    [aCoder encodeObject:self.detail forKey:KKMedicineChestModel_detail];
    [aCoder encodeInteger:self.mcMode forKey:KKMedicineChestModel_mcMode];
    [aCoder encodeObject:self.remarks forKey:KKMedicineChestModel_remarks];
    [aCoder encodeObject:self.saveDate forKey:KKMedicineChestModel_saveDate];
}
- (id)initWithCoder:(NSCoder *)aDecoder {
    self.supervision = [aDecoder decodeObjectForKey:KKMedicineChestModel_supervision];
    self.products = [aDecoder decodeObjectForKey:KKMedicineChestModel_products];
    self.detail = [aDecoder decodeObjectForKey:KKMedicineChestModel_detail];
    self.mcMode = [aDecoder decodeIntegerForKey:KKMedicineChestModel_mcMode];
    self.remarks = [aDecoder decodeObjectForKey:KKMedicineChestModel_remarks];
    self.saveDate = [aDecoder decodeObjectForKey:KKMedicineChestModel_saveDate];
    return self;
}
@end


static NSString *supervisionCode_expiry_date = @"supervisionCode_expiry_date ";
static NSString *supervisionCode_retcode = @"supervisionCode_retcode ";
static NSString *supervisionCode_codeStatus = @"supervisionCode_codeStatus ";
static NSString *supervisionCode_codeTitle = @"supervisionCode_codeTitle ";
static NSString *supervisionCode_issue_expiry = @"supervisionCode_issue_expiry ";
static NSString *supervisionCode_pkg_spec = @"supervisionCode_pkg_spec ";
static NSString *supervisionCode_codeCode = @"supervisionCode_codeCode ";
static NSString *supervisionCode_license_number = @"supervisionCode_license_number ";
static NSString *supervisionCode_thumb_url = @"supervisionCode_thumb_url ";
static NSString *supervisionCode_production_date = @"supervisionCode_production_date ";
static NSString *supervisionCode_sale_time = @"supervisionCode_sale_time ";
static NSString *supervisionCode_codeCategory = @"supervisionCode_codeCategory ";
static NSString *supervisionCode_ref_id = @"supervisionCode_ref_id ";
static NSString *supervisionCode_last_ent = @"supervisionCode_last_ent ";
static NSString *supervisionCode_first_query = @"supervisionCode_first_query ";
static NSString *supervisionCode_sale_ent = @"supervisionCode_sale_ent ";
static NSString *supervisionCode_specifications = @"supervisionCode_specifications ";
static NSString *supervisionCode_codeExpired = @"supervisionCode_codeExpired ";
static NSString *supervisionCode_query_time = @"supervisionCode_query_time ";
static NSString *supervisionCode_manufacturer = @"supervisionCode_manufacturer ";
static NSString *supervisionCode_last_time = @"supervisionCode_last_time ";
static NSString *supervisionCode_prepn_type = @"supervisionCode_prepn_type ";
static NSString *supervisionCode_prepn_unit = @"supervisionCode_prepn_unit ";
static NSString *supervisionCode_production_batch = @"supervisionCode_production_batch";
static NSString *supervisionCode_pkg_unit = @"supervisionCode_pkg_unit ";
static NSString *supervisionCode_flow = @"supervisionCode_flow ";
static NSString *supervisionCode_is_sale = @"supervisionCode_is_sale ";
@implementation supervisionCode
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.expiry_date forKey:supervisionCode_expiry_date ];
    [aCoder encodeInteger:self.retcode forKey:supervisionCode_retcode ];
    [aCoder encodeObject:self.codeStatus forKey:supervisionCode_codeStatus ];
    [aCoder encodeObject:self.codeTitle forKey:supervisionCode_codeTitle ];
    [aCoder encodeObject:self.issue_expiry forKey:supervisionCode_issue_expiry ];
    [aCoder encodeObject:self.pkg_spec forKey:supervisionCode_pkg_spec ];
    [aCoder encodeObject:self.codeCode forKey:supervisionCode_codeCode ];
    [aCoder encodeObject:self.license_number forKey:supervisionCode_license_number ];
    [aCoder encodeObject:self.thumb_url forKey:supervisionCode_thumb_url ];
    [aCoder encodeObject:self.production_date forKey:supervisionCode_production_date ];
    [aCoder encodeObject:self.sale_time forKey:supervisionCode_sale_time ];
    [aCoder encodeObject:self.codeCategory forKey:supervisionCode_codeCategory ];
    [aCoder encodeObject:self.ref_id forKey:supervisionCode_ref_id ];
    [aCoder encodeObject:self.last_ent forKey:supervisionCode_last_ent ];
    [aCoder encodeObject:self.first_query forKey:supervisionCode_first_query ];
    [aCoder encodeObject:self.sale_ent forKey:supervisionCode_sale_ent ];
    [aCoder encodeObject:self.specifications forKey:supervisionCode_specifications ];
    [aCoder encodeBool:self.codeExpired forKey:supervisionCode_codeExpired ];
    [aCoder encodeInteger:self.query_time forKey:supervisionCode_query_time ];
    [aCoder encodeObject:self.manufacturer forKey:supervisionCode_manufacturer ];
    [aCoder encodeObject:self.last_time forKey:supervisionCode_last_time ];
    [aCoder encodeObject:self.prepn_type forKey:supervisionCode_prepn_type ];
    [aCoder encodeObject:self.prepn_unit forKey:supervisionCode_prepn_unit ];
    [aCoder encodeInteger:self.production_batch forKey:supervisionCode_production_batch];
    [aCoder encodeObject:self.pkg_unit forKey:supervisionCode_pkg_unit ];
    [aCoder encodeObject:self.flow forKey:supervisionCode_flow ];
    [aCoder encodeBool:self.is_sale forKey:supervisionCode_is_sale ];
}
- (id)initWithCoder:(NSCoder *)aDecoder {
    self.expiry_date = [aDecoder decodeObjectForKey:supervisionCode_expiry_date ];
    self.retcode = [aDecoder decodeIntegerForKey:supervisionCode_retcode ];
    self.codeStatus = [aDecoder decodeObjectForKey:supervisionCode_codeStatus ];
    self.codeTitle = [aDecoder decodeObjectForKey:supervisionCode_codeTitle ];
    self.issue_expiry = [aDecoder decodeObjectForKey:supervisionCode_issue_expiry ];
    self.pkg_spec = [aDecoder decodeObjectForKey:supervisionCode_pkg_spec ];
    self.codeCode = [aDecoder decodeObjectForKey:supervisionCode_codeCode ];
    self.license_number = [aDecoder decodeObjectForKey:supervisionCode_license_number ];
    self.thumb_url = [aDecoder decodeObjectForKey:supervisionCode_thumb_url ];
    self.production_date = [aDecoder decodeObjectForKey:supervisionCode_production_date ];
    self.sale_time = [aDecoder decodeObjectForKey:supervisionCode_sale_time ];
    self.codeCategory = [aDecoder decodeObjectForKey:supervisionCode_codeCategory ];
    self.ref_id = [aDecoder decodeObjectForKey:supervisionCode_ref_id ];
    self.last_ent = [aDecoder decodeObjectForKey:supervisionCode_last_ent ];
    self.first_query = [aDecoder decodeObjectForKey:supervisionCode_first_query ];
    self.sale_ent = [aDecoder decodeObjectForKey:supervisionCode_sale_ent ];
    self.specifications = [aDecoder decodeObjectForKey:supervisionCode_specifications ];
    self.codeExpired = [aDecoder decodeBoolForKey:supervisionCode_codeExpired ];
    self.query_time = [aDecoder decodeIntegerForKey:supervisionCode_query_time ];
    self.manufacturer = [aDecoder decodeObjectForKey:supervisionCode_manufacturer ];
    self.last_time = [aDecoder decodeObjectForKey:supervisionCode_last_time ];
    self.prepn_type = [aDecoder decodeObjectForKey:supervisionCode_prepn_type ];
    self.prepn_unit = [aDecoder decodeObjectForKey:supervisionCode_prepn_unit ];
    self.production_batch = [aDecoder decodeIntegerForKey:supervisionCode_production_batch];
    self.pkg_unit = [aDecoder decodeObjectForKey:supervisionCode_pkg_unit ];
    self.flow = [aDecoder decodeObjectForKey:supervisionCode_flow ];
    self.is_sale = [aDecoder decodeBoolForKey:supervisionCode_is_sale ];
    return self;
}
@end



static NSString *productCode_codeId = @"productCode_codeId ";
static NSString *productCode_drugId = @"productCode_drugId ";
static NSString *productCode_manuId = @"productCode_manuId ";
static NSString *productCode_turnRatio = @"productCode_turnRatio ";
static NSString *productCode_packUom = @"productCode_packUom ";
static NSString *productCode_goodsManu = @"productCode_goodsManu ";
static NSString *productCode_standard = @"productCode_standard ";
static NSString *productCode_packageNorm = @"productCode_packageNorm ";
static NSString *productCode_drugEname = @"productCode_drugEname ";
static NSString *productCode_passNum = @"productCode_passNum ";
static NSString *productCode_leastUom = @"productCode_leastUom ";
static NSString *productCode_drugName = @"productCode_drugName ";
static NSString *productCode_goodsName = @"productCode_goodsName ";
static NSString *productCode_codeForm = @"productCode_codeForm ";
static NSString *productCode_barCode = @"productCode_barCode ";
static NSString *productCode_drugShortName = @"productCode_drugShortName";
static NSString *productCode_standardCode = @"productCode_standardCode ";
static NSString *productCode_codeStatus = @"productCode_codeStatus ";
@implementation productCode
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.codeId forKey:productCode_codeId ];
    [aCoder encodeObject:self.drugId forKey:productCode_drugId ];
    [aCoder encodeObject:self.manuId forKey:productCode_manuId ];
    [aCoder encodeObject:self.turnRatio forKey:productCode_turnRatio ];
    [aCoder encodeObject:self.packUom forKey:productCode_packUom ];
    [aCoder encodeObject:self.goodsManu forKey:productCode_goodsManu ];
    [aCoder encodeObject:self.standard forKey:productCode_standard ];
    [aCoder encodeObject:self.packageNorm forKey:productCode_packageNorm ];
    [aCoder encodeObject:self.drugEname forKey:productCode_drugEname ];
    [aCoder encodeObject:self.passNum forKey:productCode_passNum ];
    [aCoder encodeObject:self.leastUom forKey:productCode_leastUom ];
    [aCoder encodeObject:self.drugName forKey:productCode_drugName ];
    [aCoder encodeObject:self.goodsName forKey:productCode_goodsName ];
    [aCoder encodeObject:self.codeForm forKey:productCode_codeForm ];
    [aCoder encodeObject:self.barCode forKey:productCode_barCode ];
    [aCoder encodeObject:self.drugShortName forKey:productCode_drugShortName];
    [aCoder encodeObject:self.standardCode forKey:productCode_standardCode ];
    [aCoder encodeObject:self.codeStatus forKey:productCode_codeStatus ];
}
- (id)initWithCoder:(NSCoder *)aDecoder {
    self.codeId = [aDecoder decodeObjectForKey:productCode_codeId ];
    self.drugId = [aDecoder decodeObjectForKey:productCode_drugId ];
    self.manuId = [aDecoder decodeObjectForKey:productCode_manuId ];
    self.turnRatio = [aDecoder decodeObjectForKey:productCode_turnRatio ];
    self.packUom = [aDecoder decodeObjectForKey:productCode_packUom ];
    self.goodsManu = [aDecoder decodeObjectForKey:productCode_goodsManu ];
    self.standard = [aDecoder decodeObjectForKey:productCode_standard ];
    self.packageNorm = [aDecoder decodeObjectForKey:productCode_packageNorm ];
    self.drugEname = [aDecoder decodeObjectForKey:productCode_drugEname ];
    self.passNum = [aDecoder decodeObjectForKey:productCode_passNum ];
    self.leastUom = [aDecoder decodeObjectForKey:productCode_leastUom ];
    self.drugName = [aDecoder decodeObjectForKey:productCode_drugName ];
    self.goodsName = [aDecoder decodeObjectForKey:productCode_goodsName ];
    self.codeForm = [aDecoder decodeObjectForKey:productCode_codeForm ];
    self.barCode = [aDecoder decodeObjectForKey:productCode_barCode ];
    self.drugShortName = [aDecoder decodeObjectForKey:productCode_drugShortName];
    self.standardCode = [aDecoder decodeObjectForKey:productCode_standardCode ];
    self.codeStatus = [aDecoder decodeObjectForKey:productCode_codeStatus ];
    return self;
}
@end




static NSString *medicDetail_medicDescription = @"medicDetail_medicDescription";
static NSString *medicDetail_fcount = @"medicDetail_fcount ";
static NSString *medicDetail_medicId = @"medicDetail_medicId ";
static NSString *medicDetail_medicMessage = @"medicDetail_medicMessage ";
static NSString *medicDetail_medicStatus = @"medicDetail_medicStatus ";
static NSString *medicDetail_medicCount = @"medicDetail_medicCount ";
static NSString *medicDetail_url = @"medicDetail_url ";
static NSString *medicDetail_img = @"medicDetail_img ";
static NSString *medicDetail_medicType = @"medicDetail_medicType ";
static NSString *medicDetail_medicPrice = @"medicDetail_medicPrice ";
static NSString *medicDetail_medicTag = @"medicDetail_medicTag ";
static NSString *medicDetail_keywords = @"medicDetail_keywords ";
static NSString *medicDetail_medicName = @"medicDetail_medicName ";
static NSString *medicDetail_rcount = @"medicDetail_rcount ";
static NSString *medicDetail_numbers = @"medicDetail_numbers ";
static NSString *medicDetail_codes = @"medicDetail_codes ";

@implementation MedicDetail
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject :self.medicDescription forKey:medicDetail_medicDescription];
    [aCoder encodeInteger:self.fcount forKey:medicDetail_fcount ];
    [aCoder encodeInteger:self.medicId forKey:medicDetail_medicId ];
    [aCoder encodeObject :self.medicMessage forKey:medicDetail_medicMessage ];
    [aCoder encodeBool :self.medicStatus forKey:medicDetail_medicStatus ];
    [aCoder encodeInteger:self.medicCount forKey:medicDetail_medicCount ];
    [aCoder encodeObject :self.url forKey:medicDetail_url ];
    [aCoder encodeObject :self.img forKey:medicDetail_img ];
    [aCoder encodeObject :self.medicType forKey:medicDetail_medicType ];
    [aCoder encodeFloat :self.medicPrice forKey:medicDetail_medicPrice ];
    [aCoder encodeObject :self.medicTag forKey:medicDetail_medicTag ];
    [aCoder encodeObject :self.keywords forKey:medicDetail_keywords ];
    [aCoder encodeObject :self.medicName forKey:medicDetail_medicName ];
    [aCoder encodeInteger:self.rcount forKey:medicDetail_rcount ];
    [aCoder encodeObject:self.numbers forKey:medicDetail_numbers ];
    [aCoder encodeObject:self.codes forKey:medicDetail_codes ];
}
- (id)initWithCoder:(NSCoder *)aDecoder {
    self.medicDescription = [aDecoder decodeObjectForKey:medicDetail_medicDescription];
    self.fcount = [aDecoder decodeIntegerForKey:medicDetail_fcount ];
    self.medicId = [aDecoder decodeIntegerForKey:medicDetail_medicId ];
    self.medicMessage = [aDecoder decodeObjectForKey:medicDetail_medicMessage ];
    self.medicStatus = [aDecoder decodeBoolForKey:medicDetail_medicStatus ];
    self.medicCount = [aDecoder decodeIntegerForKey:medicDetail_medicCount ];
    self.url = [aDecoder decodeObjectForKey:medicDetail_url ];
    self.img = [aDecoder decodeObjectForKey:medicDetail_img ];
    self.medicType = [aDecoder decodeObjectForKey:medicDetail_medicType ];
    self.medicPrice = [aDecoder decodeFloatForKey:medicDetail_medicPrice ];
    self.medicTag = [aDecoder decodeObjectForKey:medicDetail_medicTag ];
    self.keywords = [aDecoder decodeObjectForKey:medicDetail_keywords ];
    self.medicName = [aDecoder decodeObjectForKey:medicDetail_medicName ];
    self.rcount = [aDecoder decodeIntegerForKey:medicDetail_rcount ];
    self.numbers = [aDecoder decodeObjectForKey:medicDetail_numbers ];
    self.codes = [aDecoder decodeObjectForKey:medicDetail_codes ];
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



static NSString *Numbers_numberDrug = @"Numbers_numberDrug ";
static NSString *Numbers_factory = @"Numbers_factory ";
static NSString *Numbers_numberId = @"Numbers_numberId ";
static NSString *Numbers_number = @"Numbers_number ";
@implementation Numbers
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeInteger :self.numberDrug forKey:Numbers_numberDrug];
    [aCoder encodeObject:self.factory forKey:Numbers_factory ];
    [aCoder encodeInteger:self.numberId forKey:Numbers_numberId ];
    [aCoder encodeObject :self.number forKey:Numbers_number ];
}
- (id)initWithCoder:(NSCoder *)aDecoder {
    self.numberDrug = [aDecoder decodeIntegerForKey:Numbers_numberDrug];
    self.factory = [aDecoder decodeObjectForKey:Numbers_factory ];
    self.numberId = [aDecoder decodeIntegerForKey:Numbers_numberId ];
    self.number = [aDecoder decodeObjectForKey:Numbers_number ];
    return self;
}
@end


static NSString *Codes_code = @"Codes_code";
static NSString *Codes_codeDrug = @"Codes_codeDrug";
static NSString *Codes_factory = @"Codes_factory";
static NSString *Codes_codeId = @"Codes_codeId";
@implementation Codes
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject :self.code forKey:Codes_code];
    [aCoder encodeInteger:self.codeDrug forKey:Codes_codeDrug ];
    [aCoder encodeObject:self.factory forKey:Codes_factory ];
    [aCoder encodeInteger :self.codeId forKey:Codes_codeId ]; 
} 
- (id)initWithCoder:(NSCoder *)aDecoder { 
    self.code = [aDecoder decodeObjectForKey:Codes_code]; 
    self.codeDrug = [aDecoder decodeIntegerForKey:Codes_codeDrug ]; 
    self.factory = [aDecoder decodeObjectForKey:Codes_factory ]; 
    self.codeId = [aDecoder decodeIntegerForKey:Codes_codeId ]; 
    return self; 
} 
@end 





//static NSString *supervisionCode_expiry_date      = @"supervisionCode_expiry_date     ";
//static NSString *supervisionCode_retcode          = @"supervisionCode_retcode         ";
//static NSString *supervisionCode_codeStatus       = @"supervisionCode_codeStatus      ";
//static NSString *supervisionCode_codeTitle        = @"supervisionCode_codeTitle       ";
//static NSString *supervisionCode_issue_expiry     = @"supervisionCode_issue_expiry    ";
//static NSString *supervisionCode_pkg_spec         = @"supervisionCode_pkg_spec        ";
//static NSString *supervisionCode_codeCode         = @"supervisionCode_codeCode        ";
//static NSString *supervisionCode_license_number   = @"supervisionCode_license_number  ";
//static NSString *supervisionCode_thumb_url        = @"supervisionCode_thumb_url       ";
//static NSString *supervisionCode_production_date  = @"supervisionCode_production_date ";
//static NSString *supervisionCode_sale_time        = @"supervisionCode_sale_time       ";
//static NSString *supervisionCode_codeCategory     = @"supervisionCode_codeCategory    ";
//static NSString *supervisionCode_ref_id           = @"supervisionCode_ref_id          ";
//static NSString *supervisionCode_last_ent         = @"supervisionCode_last_ent        ";
//static NSString *supervisionCode_first_query      = @"supervisionCode_first_query     ";
//static NSString *supervisionCode_sale_ent         = @"supervisionCode_sale_ent        ";
//static NSString *supervisionCode_specifications   = @"supervisionCode_specifications  ";
//static NSString *supervisionCode_codeExpired      = @"supervisionCode_codeExpired     ";
//static NSString *supervisionCode_query_time       = @"supervisionCode_query_time      ";
//static NSString *supervisionCode_manufacturer     = @"supervisionCode_manufacturer    ";
//static NSString *supervisionCode_last_time        = @"supervisionCode_last_time       ";
//static NSString *supervisionCode_prepn_type       = @"supervisionCode_prepn_type      ";
//static NSString *supervisionCode_prepn_unit       = @"supervisionCode_prepn_unit      ";
//static NSString *supervisionCode_production_batch = @"supervisionCode_production_batch";
//static NSString *supervisionCode_pkg_unit         = @"supervisionCode_pkg_unit        ";
//static NSString *supervisionCode_flow             = @"supervisionCode_flow            ";
//static NSString *supervisionCode_is_sale          = @"supervisionCode_is_sale         ";
//@implementation supervisionCode
//- (void)encodeWithCoder:(NSCoder *)aCoder {
//    [aCoder encodeObject:self.expiry_date      forKey:supervisionCode_expiry_date     ];
//    [aCoder encodeInteger:self.retcode          forKey:supervisionCode_retcode         ];
//    [aCoder encodeObject:self.codeStatus       forKey:supervisionCode_codeStatus      ];
//    [aCoder encodeObject:self.codeTitle        forKey:supervisionCode_codeTitle       ];
//    [aCoder encodeObject:self.issue_expiry     forKey:supervisionCode_issue_expiry    ];
//    [aCoder encodeObject:self.pkg_spec         forKey:supervisionCode_pkg_spec        ];
//    [aCoder encodeObject:self.codeCode         forKey:supervisionCode_codeCode        ];
//    [aCoder encodeObject:self.license_number   forKey:supervisionCode_license_number  ];
//    [aCoder encodeObject:self.thumb_url        forKey:supervisionCode_thumb_url       ];
//    [aCoder encodeObject:self.production_date  forKey:supervisionCode_production_date ];
//    [aCoder encodeObject:self.sale_time        forKey:supervisionCode_sale_time       ];
//    [aCoder encodeObject:self.codeCategory     forKey:supervisionCode_codeCategory    ];
//    [aCoder encodeObject:self.ref_id           forKey:supervisionCode_ref_id          ];
//    [aCoder encodeObject:self.last_ent         forKey:supervisionCode_last_ent        ];
//    [aCoder encodeObject:self.first_query      forKey:supervisionCode_first_query     ];
//    [aCoder encodeObject:self.sale_ent         forKey:supervisionCode_sale_ent        ];
//    [aCoder encodeObject:self.specifications   forKey:supervisionCode_specifications  ];
//    [aCoder encodeBool:self.codeExpired      forKey:supervisionCode_codeExpired     ];
//    [aCoder encodeInteger:self.query_time       forKey:supervisionCode_query_time      ];
//    [aCoder encodeObject:self.manufacturer     forKey:supervisionCode_manufacturer    ];
//    [aCoder encodeObject:self.last_time        forKey:supervisionCode_last_time       ];
//    [aCoder encodeObject:self.prepn_type       forKey:supervisionCode_prepn_type      ];
//    [aCoder encodeObject:self.prepn_unit       forKey:supervisionCode_prepn_unit      ];
//    [aCoder encodeInteger:self.production_batch forKey:supervisionCode_production_batch];
//    [aCoder encodeObject:self.pkg_unit         forKey:supervisionCode_pkg_unit        ];
//    [aCoder encodeObject:self.flow             forKey:supervisionCode_flow            ];
//    [aCoder encodeBool:self.is_sale          forKey:supervisionCode_is_sale         ];
//}
//- (id)initWithCoder:(NSCoder *)aDecoder {
//    self.expiry_date      = [aDecoder decodeObjectForKey:supervisionCode_expiry_date     ];
//    self.retcode          = [aDecoder decodeIntegerForKey:supervisionCode_retcode         ];
//    self.codeStatus       = [aDecoder decodeObjectForKey:supervisionCode_codeStatus      ];
//    self.codeTitle        = [aDecoder decodeObjectForKey:supervisionCode_codeTitle       ];
//    self.issue_expiry     = [aDecoder decodeObjectForKey:supervisionCode_issue_expiry    ];
//    self.pkg_spec         = [aDecoder decodeObjectForKey:supervisionCode_pkg_spec        ];
//    self.codeCode         = [aDecoder decodeObjectForKey:supervisionCode_codeCode        ];
//    self.license_number   = [aDecoder decodeObjectForKey:supervisionCode_license_number  ];
//    self.thumb_url        = [aDecoder decodeObjectForKey:supervisionCode_thumb_url       ];
//    self.production_date  = [aDecoder decodeObjectForKey:supervisionCode_production_date ];
//    self.sale_time        = [aDecoder decodeObjectForKey:supervisionCode_sale_time       ];
//    self.codeCategory     = [aDecoder decodeObjectForKey:supervisionCode_codeCategory    ];
//    self.ref_id           = [aDecoder decodeObjectForKey:supervisionCode_ref_id          ];
//    self.last_ent         = [aDecoder decodeObjectForKey:supervisionCode_last_ent        ];
//    self.first_query      = [aDecoder decodeObjectForKey:supervisionCode_first_query     ];
//    self.sale_ent         = [aDecoder decodeObjectForKey:supervisionCode_sale_ent        ];
//    self.specifications   = [aDecoder decodeObjectForKey:supervisionCode_specifications  ];
//    self.codeExpired      = [aDecoder decodeBoolForKey:supervisionCode_codeExpired     ];
//    self.query_time       = [aDecoder decodeIntegerForKey:supervisionCode_query_time      ];
//    self.manufacturer     = [aDecoder decodeObjectForKey:supervisionCode_manufacturer    ];
//    self.last_time        = [aDecoder decodeObjectForKey:supervisionCode_last_time       ];
//    self.prepn_type       = [aDecoder decodeObjectForKey:supervisionCode_prepn_type      ];
//    self.prepn_unit       = [aDecoder decodeObjectForKey:supervisionCode_prepn_unit      ];
//    self.production_batch = [aDecoder decodeIntegerForKey:supervisionCode_production_batch];
//    self.pkg_unit         = [aDecoder decodeObjectForKey:supervisionCode_pkg_unit        ];
//    self.flow             = [aDecoder decodeObjectForKey:supervisionCode_flow            ];
//    self.is_sale          = [aDecoder decodeBoolForKey:supervisionCode_is_sale         ];
//    return self;
//}
//@end
//
//
//
//static NSString *productCode_codeId        = @"productCode_codeId       ";
//static NSString *productCode_drugId        = @"productCode_drugId       ";
//static NSString *productCode_manuId        = @"productCode_manuId       ";
//static NSString *productCode_turnRatio     = @"productCode_turnRatio    ";
//static NSString *productCode_packUom       = @"productCode_packUom      ";
//static NSString *productCode_goodsManu     = @"productCode_goodsManu    ";
//static NSString *productCode_standard      = @"productCode_standard     ";
//static NSString *productCode_packageNorm   = @"productCode_packageNorm  ";
//static NSString *productCode_drugEname     = @"productCode_drugEname    ";
//static NSString *productCode_passNum       = @"productCode_passNum      ";
//static NSString *productCode_leastUom      = @"productCode_leastUom     ";
//static NSString *productCode_drugName      = @"productCode_drugName     ";
//static NSString *productCode_goodsName     = @"productCode_goodsName    ";
//static NSString *productCode_codeForm      = @"productCode_codeForm     ";
//static NSString *productCode_barCode       = @"productCode_barCode      ";
//static NSString *productCode_drugShortName = @"productCode_drugShortName";
//static NSString *productCode_standardCode  = @"productCode_standardCode ";
//static NSString *productCode_codeStatus    = @"productCode_codeStatus   ";
//@implementation productCode
//- (void)encodeWithCoder:(NSCoder *)aCoder {
//    [aCoder encodeObject:self.codeId        forKey:productCode_codeId       ];
//    [aCoder encodeObject:self.drugId        forKey:productCode_drugId       ];
//    [aCoder encodeObject:self.manuId        forKey:productCode_manuId       ];
//    [aCoder encodeObject:self.turnRatio     forKey:productCode_turnRatio    ];
//    [aCoder encodeObject:self.packUom       forKey:productCode_packUom      ];
//    [aCoder encodeObject:self.goodsManu     forKey:productCode_goodsManu    ];
//    [aCoder encodeObject:self.standard      forKey:productCode_standard     ];
//    [aCoder encodeObject:self.packageNorm   forKey:productCode_packageNorm  ];
//    [aCoder encodeObject:self.drugEname     forKey:productCode_drugEname    ];
//    [aCoder encodeObject:self.passNum       forKey:productCode_passNum      ];
//    [aCoder encodeObject:self.leastUom      forKey:productCode_leastUom     ];
//    [aCoder encodeObject:self.drugName      forKey:productCode_drugName     ];
//    [aCoder encodeObject:self.goodsName     forKey:productCode_goodsName    ];
//    [aCoder encodeObject:self.codeForm      forKey:productCode_codeForm     ];
//    [aCoder encodeObject:self.barCode       forKey:productCode_barCode      ];
//    [aCoder encodeObject:self.drugShortName forKey:productCode_drugShortName];
//    [aCoder encodeObject:self.standardCode  forKey:productCode_standardCode ];
//    [aCoder encodeObject:self.codeStatus    forKey:productCode_codeStatus   ];
//}
//- (id)initWithCoder:(NSCoder *)aDecoder {
//    self.codeId        = [aDecoder decodeObjectForKey:productCode_codeId       ];
//    self.drugId        = [aDecoder decodeObjectForKey:productCode_drugId       ];
//    self.manuId        = [aDecoder decodeObjectForKey:productCode_manuId       ];
//    self.turnRatio     = [aDecoder decodeObjectForKey:productCode_turnRatio    ];
//    self.packUom       = [aDecoder decodeObjectForKey:productCode_packUom      ];
//    self.goodsManu     = [aDecoder decodeObjectForKey:productCode_goodsManu    ];
//    self.standard      = [aDecoder decodeObjectForKey:productCode_standard     ];
//    self.packageNorm   = [aDecoder decodeObjectForKey:productCode_packageNorm  ];
//    self.drugEname     = [aDecoder decodeObjectForKey:productCode_drugEname    ];
//    self.passNum       = [aDecoder decodeObjectForKey:productCode_passNum      ];
//    self.leastUom      = [aDecoder decodeObjectForKey:productCode_leastUom     ];
//    self.drugName      = [aDecoder decodeObjectForKey:productCode_drugName     ];
//    self.goodsName     = [aDecoder decodeObjectForKey:productCode_goodsName    ];
//    self.codeForm      = [aDecoder decodeObjectForKey:productCode_codeForm     ];
//    self.barCode       = [aDecoder decodeObjectForKey:productCode_barCode      ];
//    self.drugShortName = [aDecoder decodeObjectForKey:productCode_drugShortName];
//    self.standardCode  = [aDecoder decodeObjectForKey:productCode_standardCode ];
//    self.codeStatus    = [aDecoder decodeObjectForKey:productCode_codeStatus   ];
//    return self;
//}
//@end
//
//
//
//
//static NSString *medicDetail_medicDescription = @"medicDetail_medicDescription";
//static NSString *medicDetail_fcount           = @"medicDetail_fcount          ";
//static NSString *medicDetail_medicId          = @"medicDetail_medicId         ";
//static NSString *medicDetail_medicMessage     = @"medicDetail_medicMessage    ";
//static NSString *medicDetail_medicStatus      = @"medicDetail_medicStatus     ";
//static NSString *medicDetail_medicCount       = @"medicDetail_medicCount      ";
//static NSString *medicDetail_url              = @"medicDetail_url             ";
//static NSString *medicDetail_img              = @"medicDetail_img             ";
//static NSString *medicDetail_medicType        = @"medicDetail_medicType       ";
//static NSString *medicDetail_medicPrice       = @"medicDetail_medicPrice      ";
//static NSString *medicDetail_medicTag         = @"medicDetail_medicTag        ";
//static NSString *medicDetail_keywords         = @"medicDetail_keywords        ";
//static NSString *medicDetail_medicName        = @"medicDetail_medicName       ";
//static NSString *medicDetail_rcount           = @"medicDetail_rcount          ";
//static NSString *medicDetail_numbers           = @"medicDetail_numbers          ";
//static NSString *medicDetail_codes           = @"medicDetail_codes          ";
//
//@implementation MedicDetail
//- (void)encodeWithCoder:(NSCoder *)aCoder {
//    [aCoder encodeObject :self.medicDescription forKey:medicDetail_medicDescription];
//    [aCoder encodeInteger:self.fcount           forKey:medicDetail_fcount          ];
//    [aCoder encodeInteger:self.medicId          forKey:medicDetail_medicId         ];
//    [aCoder encodeObject :self.medicMessage     forKey:medicDetail_medicMessage    ];
//    [aCoder encodeBool     :self.medicStatus      forKey:medicDetail_medicStatus     ];
//    [aCoder encodeInteger:self.medicCount       forKey:medicDetail_medicCount      ];
//    [aCoder encodeObject :self.url              forKey:medicDetail_url             ];
//    [aCoder encodeObject :self.img              forKey:medicDetail_img             ];
//    [aCoder encodeObject :self.medicType        forKey:medicDetail_medicType       ];
//    [aCoder encodeFloat  :self.medicPrice       forKey:medicDetail_medicPrice      ];
//    [aCoder encodeObject :self.medicTag         forKey:medicDetail_medicTag        ];
//    [aCoder encodeObject :self.keywords         forKey:medicDetail_keywords        ];
//    [aCoder encodeObject :self.medicName        forKey:medicDetail_medicName       ];
//    [aCoder encodeInteger:self.rcount           forKey:medicDetail_rcount          ];
//    [aCoder encodeObject:self.numbers           forKey:medicDetail_numbers          ];
//    [aCoder encodeObject:self.codes           forKey:medicDetail_codes          ];
//}
//- (id)initWithCoder:(NSCoder *)aDecoder {
//    self.medicDescription = [aDecoder decodeObjectForKey:medicDetail_medicDescription];
//    self.fcount           = [aDecoder decodeIntegerForKey:medicDetail_fcount          ];
//    self.medicId          = [aDecoder decodeIntegerForKey:medicDetail_medicId         ];
//    self.medicMessage     = [aDecoder decodeObjectForKey:medicDetail_medicMessage    ];
//    self.medicStatus      = [aDecoder decodeBoolForKey:medicDetail_medicStatus     ];
//    self.medicCount       = [aDecoder decodeIntegerForKey:medicDetail_medicCount      ];
//    self.url              = [aDecoder decodeObjectForKey:medicDetail_url             ];
//    self.img              = [aDecoder decodeObjectForKey:medicDetail_img             ];
//    self.medicType        = [aDecoder decodeObjectForKey:medicDetail_medicType       ];
//    self.medicPrice       = [aDecoder decodeFloatForKey:medicDetail_medicPrice      ];
//    self.medicTag         = [aDecoder decodeObjectForKey:medicDetail_medicTag        ];
//    self.keywords         = [aDecoder decodeObjectForKey:medicDetail_keywords        ];
//    self.medicName        = [aDecoder decodeObjectForKey:medicDetail_medicName       ];
//    self.rcount           = [aDecoder decodeIntegerForKey:medicDetail_rcount          ];
//    self.numbers           = [aDecoder decodeObjectForKey:medicDetail_numbers          ];
//    self.codes           = [aDecoder decodeObjectForKey:medicDetail_codes          ];
//    return self;
//}
//
//- (NSArray<Numbers *> *)numbers {
//    if(_numbers == nil) {
//        _numbers = [[NSArray<Numbers *> alloc] init];
//    }
//    return _numbers;
//}
//
//- (NSArray<Codes *> *)codes {
//    if(_codes == nil) {
//        _codes = [[NSArray<Codes *> alloc] init];
//    }
//    return _codes;
//}
//
//@end
//
//
//
//static NSString *Numbers_numberDrug       = @"Numbers_numberDrug      ";
//static NSString *Numbers_factory         = @"Numbers_factory        ";
//static NSString *Numbers_numberId         = @"Numbers_numberId        ";
//static NSString *Numbers_number        = @"Numbers_number       ";
//@implementation Numbers
//- (void)encodeWithCoder:(NSCoder *)aCoder {
//    [aCoder encodeInteger :self.numberDrug forKey:Numbers_numberDrug];
//    [aCoder encodeObject:self.factory           forKey:Numbers_factory          ];
//    [aCoder encodeInteger:self.numberId          forKey:Numbers_numberId         ];
//    [aCoder encodeObject :self.number     forKey:Numbers_number    ];
//}
//- (id)initWithCoder:(NSCoder *)aDecoder {
//    self.numberDrug = [aDecoder decodeIntegerForKey:Numbers_numberDrug];
//    self.factory           = [aDecoder decodeObjectForKey:Numbers_factory          ];
//    self.numberId          = [aDecoder decodeIntegerForKey:Numbers_numberId         ];
//    self.number     = [aDecoder decodeObjectForKey:Numbers_number    ];
//    return self;
//}
//@end
//
//
//static NSString *Codes_code = @"Codes_code";
//static NSString *Codes_codeDrug = @"Codes_codeDrug";
//static NSString *Codes_factory = @"Codes_factory";
//static NSString *Codes_codeId = @"Codes_codeId";
//@implementation Codes
//- (void)encodeWithCoder:(NSCoder *)aCoder {
//    [aCoder encodeObject :self.code forKey:Codes_code];
//    [aCoder encodeInteger:self.codeDrug           forKey:Codes_codeDrug          ];
//    [aCoder encodeObject:self.factory          forKey:Codes_factory         ];
//    [aCoder encodeInteger :self.codeId     forKey:Codes_codeId    ];
//}
//- (id)initWithCoder:(NSCoder *)aDecoder {
//    self.code = [aDecoder decodeObjectForKey:Codes_code];
//    self.codeDrug           = [aDecoder decodeIntegerForKey:Codes_codeDrug          ];
//    self.factory          = [aDecoder decodeObjectForKey:Codes_factory         ];
//    self.codeId     = [aDecoder decodeIntegerForKey:Codes_codeId    ];
//    return self;
//}
//@end
//
//
