//
//  KKMedClassVC.m
//  DePoint
//
//  Created by kaki on 16/8/9.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKMedClassVC.h"

#import "KKMenuBarButton.h"

@interface KKMedClassVC ()
@property (nonatomic, assign) NSInteger cIndex; //
@property (nonatomic, assign) NSInteger nIndex; //
@property (nonatomic, strong) NSArray *plistData;
@end

@implementation KKMedClassVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (instancetype)initWithClassIndex:(NSInteger)cindex
                            nindex:(NSInteger)nindex
                              data:(NSArray *)plistData {
    if (self = [super init]) {
        self.cIndex = cindex;
        self.nIndex = nindex;
        self.plistData = plistData;
        [KKMenuBarButton buttonWithArray:plistData];
        NSLog(@"%zd %zd", cindex, nindex);
    }
    return self;
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
