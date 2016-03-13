//
//  WYLTravelNoteView.m
//  EnjoyTrip
//
//  Created by 王亚龙 on 16/3/9.
//  Copyright © 2016年 YCD. All rights reserved.
//

#import "WYLTravelNoteView.h"

/**
 *  cell的Model
 */
#import "WYLIntroductModel.h"
#import "WYLAdsModel.h"

/**
 *  cell的View
 */
#import "WYLIntroductCell.h"
#import "WYLTopAdsView.h"

#define reuseName @"WYLTravelNoteCell"

@interface WYLTravelNoteView()<UITableViewDataSource,UITableViewDelegate>

{
    NSInteger _currentPage;
}

@property (nonatomic, strong) UITableView * tableView;

@property (nonatomic, strong) WYLTopAdsView * adsView;

@end

@implementation WYLTravelNoteView

- (instancetype)initWithFrame:(CGRect)frame {
    if ([super initWithFrame:frame]) {
        [self initData];
        [self addSubview:self.tableView];
    }
    return self;
}

- (void)initData {
    _currentPage = 1;
    self.dataSource = [[NSMutableArray alloc] init];
    self.adsDataSource = [[NSMutableArray alloc] init];
    
    [WYLIntroductModel httpRequestSource:URL_TravelNote(_currentPage) param:nil progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if (responseObject) {
            if (self.dataSource.count && self.dataSource) {
                [self.dataSource removeAllObjects];
            }
            self.dataSource = [WYLIntroductModel mj_objectArrayWithKeyValuesArray:responseObject];
            
            [self.tableView reloadData];
        }
        
    } failer:^(NSURLSessionDataTask *task, NSError *error) {
        DLog(error);
    }];
    
    [WYLAdsModel httpRequestSource:URL_Adverts param:nil progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if (responseObject) {
            if (self.adsDataSource.count && self.adsDataSource) {
                [self.adsDataSource removeAllObjects];
            }
            self.adsDataSource = [WYLAdsModel mj_objectArrayWithKeyValuesArray:responseObject];
            
            self.adsView.adsDataSource = self.adsDataSource;
        }
        
    } failer:^(NSURLSessionDataTask *task, NSError *error) {
        DLog(error);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WYLIntroductCell * cell = [tableView dequeueReusableCellWithIdentifier:reuseName];
    cell.model = self.dataSource[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.gotoDetilBlock) {
        self.gotoDetilBlock(self.dataSource[indexPath.row]);
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Size.width, SCREEN_Size.height - 64 - 49 - 20 - 28) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//        _tableView.backgroundColor = [UIColor greenColor];
        self.tableView.tableHeaderView = self.adsView;
//        DLog(NSStringFromCGRect(_tableView.frame));
        [_tableView registerClass:[WYLIntroductCell class] forCellReuseIdentifier:reuseName];
    }
    return _tableView;
}

- (WYLTopAdsView *)adsView {
    if (!_adsView) {
        _adsView = [WYLTopAdsView adsView];
    }
    return _adsView;
}

@end
