//
//  KKLocationVModel.m
//  DePoint
//
//  Created by kaki on 16/7/27.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKLocationVModel.h"
#import "KKMapView.h"


@interface KKLocationVModel() {
    KKCenterAnno *_centerAnno;
}
// 高德搜索对象
@property (nonatomic, strong) AMapSearchAPI *search;
// 周边参数对象
@property (nonatomic, strong) AMapPOIAroundSearchRequest *request;
// 地图
@property (nonatomic, strong) KKMapView *mapView;
@end


@implementation KKLocationVModel

- (instancetype)initWithMapView:(KKMapView *)mapView {
    if (self = [super init]) {
        _mapView = mapView;
        [self.mapView addAnnotation:self.centerAnno];
    }
    return self;
}


- (void)setCoordinate:(CLLocationCoordinate2D)coordinnate {
    _coordinate = coordinnate;
    self.request.location = [AMapGeoPoint locationWithLatitude:coordinnate.latitude
                                                     longitude:coordinnate.longitude];
}

- (void)setSearchDelegate:(id)vc {
    self.search.delegate = vc;
}

- (void)startSearch {
    [self.search AMapPOIAroundSearch:self.request];
}

- (void)startSearchWithCoordinate:(CLLocationCoordinate2D)coordinnate {
    [self setCoordinate:coordinnate];
    [self startSearch];
}



#pragma mark - 大头针

- (void)changeCenterAnno:(CLLocationCoordinate2D)coordinate {
    [self changeAnno:self.centerAnno coordinate:coordinate];
}

- (void)changeAnno:(KKCenterAnno *)anno coordinate:(CLLocationCoordinate2D)coordinate {
    [UIView animateWithDuration:0.1 animations:^{
        anno.coordinate = coordinate;
    }];
}




#pragma mark - 懒加载

- (AMapPOIAroundSearchRequest *)request {
    if(_request == nil) {
        _request = [AMapPOIAroundSearchRequest searchRequest];
    }
    return _request;
}

- (AMapSearchAPI *)search {
    if(_search == nil) {
        _search = [[AMapSearchAPI alloc] init];
    }
    return _search;
}

- (KKCenterAnno *)centerAnno {
    if(_centerAnno == nil) {
        _centerAnno = [[KKCenterAnno alloc] init];
    }
    return _centerAnno;
}

@end
