//
//  WYLHomeViewController.m
//  EnjoyTrip
//
//  Created by 王亚龙 on 16/3/8.
//  Copyright © 2016年 YCD. All rights reserved.
//

#import "WYLHomeViewController.h"

#import "WYLDetailController.h"

/**
 *  管理View
 */
#import "NextPageScrollView.h"

/**
 *  内容View
 */
#import "WYLTravelNoteView.h"
#import "WYLSpecialView.h"

#import "WYLIntroductModel.h"
#import "WYLSpecialModel.h"

#define weakSelf type

@interface WYLHomeViewController ()

@property (nonatomic, strong) NextPageScrollView * manageScrollView;

@property (nonatomic, strong) WYLTravelNoteView * travelNoteView;
@property (nonatomic, strong) WYLSpecialView * specialView;

@end

@implementation WYLHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"首页";
    self.navigationItem.title = @"首页";
    
    [self currentViewShow];
}

- (void)initData {
    
}

- (void)currentViewShow {
//    self.manageScrollView.backgroundColor = [UIColor orangeColor];
    
//    self.travelNoteView.backgroundColor = [UIColor redColor];
//    self.specialView.backgroundColor = [UIColor greenColor];
    
    [self.manageScrollView setTopButtonTitles:@[
                                                @"游记",
                                                @"专题"
                                                ]];
    [self.manageScrollView setContentPages:@[
                                             self.travelNoteView,
                                             self.specialView
                                             ]];
    [self.manageScrollView setBackButtonHidden:YES nextButtonHidden:YES];
    
}

- (void)setNaviShow {
    
}

- (void)clickCellToDetailPage:(id)model {
//    DLog(model);
    WYLDetailController * detailVC = [[WYLDetailController alloc] init];
    detailVC.idCode = [model id];
    [self.navigationController pushViewController:detailVC animated:YES];
}

#pragma mark -lazing-

- (NextPageScrollView *)manageScrollView {
    if (!_manageScrollView) {
        _manageScrollView = [[NextPageScrollView alloc] init];
        [self.view addSubview:_manageScrollView];
        __weak typeof(self) weakSelf = self;
        [self.manageScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.bottom.equalTo(weakSelf.view).offset(0);
        }];
    }
    return _manageScrollView;
}

- (WYLTravelNoteView *)travelNoteView {
    if (!_travelNoteView) {
        _travelNoteView = [[WYLTravelNoteView alloc] init];
        __weak typeof(self) weakSelf = self;
        _travelNoteView.gotoDetilBlock = ^(id model) {
            [weakSelf clickCellToDetailPage:model];
        };
    }
    return _travelNoteView;
}

- (WYLSpecialView *)specialView {
    if (!_specialView) {
        _specialView = [[WYLSpecialView alloc] init];
        
        __weak typeof(self) weakSelf = self;
        _specialView.gotoDetilBlock = ^(id model) {
            [weakSelf clickCellToDetailPage:model];
        };
    }
    return _specialView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
