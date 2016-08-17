//
//  XPMedClassVC.m
//  DePoint
//
//  Created by apple on 16/8/13.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "XPMedClassVC.h"
#import "XPListController.h"
#import "XPSearchController.h"
@interface XPMedClassVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic) NSInteger cIndex;
@property (nonatomic) NSInteger nIndex;
@property (nonatomic) NSArray *plistData;
@property (nonatomic) UITableView *leftView;
@property (nonatomic) UITableView *rightView;
@property (nonatomic) UIView *bgView;
@property (nonatomic) UIButton *leftBt;
@property (nonatomic) UIButton *rightBt;
@property (nonatomic) UIView *bottomView;
@end

@implementation XPMedClassVC{
    BOOL _menuHiddex;
    CGFloat _height;
    CGFloat _maxHeight;
    CGFloat _trueHeight;
}
static NSString *leftCell = @"leftCell";
static NSString *rightCell = @"rightCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [XPFactory addSearchItemForVC:self clickedHandler:^{
        XPSearchController *vc =[[XPSearchController alloc]init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }];
    _menuHiddex = YES;
    _height = 30;
    _maxHeight = 300;
    _trueHeight = _height * self.plistData.count;
    if(_trueHeight > _maxHeight){
        _trueHeight = _maxHeight;
    }
    self.view.backgroundColor = KKGLOBAL;
    [self leftBt];
    [self rightBt];
    [self.leftView registerClass:[UITableViewCell class] forCellReuseIdentifier:leftCell];
    [self.rightView registerClass:[UITableViewCell class] forCellReuseIdentifier:rightCell];
    [self.leftView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
    [self setMainButtonTitle];
}
-(instancetype)initWithClassIndex:(NSInteger)cindex nindex:(NSInteger)nindex data:(NSArray *)plistData{
    if(self = [super init]){
        self.cIndex = cindex;
        self.nIndex = nindex;
        self.plistData = plistData;
    }
    return self;
}
-(void)setMainButtonTitle{
    [self.leftBt setTitle:self.plistData[_cIndex][@"name"] forState:UIControlStateNormal];
    [self.rightBt setTitle:self.plistData[_cIndex][@"idList"][_nIndex][@"name"] forState:UIControlStateNormal];
}
-(void)clickMainButton{
    [self.bgView.superview layoutIfNeeded];
    self.bottomView.alpha = 0.2;
    self.leftBt.enabled = NO;
    self.rightBt.enabled = NO;
    [UIView animateWithDuration:0.5 animations:^{
        if (self.bgView.height == 0) {
            [self.bgView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self.leftBt.mas_bottom);
                make.left.right.bottom.mas_equalTo(0);
                [UIView animateWithDuration:0.5 animations:^{
                    self.bottomView.alpha =0.8;
                }];
            }];
        } else {
            [self.bgView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.right.mas_equalTo(0);
                make.top.mas_equalTo(self.leftBt.mas_bottom);
                make.height.mas_equalTo(0);
            }];
        }
        [self.bgView.superview layoutIfNeeded];//强制绘制
    } completion:^(BOOL finished) {
        self.leftBt.enabled = YES;
        self.rightBt.enabled = YES;
    }];
  
}
#pragma make - 
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(tableView ==self.leftView){
        return _plistData.count;
    }else{
        return ((NSArray *)_plistData[_cIndex][@"idList"]).count;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(tableView ==self.leftView){
        UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:leftCell forIndexPath:indexPath];
        cell.textLabel.text = _plistData[indexPath.row][@"name"];
        cell.textLabel.font = [UIFont systemFontOfSize:18];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:rightCell forIndexPath:indexPath];
        cell.textLabel.text = _plistData[_cIndex][@"idList"][indexPath.row][@"name"];
        cell.textLabel.font = [UIFont systemFontOfSize:18];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = KKCOLOR(217, 217, 217, 1);
        return cell;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(tableView ==self.leftView){
        _cIndex = indexPath.row;
        [self.rightView reloadData];
    }else{
        _nIndex = indexPath.row;
        [self clickMainButton];
        [self setMainButtonTitle];
        XPListController *vc =[[XPListController alloc]initWithDrug:[_plistData[_cIndex][@"idList"][indexPath.row][@"id"]integerValue]];
        [self.navigationController pushViewController:vc animated:YES];
    }
}
#pragma mark - LazyLoad  懒加载
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
- (UITableView *)leftView {
    if(_leftView == nil) {
        _leftView = [[UITableView alloc] init];
        _leftView.dataSource = self;
        _leftView.delegate = self;
        [self.bgView addSubview:_leftView];
        [_leftView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(0);
            make.bottom.mas_equalTo(self.bottomView.mas_top);
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
            make.height.mas_equalTo(self.leftView);
        }];
        
        
    }
    return _rightView;
}
- (UIView *)bgView {
    if(_bgView == nil) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = [UIColor colorWithWhite:0.4 alpha:0.8];
        [self.view addSubview:_bgView];
        [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.leftBt.mas_bottom);
            make.left.right.bottom.mas_equalTo(0);
        }];
        UIView *bottomView = [[UIView alloc] init];
        bottomView.backgroundColor = [UIColor redColor];
        [_bgView addSubview:bottomView];
        [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.height.mas_equalTo(_bgView).multipliedBy(0.4);
        }];
        bottomView.userInteractionEnabled = YES;
        [bottomView bk_whenTapped:^{
            [self clickMainButton];
        }];
        
        UISwipeGestureRecognizer *gr = [[UISwipeGestureRecognizer alloc] bk_initWithHandler:^(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location) {
            bottomView.userInteractionEnabled = NO;
            [self clickMainButton];
            bottomView.userInteractionEnabled = YES;
        }];
        [bottomView addGestureRecognizer:gr];
        gr.direction = UISwipeGestureRecognizerDirectionUp;
        self.bottomView = bottomView;
    }
    return _bgView;
}- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
