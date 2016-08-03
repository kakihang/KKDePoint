//
//  KKNearVCtrl.m
//  DePoint
//
//  Created by kaki on 16/7/22.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKNearVCtrl.h"
#import "KKLocationVModel.h"
#import "KKAnno.h"
#import "KKCenterAnno.h"
#import "KKNearbyTViewCell.h"
#import "KKColumnButtons.h"
#import <UITableView+FDTemplateLayoutCell.h>


static NSString *cellID = @"KKNearVCtrlCellId";

@interface KKNearVCtrl() <CLLocationManagerDelegate, MKMapViewDelegate, AMapSearchDelegate, UITableViewDataSource, UITableViewDelegate, KKColumnButtonDelegate>
@property (nonatomic, strong) KKMapView *mapView; // 地图View
@property (nonatomic, strong) KKLocationVModel *locationVM; // 定位模型
@property (nonatomic, strong) CLLocationManager *manager; // 地图管理者
@property (nonatomic, strong) NSMutableArray <KKAnno *> *dataList; // 附近单元数组
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) KKColumnButtons *store;
@property (nonatomic, strong) KKColumnButtons *range;
@end



@implementation KKNearVCtrl {
    BOOL _search;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s", __func__);
    
    self.tableView.rowHeight = 58; //后面会自动修改
    [self.tableView registerClass:[KKNearbyTViewCell class] forCellReuseIdentifier:cellID];
    [self.locationVM setSearchDelegate:self]; // 搜索代理
    [self.store kk_createColumns:@[@"药店药房", @"药店药房", @"医院"]]; // 药店药房、医院按钮组
    [self.range kk_createColumns:@[@"2000", @"500", @"1000", @"1500", @"2000", @"3000", @"5000", @"10000"]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (![self.navigationController.navigationController isNavigationBarHidden]) {
        self.navigationController.navigationBar.hidden = YES;
    }
    // 开始定位 和 地图
    _search = NO;
    [self.view addSubview:self.mapView];
    self.mapView.delegate = self;
    self.mapView.showsUserLocation = YES;
    self.manager.delegate = self;
    [self.manager stopUpdatingLocation];
    [self.manager startUpdatingLocation];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    // 停止定位 和 地图
    [self.manager stopUpdatingLocation];
    [self.mapView removeFromSuperview];
    self.manager.delegate = nil;
    self.mapView.showsUserLocation = NO;
    self.mapView.delegate = nil;
}


- (void)pointSearch:(CLLocationCoordinate2D)coordinate {
    [self.locationVM changeCenterAnno:coordinate];
    [self.locationVM startSearchWithCoordinate:coordinate];
}

- (void)removeAllAnnDatas {
    [self.mapView removeAnnotations:self.dataList];
    [self.dataList removeAllObjects];
    [self.tableView reloadData];
}


#pragma mark - KKColumnButtonDelegate
- (void)kk_touchColumn:(KKColumnButtons *)column button:(UIButton *)button title:(NSString *)title atIndex:(NSInteger)index {
    switch (column.columnMode) {
        case KKColunmModeStore: {
            [self removeAllAnnDatas];
            [self.locationVM setKeywords:title];
            break;
        }
        case KKColunmModeRange: {
            [self removeAllAnnDatas];
            [self.locationVM setRadius:title.integerValue];
            break;
        }
    }
}



#pragma mark - MKMapViewDelegate

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
    [self removeAllAnnDatas];
    if (_search) {
        [self pointSearch:mapView.region.center];
    }
    [self.store kk_setButtonArrHidden:YES];
    [self.range kk_setButtonArrHidden:YES];
}

// 商户大头针
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id)annotation {
    //    NSLog(@"%s", __func__);
    if ([annotation isKindOfClass:[KKAnno class]]) {
        static NSString *viewID = @"商户大头针";
        KKAnno *anno = (KKAnno *)annotation;
        MKAnnotationView *pin = [mapView dequeueReusableAnnotationViewWithIdentifier:viewID];
        if (pin == nil) {
            pin = [[MKAnnotationView alloc] initWithAnnotation:anno reuseIdentifier:viewID];
        }
        
        pin.annotation = anno;
        pin.canShowCallout = YES;
        pin.image = [UIImage imageNamed:@"sh"];
        return pin;
    } else if ([annotation isKindOfClass:[KKCenterAnno class]]) {
        KKCenterAnno *anno = (KKCenterAnno *)annotation;
        static NSString *viewID = @"中心点大头针";
        MKAnnotationView *pin = [mapView dequeueReusableAnnotationViewWithIdentifier:viewID];
        if (pin == nil) {
            pin = [[MKAnnotationView alloc] initWithAnnotation:anno reuseIdentifier:viewID];
        }
        
        pin.annotation = anno;
        pin.canShowCallout = NO;
        pin.image = [UIImage imageNamed:@"center"];
        return pin;
    }
    
    return nil;
}




