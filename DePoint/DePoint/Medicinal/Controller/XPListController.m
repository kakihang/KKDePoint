//
//  XPListController.m
//  DePoint
//
//  Created by apple on 16/8/6.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "XPListController.h"
#import "XPListViewCell.h"
#import "XPDetailController.h"
@interface XPListController ()
@property(nonatomic) NSMutableArray<XPListDataModel *> *data;
@property(nonatomic)NSInteger page;

@end

@implementation XPListController
#pragma mark - LazyLoad  懒加载
- (NSMutableArray<XPListDataModel *> *)data {
    if(_data == nil) {
        _data = [[NSMutableArray<XPListDataModel *> alloc] init];
    }
    return _data;
}
-(instancetype)initWithDrug:(NSInteger)drug{
    if(self=[super init]){
        _drug = drug;
    }
    return self;
}
#pragma mark - LifeCycle 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.frame = CGRectMake(0, 94, self.tableView.width, self.tableView.height);
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    CGFloat width = (self.view.bounds.size.width / 2 - 140);
//    self.tableView.contentInset = UIEdgeInsetsMake(0, 0,width, 0);
    [self.tableView registerClass:[XPListViewCell class] forCellReuseIdentifier:@"Cell"];
    NSInteger path = 1;
    __weak typeof(self) weakSelf = self;
    [self.tableView addHeaderRefresh:^{
        [XPNetManager getList:weakSelf.drug more:path completionHandler:^(XPListModel *model, NSError *error) {
            [weakSelf.data removeAllObjects];
            [weakSelf.data addObjectsFromArray:model.tngou];
            [weakSelf.tableView endHeaderRefresh];
            [weakSelf.tableView reloadData];
        }];
    }];
    [self.tableView beginHeaderRefresh];
    self.page = path + 1;
    [self.tableView addFooterRefresh:^{
        [XPNetManager getList:weakSelf.drug more:weakSelf.page completionHandler:^(XPListModel *model, NSError *error) {
            weakSelf.page +=1;
            [weakSelf.data addObjectsFromArray:model.tngou];
            [weakSelf.tableView reloadData];
            [weakSelf.tableView endFooterRefresh];
        }];
    }];
    self.tableView.rowHeight = 130;
    
}



#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.data.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XPListViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    [cell.iconIV setImageWithURL:[NSString stringWithFormat:@"http://tnfs.tngou.net/image%@",self.data[indexPath.row].img].yx_URL placeholder:[UIImage imageNamed:@"背景"]];
    cell.titleLb.text = self.data[indexPath.row].desc;
    cell.nameLb.text = self.data[indexPath.row].name;
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    XPDetailController *vc = [[XPDetailController alloc]initWithDetai:self.data[indexPath.row].ID];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
