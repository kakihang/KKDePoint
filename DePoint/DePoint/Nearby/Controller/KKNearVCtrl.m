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


@interface KKNearVCtrl() <CLLocationManagerDelegate, MKMapViewDelegate, AMapSearchDelegate>
// 地图View
@property (nonatomic, strong) KKMapView *mapView;
// 定位模型
@property (nonatomic, strong) KKLocationVModel *locationVM;
// 地图管理者
@property (nonatomic, strong) CLLocationManager *manager;
// 附近单元数组
@property (nonatomic, strong) NSMutableArray <KKAnno *> *dataList;
@end



@implementation KKNearVCtrl {
    BOOL _search;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s", __func__);
    
    // 搜索代理
    [self.locationVM setSearchDelegate:self];
    // 按钮组
    
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





#pragma mark - MKMapViewDelegate

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
    NSLog(@"%s", __func__);
    if (_search) {
        CLLocationCoordinate2D coordinate = mapView.region.center;
        [self pointSearch:coordinate];
    }
}

// 商户大头针
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id)annotation {
    NSLog(@"%s", __func__);
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
        NSLog(@"[annotation isKindOfClass:[KKCenterAnno class]]");
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
    
    if (self.dataList.count > 0) {
        [self.mapView removeAnnotations:self.dataList];
        [self.dataList removeAllObjects];
    }
    for (AMapPOI *p in response.pois) {
        NSLog(@"%@",[NSString stringWithFormat:@"%@\nPOI: %@,%@ [%zd]", p.description,p.name,p.address,p.distance]);
        KKAnno *anno = [[KKAnno alloc] init];
        anno.coordinate = CLLocationCoordinate2DMake(p.location.latitude, p.location.longitude);
        anno.title = p.name;
        anno.subtitle = p.address;
        anno.distance = p.distance;
        [self.dataList addObject:anno];
    }
    
    [self.mapView addAnnotations:self.dataList];
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
        _mapView = [KKMapView mapViewWithFram:CGRectMake(0, 0, KKSCREENBOUNDSIZE.width, KKSCREENBOUNDSIZE.height * 0.7)];
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
    }
    return _mapView;
}

- (NSMutableArray *)dataList {
    if(_dataList == nil) {
        _dataList = [[NSMutableArray alloc] init];
    }
    return _dataList;
}

@end
