//
//  XPDrugController.m
//  DePoint
//
//  Created by apple on 16/8/6.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "XPDrugController.h"
#import "XPNexineController.h"
@interface XPDrugController ()
@property(nonatomic) NSArray<XPDrugsDataModel*> *durg;

@end

@implementation XPDrugController
#pragma mark - LifeCycle 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor whiteColor];
    [XPNetManager getDrugscompletionHandler:^(XPDrugsModel *model, NSError *error) {
        self.durg = model.tngou;
        [self.tableView reloadData];
    }];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}


#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.durg.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = self.durg[indexPath.row].name;
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    XPNexineController *vc =[[XPNexineController alloc]initWithID:self.durg[indexPath.row].ID];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - LazyLoad  懒加载

- (NSArray<XPDrugsDataModel*> *)durg {
	if(_durg == nil) {
		_durg = [[NSArray<XPDrugsDataModel*> alloc] init];
	}
	return _durg;
}

@end