#pragma mark - CLLocationManagerDelegate

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    NSLog(@"%s", __func__);
    if (!_search) {
        _search = YES;
        [self pointSearch:userLocation.coordinate];
        [UIView animateWithDuration:1 animations:^{
            [self.mapView setRegion:MKCoordinateRegionMake(userLocation.coordinate, KKREGIONSPAN)];
        }];
    }
}




#pragma mark - AMapSearchDelegate

//实现POI搜索对应的回调函数
- (void)onPOISearchDone:(AMapPOISearchBaseRequest *)request response:(AMapPOISearchResponse *)response {
    if(response.pois.count == 0) {
        return;
    }
    
    [self removeAllAnnDatas];
    for (AMapPOI *p in response.pois) {
        KKAnno *anno = [[KKAnno alloc] init];
        anno.coordinate = CLLocationCoordinate2DMake(p.location.latitude, p.location.longitude);
        anno.title = p.name;
        anno.subtitle = p.address;
        anno.distance = p.distance;
        [self.dataList addObject:anno];
    }
    
    [self.mapView addAnnotations:self.dataList];
    [self.tableView reloadData];
}



#pragma mark - tableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    KKNearbyTViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    
    cell.nameLb.text = self.dataList[indexPath.row].title;
    cell.addressLb.text = self.dataList[indexPath.row].subtitle;
    cell.distanceLb.text = [NSString stringWithFormat:@"%zd 米", self.dataList[indexPath.row].distance];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [tableView fd_heightForCellWithIdentifier:cellID configuration:^(KKNearbyTViewCell *cell) {
        cell.nameLb.text = self.dataList[indexPath.row].title;
        cell.addressLb.text = self.dataList[indexPath.row].subtitle;
        cell.distanceLb.text = [NSString stringWithFormat:@"%zd 米", self.dataList[indexPath.row].distance];
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.mapView setSelectedAnnotations:@[self.dataList[indexPath.row]]];
}



#pragma mark - 懒加载

- (KKLocationVModel *)locationVM {
    if(_locationVM == nil) {
        _locationVM = [[KKLocationVModel alloc] initWithMapView:self.mapView];
    }
    return _locationVM;
}

- (CLLocationManager *)manager {
    if(_manager == nil) {
        _manager = [CLLocationManager manager];
    }
    return _manager;
}

- (KKMapView *)mapView {
    if(_mapView == nil) {
        _mapView = [KKMapView mapViewWithFram:CGRectMake(0, 0, KKSCREENBOUNDSIZE.width, KKSCREENBOUNDSIZE.height * 0.6)];
        [self.view addSubview:_mapView];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_mapView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.bottom.mas_equalTo(-20);
            make.size.mas_equalTo(CGSizeMake(32, 32));
        }];
        [button setImage:[[UIImage imageNamed:@"location"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [button bk_addEventHandler:^(id sender) {
            if (_search) {
                _search = NO;
                [self mapView:self.mapView didUpdateUserLocation:self.mapView.userLocation];
            }
        } forControlEvents:UIControlEventTouchUpInside];
        
        UITapGestureRecognizer *gr = [[UITapGestureRecognizer alloc] bk_initWithHandler:^(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location) {
            [self.store kk_setButtonArrHidden:YES];
            [self.range kk_setButtonArrHidden:YES];
        }];
        [_mapView addGestureRecognizer:gr];
    }
    return _mapView;
}


- (NSMutableArray *)dataList {
    if(_dataList == nil) {
        _dataList = [[NSMutableArray alloc] init];
    }
    return _dataList;
}

- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] init];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.contentInset = UIEdgeInsetsMake(-20, 0, 0, 0);
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.top.mas_equalTo(self.mapView.bottom);
        }];
    }
    return _tableView;
}

- (KKColumnButtons *)store {
    if(_store == nil) {
        _store = [[KKColumnButtons alloc] initWithMode:KKColunmModeStore direction:KKColunmDirectionTop];
        [self.mapView addSubview:_store];
        [_store mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.top.mas_equalTo(self.range);
            make.right.mas_equalTo(self.range.mas_left).mas_equalTo(-20);
            make.size.mas_equalTo(self.range);
        }];
        _store.kk_columnButtonDeledate = self;
    }
    return _store;
}

- (KKColumnButtons *)range {
    if(_range == nil) {
        _range = [[KKColumnButtons alloc] initWithMode:KKColunmModeRange direction:KKColunmDirectionTop];
        [self.mapView addSubview:_range];
        [_range mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(-25);
            make.right.mas_equalTo(-25);
            make.size.mas_equalTo(CGSizeMake(90, 20));
        }];
        _range.kk_columnButtonDeledate = self;
    }
    return _range;
}

@end
