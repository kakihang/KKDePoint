//
//  KKCollectionModel.h
//  DePoint
//
//  Created by kaki on 16/8/3.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KKCollectionModel : NSObject

@property (nonatomic, assign) NSString *remarks; //备注 选输
@property (nonatomic, strong) NSString *saveDate; //收藏时间 沙盒自动填写


@property (nonatomic, copy) NSString *colPlace;

@property (nonatomic, copy) NSString *symptomtext;

@property (nonatomic, copy) NSString *drugtext;

@property (nonatomic, assign) BOOL colStatus;

@property (nonatomic, copy) NSString *colSymptom;

@property (nonatomic, copy) NSString *caretext;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *img;

@property (nonatomic, assign) NSInteger colCount;

@property (nonatomic, copy) NSString *checktext;

@property (nonatomic, copy) NSString *colDisease;

@property (nonatomic, copy) NSString *foodtext;

@property (nonatomic, copy) NSString *keywords;

@property (nonatomic, copy) NSString *name;  // 名称

@property (nonatomic, assign) NSInteger fcount;

@property (nonatomic, copy) NSString *food;

@property (nonatomic, copy) NSString *causetext;

@property (nonatomic, copy) NSString *diseasetext;

@property (nonatomic, assign) NSInteger colId;

@property (nonatomic, copy) NSString *colDepartment;

@property (nonatomic, assign) NSInteger rcount;

@property (nonatomic, copy) NSString *colMessage;

@property (nonatomic, copy) NSString *checks;

@property (nonatomic, copy) NSString *colDrug;

@property (nonatomic, copy) NSString *colDescription;

@end
