//
//  KKSetVCtrl.m
//  DePoint
//
//  Created by kaki on 16/7/22.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKSetVCtrl.h"
#import "KKSetViewModel.h"
#import "KKSetTViewCell.h"
#import "KKLoginViewC.h"

#import "KKAboutViewC.h"

@interface KKSetVCtrl() <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) KKSetViewModel *setViewModel;
@property (nonatomic, strong) UIButton *loginBt; // 登录按钮
@property (nonatomic, strong) UITableView *tableView;  // tableView
@end


@implementation KKSetVCtrl
- (void)viewDidLoad {
    [super viewDidLoad];
    [self hideNavBar:YES]; //隐藏导航栏
    
    [self loginBt];
    self.tableView.contentInset = UIEdgeInsetsMake(-15, 0, 0, 0);
    self.tableView.sectionFooterHeight = 15;
    self.tableView.sectionHeaderHeight = 0;
    
    NSLog(@"%@", KKCACHEPATH);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}


#pragma mark - tableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.setViewModel getSectionNum];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.setViewModel getRowBySection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"KKSetVCtrlCellId";
    KKSetTViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [KKSetTViewCell cellWithIdentifier:cellId];
    }
    
    cell.iconView.image = [self.setViewModel getIconByIndexPath:indexPath];
    cell.titleLa.text = [self.setViewModel getTitleByIndexPath:indexPath];
    cell.assistLa.text = [self.setViewModel getAssistByIndexPath:indexPath];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {    
    block run = [self.setViewModel getBlock:indexPath];
    !run?:run(self);
    
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}



#pragma mark - 懒加载

- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.loginBt.mas_bottom);
            make.left.right.bottom.mas_equalTo(0);
        }];
    }
    return _tableView;
}

- (UIButton *)loginBt {
    if(_loginBt == nil) {
        // 头部登录按钮
        _loginBt = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, KKSCREENBOUNDSIZE.width, KKSCREENBOUNDSIZE.height * 0.3)];
        [self.view addSubview:_loginBt];
        _loginBt.backgroundColor = [UIColor lightGrayColor];
        [_loginBt bk_addEventHandler:^(id sender) {
            NSLog(@"登录");
            //            [self.navigationController pushViewController:[[KKLoginViewC alloc] init] animated:YES];
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginBt;
}

- (KKSetViewModel *)setViewModel {
    if(_setViewModel == nil) {
        _setViewModel = [[KKSetViewModel alloc] init];
    }
    return _setViewModel;
}

@end
