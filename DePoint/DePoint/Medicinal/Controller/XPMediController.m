//
//  XPMediController.m
//  DePoint
//
//  Created by apple on 16/8/13.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "XPMediController.h"
#import "XPMedClassVC.h"
#import "XPMediHclassTVCell.h"
#import "XPMediMClassTVCell.h"
#import "XPMediTClassTVCell.h"
#import "XPNetManager.h"
#import "XPMedClassVC.h"
#import "XPSearchController.h"
@interface XPMediController ()<XPMedCellClickDelegate,XPMedCellDelegate>
@property (nonatomic) NSArray *data;
@end

@implementation XPMediController{
    NSInteger selectBt;
}
static NSString *one = @"XPMedCellone";
static NSString *two = @"XPMedCelltwo";
static NSString *three = @"XPMedCellthree";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.scrollEnabled = NO;
    [XPFactory addSearchItemForVC:self clickedHandler:^{
        XPSearchController *vc =[[XPSearchController alloc]init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }];
    selectBt = 0;
    UIImageView *headView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"headView"]];
    headView.contentMode = UIViewContentModeScaleAspectFill;
    headView.clipsToBounds = YES;
    [headView setFrame:CGRectMake(0, 0,KWidth,WHeigth * 0.3)];
    [self.tableView registerClass:[XPMediHclassTVCell class] forCellReuseIdentifier:one];
    [self.tableView registerClass:[XPMediMClassTVCell class] forCellReuseIdentifier:two];
    [self.tableView registerClass:[XPMediTClassTVCell class] forCellReuseIdentifier:three];
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
    if(self.data.count < 5){
        return 0;
    }
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0){
        XPMediHclassTVCell *cell =[tableView dequeueReusableCellWithIdentifier:one forIndexPath:indexPath];
        [cell.xpClick enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [obj setTitle:self.data[idx][@"name"] forState:UIControlStateNormal];
        }];
        [cell.moretn setTitle:@"更多详情" forState:UIControlStateNormal];
        cell.XPCellDelegate = self;
        [cell.xpClick enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [obj bk_addEventHandler:^(id sender) {
                selectBt = idx;
                [tableView reloadData];
            } forControlEvents:UIControlEventTouchUpInside];
        }];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if(indexPath.section == 1){
        XPMediMClassTVCell *cell =[tableView dequeueReusableCellWithIdentifier:two forIndexPath:indexPath];
        cell.label.text = self.data[selectBt][@"name"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        XPMediTClassTVCell *cell =[tableView dequeueReusableCellWithIdentifier:three forIndexPath:indexPath];
        [cell.firstBt setTitle:self.data[selectBt][@"idList"][0][@"name"] forState:UIControlStateNormal];
        [cell.secondBt setTitle:self.data[selectBt][@"idList"][1][@"name"] forState:UIControlStateNormal];
        [cell.thirdBt setTitle:self.data[selectBt][@"idList"][2][@"name"] forState:UIControlStateNormal];
        cell.XPCellClickDelegate = self;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        return [tableView fd_heightForCellWithIdentifier:one configuration:^(XPMediHclassTVCell *cell) {
            [cell.xpClick enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [obj setTitle:self.data[idx][@""] forState:UIControlStateNormal];
            }];
        }];
    }else if(indexPath.section == 1){
        return [tableView fd_heightForCellWithIdentifier:two configuration:^(XPMediMClassTVCell *cell) {
            cell.label.text = self.data[selectBt][@"name"];
        }];
    }else{
        return [tableView fd_heightForCellWithIdentifier:three configuration:^(XPMediTClassTVCell *cell) {
            [cell.firstBt setTitle:self.data[selectBt][@"idList"][0][@"name"] forState:UIControlStateNormal];
            [cell.secondBt setTitle:self.data[selectBt][@"idList"][1][@"name"] forState:UIControlStateNormal];
            [cell.thirdBt setTitle:self.data[selectBt][@"idList"][2][@"name"] forState:UIControlStateNormal];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }];
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(void)cellClickIndex:(NSInteger)index{
    [self.navigationController pushViewController:[[XPMedClassVC alloc]initWithClassIndex:selectBt nindex:index data:self.data] animated:YES];
}
-(void)cellClick:(NSInteger)index{//更多详情
     [self.navigationController pushViewController:[[XPMedClassVC alloc]initWithClassIndex:selectBt nindex:index data:self.data] animated:YES];
}


- (NSArray *)data {
	if(_data == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"kk.medi" ofType:@"plist"];
        _data = [NSArray arrayWithContentsOfFile:path];
	}
	return _data;
}

@end
