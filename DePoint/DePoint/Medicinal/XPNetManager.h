//
//  XPNetManager.h
//  DePoint
//
//  Created by apple on 16/8/6.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseNetworking.h"
#import "XPDrugsModel.h"
#import "XPListModel.h"
#import "XPDrugNexineModel.h"
#import "XPDetailModel.h"
@interface XPNetManager : BaseNetworking
/*******************************药品分类**********************************/
+(id)getDrugscompletionHandler:(void(^)(XPDrugsModel *model,NSError *error))completionHandler;
/*******************************药品分类第二层*****************************/
+(id)getNexine:(NSInteger)page completionHandler:(void(^)(XPDrugNexineModel *model,NSError *error))completionHandler;
/*****************************药品列表************************************/
+(id)getList:(NSInteger)page completionHandler:(void(^)(XPListModel *model,NSError *error))completionHandler;
/************************药品信息详细**************************************/
+getDetail:(NSInteger)page completionHandler:(void(^)(XPDetailModel *model,NSError *error))completionHandler;

@end
