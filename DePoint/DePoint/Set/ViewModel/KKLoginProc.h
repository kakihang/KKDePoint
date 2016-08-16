//
//  KKLoginProc.h
//  DePoint
//
//  Created by kaki on 16/8/14.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KKLoginProc : NSObject
+ (void)kk_logout;
+ (NSString *)kk_getCurrentUser;
+ (NSString *)kk_getCurrentPhone;
+ (void)kk_registerWithPhone:(NSString *)phone complehandler:(void(^)(BOOL isSuccessful, NSError *error))complehandler;
+ (void)kk_registerWithPhone:(NSString *)phone password:(NSString *)password complehandler:(void(^)(BOOL isSuccessful, NSError *error))complehandler;
+ (void)kk_changePassAndLoginWithPhone:(NSString *)phone newPassword:(NSString *)newPassword complehandler:(void(^)(BOOL isSuccessful, NSError *error))complehandler;
+ (void)kk_updateCurrentUserPasswordWithOldPassword:(NSString *)oldPassword
                                        newPassword:(NSString *)newPassword
                                      complehandler:(void(^)(NSError *error))complehandler;
+ (void)kk_loginWithAccount:(NSString *)account
                   password:(NSString *)password
              complehandler:(void(^)(NSError *error))complehandler;
+ (void)kk_checkExistWithPhone:(NSString *)phone complehandler:(void(^)(BOOL isSuccessful, NSError *error, BOOL isExist))complehandler;
@end
