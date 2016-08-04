//
//  UIButton+KKNavBack.m
//  DePoint
//
//  Created by kaki on 16/8/4.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "UIButton+KKNavBack.h"

@implementation UIButton (KKNavBack)
+ (instancetype)kk_buttonForNavBack {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setFrame:CGRectMake(0, 0, 50, 50)];
    [button setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
    //    [button setTitle:@"<" forState:UIControlStateNormal];
    //    button.titleLabel.font = [UIFont systemFontOfSize:20];
    //    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTintColor:KKGLOTINTCOLOR];
    return button;
}
@end
