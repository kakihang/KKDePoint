//
//  KKCollectionModel.m
//  DePoint
//
//  Created by kaki on 16/8/3.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKCollectionModel.h"

@implementation KKCollectionModel

// 通过协议方法，指定当归档操作发生时，都有哪些属性需要扫描
- (void)encodeWithCoder:(NSCoder *)aCoder {
    KKFILE;
}
- (id)initWithCoder:(NSCoder *)aDecoder {
    
    if (self = [super init]) {
        KKSOLFILE;
    }
    return self;
}
@end
