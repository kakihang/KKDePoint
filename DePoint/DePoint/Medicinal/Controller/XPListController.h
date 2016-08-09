//
//  XPListController.h
//  DePoint
//
//  Created by apple on 16/8/6.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XPListController : UITableViewController
-(instancetype)initWithDrug:(NSInteger)drug;
@property(nonatomic,readonly) NSInteger drug;




@end
