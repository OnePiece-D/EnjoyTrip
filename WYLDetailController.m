//
//  WYLDetailController.m
//  EnjoyTrip
//
//  Created by 王亚龙 on 16/3/11.
//  Copyright © 2016年 YCD. All rights reserved.
//

#import "WYLDetailController.h"

#define reuseName @"WYLDetailCell"

@interface WYLDetailController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView * tableView;

@property (nonatomic, strong) NSMutableArray * dataSource;

@end

@implementation WYLDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.title = @"";
    [self initData];
    [self createUI];
}

- (void)initData {
    self.dataSource = [[NSMutableArray alloc] init];
    
    if (self.idCode) {
        [self requestData:URL_DetailTrips(self.idCode)];
    }
}

- (void)createUI {
    [self.view addSubview:self.tableView];
    
}

- (void)requestData:(NSString *)url {
    DLog(@"url:%@",url);
    [WYLDataRequestModel httpRequestSource:url param:nil progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        
    } failer:^(NSURLSessionDataTask *task, NSError *error) {
        DLog(@"%@",error);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:reuseName];
    
    return cell;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Size.width, SCREEN_Size.height - 20)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        [_tableView registerClass:NSClassFromString(@"UITableViewCell") forCellReuseIdentifier:reuseName];
    }
    return _tableView;
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
