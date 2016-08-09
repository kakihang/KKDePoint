//
//  KKMenuBarButton.m
//  DePoint
//
//  Created by kaki on 16/8/9.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKMenuBarButton.h"

@interface KKMenuBarButton()
@property (nonatomic, strong) NSArray *dataList; //
@property (nonatomic, strong) UITableView *leftView; //
@property (nonatomic, strong) UITableView *rightView; //
@end



@implementation KKMenuBarButton

+ (instancetype)buttonWithArray:(NSArray *)arr {
    if (!arr) {
        NSAssert1(NO, @"%s :传入数组不能为空", __func__);
    }
    KKMenuBarButton *menuBar = [[KKMenuBarButton alloc] init];
    menuBar.dataList = arr;
    [menuBar setupMenuBar];
    return menuBar;
}

- (void)setupMenuBar {
    CGFloat height = 25;
    CGFloat maxHeight = 300;
    CGFloat trueHeight = _dataList.count * height;
    if (trueHeight > maxHeight) {
        trueHeight = maxHeight;
    }
    
}

@end
