//
//  Constant.h
//  DePoint
//
//  Created by kaki on 16/7/22.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#ifndef Constant_h
#define Constant_h



// 三原色和透明度 颜色宏
#define KKCOLOR(kred, kgreen, kblue, kalpha) [UIColor colorWithRed:kred/255.0 green:kgreen/255.0 blue:kblue/255.0 alpha:kalpha]
// 图片设置宏
#define KKIMAGE(string) [UIImage imageNamed:string]
// 全局默认背景颜色
#define KKGLOBAL KKCOLOR(238, 238, 238, 1.0)
// bounds.size
#define KKSCREENBOUNDSIZE [UIScreen mainScreen].bounds.size




/** apiKey **/
// 高德地图key
#define KKGDMAPAPIKEY @"19d7dfa2a4734ca4f150e15db60d3dd3"
// 友盟数据统计
#define KKUMAPIKEY @"579dfeb7e0f55a2aa7000b56"






#endif /* Constant_h */




