//
//  KKMediTClassTVCell.h
//  DePoint
//
//  Created by kaki on 16/8/8.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol KKMedCellClickDelegate <NSObject>

- (void)cellClickIndex:(NSInteger)index;

@end

@interface KKMediTClassTVCell : UITableViewCell
@property (nonatomic, strong) UIButton *firstBt; //
@property (nonatomic, strong) UIButton *secondBt; //
@property (nonatomic, strong) UIButton *thirdBt; //

@property (nonatomic, weak) id <KKMedCellClickDelegate> KKCellClickDelgate;
@end
