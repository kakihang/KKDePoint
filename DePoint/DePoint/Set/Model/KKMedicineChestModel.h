//
//  KKMedicineChestModel.h
//  DePoint
//
//  Created by kaki on 16/8/3.
//  Copyright © 2016年 liudhkk. All rights reserved.
//


typedef NS_ENUM(NSUInteger, KKMedicChMode) {
    KKMedicChModeNone = 0,
    KKMedicChModeSupersision, //20位监管码
    KKMedicChModeProduct, //13位商品码
    KKMedicChModeDetail, //详情
};


#import <Foundation/Foundation.h>

@class supervisionCode;
@class productCode;
@class MedicDetail, Numbers,Codes;
@interface KKMedicineChestModel : NSObject <NSCoding>


@property (nonatomic, strong) productCode *products; //13位商品码数据
@property (nonatomic, strong) supervisionCode *supervision; //20位监管码数据
@property (nonatomic, strong) MedicDetail *detail; //详情


@property (nonatomic, assign) KKMedicChMode mcMode; //类型 必输
@property (nonatomic, assign) NSString *remarks; //备注 选输
@property (nonatomic, strong) NSString *saveDate; //收藏时间 沙盒自动填写

//// 唯一值,以检查是否已收藏，是否重复收藏，必须赋值
//// 保存监管码信息时 药名+20位监管码
//// 保存商品码信息时 药名+13位商品码
//// 保存药品详情时  药名
//@property (nonatomic, copy) NSString *key;

@end



@interface supervisionCode : NSObject <NSCoding>

@property (nonatomic, copy) NSString *expiry_date;

//@property (nonatomic, assign) NSInteger retcode;
//
//@property (nonatomic, copy) NSString *codeStatus;
//
//@property (nonatomic, copy) NSString *codeTitle;  //药名
//
//@property (nonatomic, copy) NSString *issue_expiry;
//
//@property (nonatomic, copy) NSString *pkg_spec;

@property (nonatomic, copy) NSString *codeCode;   //20位监管码

//@property (nonatomic, copy) NSString *license_number;
//
//@property (nonatomic, copy) NSString *thumb_url;
//
//@property (nonatomic, copy) NSString *production_date;
//
//@property (nonatomic, copy) NSString *sale_time;
//
//@property (nonatomic, copy) NSString *codeCategory;
//
//@property (nonatomic, copy) NSString *ref_id;
//
//@property (nonatomic, copy) NSString *last_ent;
//
//@property (nonatomic, copy) NSString *first_query;
//
//@property (nonatomic, copy) NSString *sale_ent;
//
//@property (nonatomic, copy) NSString *specifications;
//
//@property (nonatomic, assign) BOOL codeExpired;
//
//@property (nonatomic, assign) NSInteger query_time;
//
//@property (nonatomic, copy) NSString *manufacturer;
//
//@property (nonatomic, copy) NSString *last_time;
//
//@property (nonatomic, copy) NSString *prepn_type;
//
//@property (nonatomic, copy) NSString *prepn_unit;
//
//@property (nonatomic, assign) NSInteger production_batch;
//
//@property (nonatomic, copy) NSString *pkg_unit;
//
//@property (nonatomic, copy) NSString *flow;
//
//@property (nonatomic, assign) BOOL is_sale;

@end



@interface productCode : NSObject <NSCoding>
//
//@property (nonatomic, copy) NSString *codeId;
//
//@property (nonatomic, copy) NSString *drugId;
//
//@property (nonatomic, copy) NSString *manuId;
//
//@property (nonatomic, copy) NSString *turnRatio;
//
//@property (nonatomic, copy) NSString *packUom;
//
//@property (nonatomic, copy) NSString *goodsManu;
//
//@property (nonatomic, copy) NSString *standard;
//
//@property (nonatomic, copy) NSString *packageNorm;
//
//@property (nonatomic, copy) NSString *drugEname;
//
//@property (nonatomic, copy) NSString *passNum;
//
//@property (nonatomic, copy) NSString *leastUom;
//
//@property (nonatomic, copy) NSString *drugName;  //药名
//
//@property (nonatomic, copy) NSString *goodsName;
//
//@property (nonatomic, copy) NSString *codeForm;
//
@property (nonatomic, copy) NSString *barCode;  //13位商品码
//
//@property (nonatomic, copy) NSString *drugShortName;
//
//@property (nonatomic, copy) NSString *standardCode;
//
//@property (nonatomic, copy) NSString *codeStatus;

@end





@interface MedicDetail : NSObject <NSCoding>
//
//@property (nonatomic, copy) NSString *medicDescription;
//
//@property (nonatomic, assign) NSInteger fcount;
//
//@property (nonatomic, assign) NSInteger medicId;
//
//@property (nonatomic, copy) NSString *medicMessage;
//
//@property (nonatomic, assign) BOOL medicStatus;
//
//@property (nonatomic, assign) NSInteger medicCount;
//
//@property (nonatomic, strong) NSArray<Numbers *> *numbers;
//
//@property (nonatomic, copy) NSString *url;
//
//@property (nonatomic, copy) NSString *img;
//
//@property (nonatomic, copy) NSString *medicType;
//
//@property (nonatomic, assign) CGFloat medicPrice;
//
//@property (nonatomic, copy) NSString *medicTag;
//
//@property (nonatomic, copy) NSString *keywords;
//
//@property (nonatomic, strong) NSArray<Codes *> *codes;
//
@property (nonatomic, copy) NSString *medicName;    //药名
//
//@property (nonatomic, assign) NSInteger rcount;

@end

//
//@interface Numbers : NSObject <NSCoding>
//
//@property (nonatomic, assign) NSInteger numberDrug;
//
//@property (nonatomic, copy) NSString *factory;
//
//@property (nonatomic, assign) NSInteger numberId;
//
//@property (nonatomic, copy) NSString *number;
//
//@end
//
//@interface Codes : NSObject <NSCoding>
//
//@property (nonatomic, copy) NSString *code;
//
//@property (nonatomic, assign) NSInteger codeDrug;
//
//@property (nonatomic, copy) NSString *factory;
//
//@property (nonatomic, assign) NSInteger codeId;
//


//@end

