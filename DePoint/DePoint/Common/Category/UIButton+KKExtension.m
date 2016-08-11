//
//  UIButton+KKExtension.m
//  DePoint
//
//  Created by kaki on 16/8/10.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "UIButton+KKExtension.h"

@implementation UIButton (KKExtension)

+ (instancetype)buttonWithType:(UIButtonType)buttonType title:(NSString *)title {
    UIButton *button = [UIButton buttonWithType:buttonType];
    [button setTitle:title forState:UIControlStateNormal];
    return button;
}
@end
