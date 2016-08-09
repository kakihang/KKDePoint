//
//  XPNexineController.m
//  DePoint
//
//  Created by apple on 16/8/6.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "XPNexineController.h"
#import "XPListController.h"
@interface XPNexineController ()
@property(nonatomic) NSArray<XPDrugNexineDataModel *> *data;
@end

@implementation XPNexineController
#pragma mark - LazyLoad  懒加载
- (NSArray<XPDrugNexineDataModel *> *)data {
    if(_data == nil) {
        _data = [[NSArray<XPDrugNexineDataModel *> alloc] init];
    }
    return _data;
}
-(instancetype)initWithID:(NSInteger)ID{
    if(self =[super init]){
        _ID= ID;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]bk_initWithTitle:@"返回" style:UIBarButtonItemStyleDone handler:^(id sender) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    self.navigationItem.leftBarButtonItem = leftItem;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [XPNetManager getNexine:_ID completionHandler:^(XPDrugNexineModel *model, NSError *error) {
        self.data = model.tngou;
        [self.tableView reloadData];
    }];
}


#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.data.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = self.data[indexPath.row].name;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    XPListController *vc = [[XPListController alloc]initWithDrug:self.data[indexPath.row].ID];
    [self.sideMenuViewController hideMenuViewController];
    [[self.navigationController popViewControllerAnimated:YES].sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:vc] animated:NO];
//    [self.navigationController pushViewController:vc animated:YES];
}

@end
