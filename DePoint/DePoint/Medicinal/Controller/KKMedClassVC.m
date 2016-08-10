//
//  KKMedClassVC.m
//  DePoint
//
//  Created by kaki on 16/8/9.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKMedClassVC.h"


@interface KKMedClassVC () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, assign) NSInteger cIndex; //
@property (nonatomic, assign) NSInteger nIndex; //
@property (nonatomic, strong) NSArray *plistData;

@property (nonatomic, strong) UITableView *leftView; //
@property (nonatomic, strong) UITableView *rightView; //

@property (nonatomic, strong) UIView *bgView; //
@property (nonatomic, strong) UIButton *leftBt; //
@property (nonatomic, strong) UIButton *rightBt; //
@end

@implementation KKMedClassVC {
    BOOL _menuHidden;
    CGFloat _height;
    CGFloat _maxHeight;
    CGFloat _trueHeight;
}
static NSString *leftCellId_ = @"leftCellId";
static NSString *rightCellId_ = @"rightCellId";



- (void)viewDidLoad {
    [super viewDidLoad];
    _menuHidden = YES;
    _height = 30;
    _maxHeight = 300;
    _trueHeight = _height * self.plistData.count;
    if (_trueHeight > _maxHeight) {
        _trueHeight = _maxHeight;
    }
    
    self.view.backgroundColor = KKGLOBAL;
    [self leftBt];
    [self rightBt];
    [self.leftView registerClass:[UITableViewCell class] forCellReuseIdentifier:leftCellId_];
    [self.rightView registerClass:[UITableViewCell class] forCellReuseIdentifier:rightCellId_];
    
    [self.leftView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
    [self setMainButtonTitle];
}

- (instancetype)initWithClassIndex:(NSInteger)cindex
                            nindex:(NSInteger)nindex
                              data:(NSArray *)plistData {
    if (self = [super init]) {
        self.cIndex = cindex;
        self.nIndex = nindex;
        self.plistData = plistData;
        NSLog(@"%zd %zd", cindex, nindex);
    }
    return self;
}

- (void)setMainButtonTitle {
    [self.leftBt setTitle:self.plistData[_cIndex][@"name"] forState:UIControlStateNormal];
    [self.rightBt setTitle:self.plistData[_cIndex][@"idList"][_nIndex][@"name"] forState:UIControlStateNormal];
}


- (void)clickMainButton {
    //    if (_menuHidden == self.bgView.hidden) {
    //        return;
    //    }
    self.leftBt.enabled = NO;
    self.rightBt.enabled = NO;
    _menuHidden = !_menuHidden;
    self.bgView.hidden = _menuHidden;
    self.leftBt.enabled = YES;
    self.rightBt.enabled = YES;
}

#pragma mark - 

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.leftView) {
        return _plistData.count;
    } else {
        return ((NSArray *)_plistData[_cIndex][@"idList"]).count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.leftView) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:leftCellId_ forIndexPath:indexPath];
        cell.textLabel.text = _plistData[indexPath.row][@"name"];
        return cell;
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:rightCellId_ forIndexPath:indexPath];
        cell.textLabel.text = _plistData[_cIndex][@"idList"][indexPath.row][@"name"];
        cell.backgroundColor = KKCOLOR(217, 217, 217, 1);
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.leftView) {
        _cIndex = indexPath.row;
        [self.rightView reloadData];
    } else {
        _nIndex = indexPath.row;
        [self clickMainButton];
        [self setMainButtonTitle];
        NSLog(@"隐藏 刷新view");
    }
}



#pragma mark -

- (UIButton *)leftBt {
    if(_leftBt == nil) {
        _leftBt = [[UIButton alloc] init];
        [_leftBt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_leftBt addTarget:self action:@selector(clickMainButton) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_leftBt];
        [_leftBt mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(64);
            make.height.mas_equalTo(_height);
        }];
    }
    return _leftBt;
}

- (UIButton *)rightBt {
    if(_rightBt == nil) {
        _rightBt = [[UIButton alloc] init];
        [_rightBt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_rightBt addTarget:self action:@selector(clickMainButton) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_rightBt];
        [_rightBt mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(0);
            make.top.mas_equalTo(self.leftBt);
            make.height.mas_equalTo(self.leftBt);
            make.left.mas_equalTo(self.leftBt.mas_right);
            make.width.mas_equalTo(self.leftBt.mas_width);
        }];
    }
    return _rightBt;
}

- (UIView *)bgView {
    if(_bgView == nil) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = [UIColor colorWithWhite:0.4 alpha:0.8];
        _bgView.hidden = _menuHidden;
        [self.view addSubview:_bgView];
        [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.leftBt.mas_bottom);
            make.left.right.bottom.mas_equalTo(0);
        }];
        
        UIView *bottomView = [[UIView alloc] init];
        //        bottomView.backgroundColor = [UIColor clearColor];
        bottomView.backgroundColor = [UIColor redColor];
        [_bgView addSubview:bottomView];
        [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.top.mas_equalTo(_trueHeight);
        }];
        bottomView.userInteractionEnabled = YES;
        
        [bottomView bk_whenTapped:^{
            [self clickMainButton];
        }];
        
        UISwipeGestureRecognizer *gr = [[UISwipeGestureRecognizer alloc] bk_initWithHandler:^(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location) {
            NSLog(@"%s", __func__);
            bottomView.userInteractionEnabled = NO;
            [self clickMainButton];
            bottomView.userInteractionEnabled = YES;
        }];
        [bottomView addGestureRecognizer:gr];
        gr.direction = UISwipeGestureRecognizerDirectionUp;
    }
    return _bgView;
}

- (UITableView *)leftView {
    if(_leftView == nil) {
        _leftView = [[UITableView alloc] init];
        _leftView.dataSource = self;
        _leftView.delegate = self;
        [self.bgView addSubview:_leftView];
        [_leftView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(0);
            make.height.mas_equalTo(_trueHeight);
        }];
    }
    return _leftView;
}

- (UITableView *)rightView {
    if(_rightView == nil) {
        _rightView = [[UITableView alloc] init];
        _rightView.dataSource = self;
        _rightView.delegate = self;
        _rightView.backgroundColor = KKCOLOR(217, 217, 217, 1);
        [self.bgView addSubview:_rightView];
        [_rightView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.top.mas_equalTo(0);
            make.left.mas_equalTo(self.leftView.mas_right);
            make.width.mas_equalTo(self.leftView);
            make.height.mas_equalTo(_trueHeight);
        }];
    }
    return _rightView;
}

@end
