//
//  XPMediHclassTVCell.h
//  DePoint
//
//  Created by apple on 16/8/13.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol XPMedCellDelegate<NSObject>
-(void)cellClick:(NSInteger)index;

@end

@interface XPMediHclassTVCell : UITableViewCell
@property(nonatomic) NSMutableArray<UIButton *> *xpClick;
@property(nonatomic) UIButton *moretn;
@property(nonatomic,weak)id<XPMedCellDelegate> XPCellDelegate;


@end
