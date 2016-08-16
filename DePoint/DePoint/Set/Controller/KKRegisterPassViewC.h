//
//  KKRegisterPassViewC.h
//  DePoint
//
//  Created by kaki on 16/8/12.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKCustomVC.h"

@interface KKRegisterPassViewC : KKCustomVC
+ (instancetype)registerPasswordWithPhone:(NSString *)phone smsCode:(NSString *)smsCode;
- (instancetype)init;
@end
