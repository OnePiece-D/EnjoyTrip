//
//  WYLSpecialView.m
//  EnjoyTrip
//
//  Created by 王亚龙 on 16/3/9.
//  Copyright © 2016年 YCD. All rights reserved.
//

#import "WYLSpecialView.h"

/**
 *  cell的Model
 */
#import "WYLSpecialModel.h"

/**
 *  cell的View
 */
#import "WYLSpecialCell.h"


#define reuseName @"WYLSpecialCell"


@interface WYLSpecialView()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView * tableView;


@end

@implementation WYLSpecialView

- (instancetype)initWithFrame:(CGRect)frame {
    if ([super initWithFrame:frame]) {
        
        [self initSourceData];
        [self addSubview:self.tableView];
        
    }
    return self;
}

- (void)initSourceData {
    self.dataSource = [[NSMutableArray alloc] init];
    [WYLSpecialModel httpRequestSource:URL_Special(1) param:nil progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        if (responseObject) {
            
            if (self.dataSource.count && self.dataSource) {
                [self.dataSource removeAllObjects];
            }
            self.dataSource = [WYLSpecialModel mj_objectArrayWithKeyValuesArray:responseObject];
            [self.tableView reloadData];
        }
    } failer:^(NSURLSessionDataTask *task, NSError *error) {
        DLog(error);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WYLSpecialCell * cell = [tableView dequeueReusableCellWithIdentifier:reuseName];
    
    cell.model = self.dataSource[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.gotoDetilBlock) {
        self.gotoDetilBlock(self.dataSource[indexPath.row]);
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 220;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Size.width, SCREEN_Size.height - 64 - 49 - 20 - 28) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor greenColor];
        //        NSLog(@"tableViewFrame:%@",NSStringFromCGRect(_tableView.frame));
        [_tableView registerClass:[WYLSpecialCell class] forCellReuseIdentifier:reuseName];
    }
    return _tableView;
}


@end
