//
//  KKSetViewModel.m
//  DePoint
//
//  Created by kaki on 16/8/4.
//  Copyright © 2016年 liudhkk. All rights reserved.
//
#import "KKSetViewModel.h"
#import "KKAboutViewC.h"

@interface KKSetViewModel()

@property (nonatomic, strong) NSArray <NSArray *> *dataList; // 数据样式
@end




@implementation KKSetViewModel

- (instancetype)init {
    if (self = [super init]) {
    }
    return self;
}

-(NSInteger)getSectionNum {
    return self.dataList.count;
}
- (NSInteger)getRowBySection:(NSInteger)section {
    return self.dataList[section].count;
}

- (UIImage *)getIconByIndexPath:(NSIndexPath *)indexPath {
    return [UIImage imageNamed:self.dataList[indexPath.section][indexPath.row][@"icon"]];
}

- (NSString *)getTitleByIndexPath:(NSIndexPath *)indexPath {
    return self.dataList[indexPath.section][indexPath.row][@"title"];
}

- (NSString *)getAssistByIndexPath:(NSIndexPath *)indexPath {
    return self.dataList[indexPath.section][indexPath.row][@"assist"];
}

- (UIViewController *)getViewCtrlByIndexPath:(NSIndexPath *)indexPath {
    return self.dataList[indexPath.section][indexPath.row][@"viewController"];
}


#pragma mark - 懒加载

- (NSArray *)dataList {
    if(_dataList == nil) {
        _dataList = @[@[@{@"icon":@"set_icon",  //0-0
                          @"title":@"药箱",
                          @"assist":@""},
                        @{@"icon":@"set_icon",  //0-1
                          @"title":@"收藏",
                          @"assist":@""}],
                      @[@{@"icon":@"set_icon",  //1-0
                          @"title":@"清除缓存",
                          @"assist":@""},
                        @{@"icon":@"set_icon",  //1-1
                          @"title":@"推荐给朋友",
                          @"assist":@""},
                        @{@"icon":@"set_icon",  //1-2
                          @"title":@"给我评分",
                          @"assist":@""},
                        @{@"icon":@"set_icon",  //1-3
                          @"title":@"关于",
                          @"assist":@"",
                          @"viewController":[[KKAboutViewC alloc] init]}]];
    }
    return _dataList;
}

@end
