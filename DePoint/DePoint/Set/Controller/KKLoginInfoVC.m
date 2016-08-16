//
//  KKLoginInfoVC.m
//  DePoint
//
//  Created by kaki on 16/8/15.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKLoginInfoVC.h"
#import "KKLoginProc.h"
#import "UIImage+KKUserHeadImage.h"

@interface KKLoginInfoVC () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView; //
@end

@implementation KKLoginInfoVC {
    CGFloat _rowHeight;
    CGFloat _row;
    CGFloat _rightMargin;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavTitle:@"我的信息" tintColor:KKGLOTINTCOLOR backgroundColor:[UIColor clearColor]];
    [self setNavBottmLinehidden:YES];
    [self.view kk_viewWithVisualEffName:@"130313604324531250"];
    _rowHeight = KKScreenHeightPrecent(0.08);
    _row = 4;
    _rightMargin = KKScreenWidthPrecent(0.015);
    [self tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - tableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _row;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"kkcellid"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    NSInteger row = indexPath.row;
    if (row == 0) {
        [cell.textLabel setText:@"头像"];
        
        UIImageView *icon = [UIImageView kk_imageWithImage:[UIImage kk_getLoginUserIconWithFlag:[KKLoginProc kk_getCurrentUser]] mode:UIViewContentModeScaleAspectFit radius:(_rowHeight-10)/2];
        [cell.contentView addSubview:icon];
        [icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-_rightMargin);
            make.centerY.mas_equalTo(0);
            make.height.mas_equalTo(_rowHeight-10);
            make.width.mas_equalTo(icon.mas_height);
        }];
    } else if (row == 1) {
        [cell.textLabel setText:[KKLoginProc kk_getCurrentUser]];
    } else if (row == 2) {
        [cell.textLabel setText:@"修改账号密码"];
    } else {
        [cell.textLabel setText: [NSString stringWithFormat:@"已绑定手机号%@", [KKLoginProc kk_getCurrentPhone].kk_phoneEncrypt]];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - 懒加载
- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] init];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
        _tableView.rowHeight = _rowHeight;
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.mas_equalTo(0);
            make.height.mas_equalTo(KKScreenHeightPrecent(0.9));
        }];
        
        UIButton *logout = [UIButton kk_buttonWithTitle:@"退出登录"];
        [self.view addSubview:logout];
        [logout mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.mas_equalTo(0);
            make.height.mas_equalTo(_rowHeight);
        }];
        __weak typeof(self) weakSelf = self;
        [logout bk_addEventHandler:^(id sender) {
            [KKLoginProc kk_logout];
            [weakSelf.navigationController popViewControllerAnimated:YES];
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _tableView;
}

@end
