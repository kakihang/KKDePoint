//
//  KKMediTVC.m
//  DePoint
//
//  Created by kaki on 16/8/8.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKMediTVC.h"

#import "KKMediHClassTVCell.h"
#import "KKMediMClassTVCell.h"
#import "KKMediTClassTVCell.h"

#import "KKMedClassVC.h"

@interface KKMediTVC () <KKMedCellClickDelegate>
@property (nonatomic, strong) NSArray *medArr; // 分类数组
@end

@implementation KKMediTVC {
    NSInteger selectBt;
}


static NSString *hID_ = @"HKKMediTVCCellIDH";
static NSString *mID_ = @"MKKMediTVCCellIDM";
static NSString *tID_ = @"TKKMediTVCCellIDT";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    selectBt = 0;
    UIImageView *headView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"headView"]];
    headView.contentMode = UIViewContentModeScaleAspectFill;
    headView.clipsToBounds = YES;
    [headView setFrame:CGRectMake(0, 0, KKSCREENBOUNDSIZE.width, KKSCREENBOUNDSIZE.height * 0.3)];
    [self.tableView registerClass:[KKMediHClassTVCell class] forCellReuseIdentifier:hID_];
    [self.tableView registerClass:[KKMediMClassTVCell class] forCellReuseIdentifier:mID_];
    [self.tableView registerClass:[KKMediTClassTVCell class] forCellReuseIdentifier:tID_];
    self.tableView.tableHeaderView = headView;
    self.tableView.sectionHeaderHeight = 5;
    self.tableView.sectionFooterHeight = 15;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (self.medArr.count<5) {
        NSLog(@"%s :参数字典不正确", __func__);
        return 0;
    }
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //    NSLog(@"%s", __func__);
    if (indexPath.section == 0) {
        KKMediHClassTVCell *cell = [tableView dequeueReusableCellWithIdentifier:hID_ forIndexPath:indexPath];
        [cell.medFirstBt setTitle:self.medArr[0][@"name"] forState:UIControlStateNormal];
        [cell.medFirstLb setText:self.medArr[0][@"des"]];
        [cell.medSecondBt setTitle:self.medArr[1][@"name"] forState:UIControlStateNormal];
        [cell.medSecondLb setText:self.medArr[1][@"des"]];
        //        [cell.medThirdBt setTitle:self.medArr[2][@"name"] forState:UIControlStateNormal];
        //        [cell.medThirdLb setText:self.medArr[2][@"des"]];
        [cell.medFirstBt bk_addEventHandler:^(id sender) {
            if (selectBt != 0) {
                selectBt = 0;
                [tableView reloadData];
            }
        } forControlEvents:UIControlEventTouchUpInside];
        [cell.medSecondBt bk_addEventHandler:^(id sender) {
            if (selectBt != 1) {
                selectBt = 1;
                [tableView reloadData];
            }
        } forControlEvents:UIControlEventTouchUpInside];
        return cell;
    } else if (indexPath.section == 1) {
        KKMediMClassTVCell *cell = [tableView dequeueReusableCellWithIdentifier:mID_ forIndexPath:indexPath];
        cell.label.text = self.medArr[selectBt][@"name"];
        return cell;
    } else {
        KKMediTClassTVCell *cell = [tableView dequeueReusableCellWithIdentifier:tID_ forIndexPath:indexPath];
        [cell.firstBt setTitle:self.medArr[selectBt][@"idList"][0][@"name"]  forState:UIControlStateNormal];
        [cell.secondBt setTitle:self.medArr[selectBt][@"idList"][1][@"name"] forState:UIControlStateNormal];
        //        [cell.thirdBt setTitle:self.medArr[selectBt][@"name"][2] forState:UIControlStateNormal];
        cell.KKCellClickDelgate = self;
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //    NSLog(@"%s %zd %zd", __func__, indexPath.section, indexPath.row);
    if (indexPath.section == 0) {
        return [tableView fd_heightForCellWithIdentifier:hID_ configuration:^(KKMediHClassTVCell *cell) {
            [cell.medFirstBt setTitle:self.medArr[0][@"name"] forState:UIControlStateNormal];
            [cell.medFirstLb setText:self.medArr[0][@"des"]];
            [cell.medSecondBt setTitle:self.medArr[1][@"name"] forState:UIControlStateNormal];
            [cell.medSecondLb setText:self.medArr[1][@"des"]];
            //            [cell.medThirdBt setTitle:self.medArr[2][@"name"] forState:UIControlStateNormal];
            //            [cell.medThirdLb setText:self.medArr[2][@"des"]];
        }];
    } else if (indexPath.section == 1) {
        return [tableView fd_heightForCellWithIdentifier:mID_ configuration:^(KKMediMClassTVCell *cell) {
            cell.label.text = self.medArr[selectBt][@"name"];
        }];
    } else {
        return [tableView fd_heightForCellWithIdentifier:tID_ configuration:^(KKMediTClassTVCell *cell) {
            
            [cell.firstBt setTitle:self.medArr[selectBt][@"idList"][0][@"name"] forState:UIControlStateNormal];
            [cell.secondBt setTitle:self.medArr[selectBt][@"idList"][1][@"name"] forState:UIControlStateNormal];
            //            [cell.thirdBt setTitle:self.medArr[selectBt][@"name"][2] forState:UIControlStateNormal];
        }];
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)cellClickIndex:(NSInteger)index {
    [self.navigationController pushViewController:[[KKMedClassVC alloc] initWithClassIndex:selectBt nindex:index data:self.medArr] animated:YES];
}


- (NSArray *)medArr {
    if(_medArr == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"kk.medi" ofType:@"plist"];
        _medArr = [NSArray arrayWithContentsOfFile:path];
    }
    return _medArr;
}

@end
