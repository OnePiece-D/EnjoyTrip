//
//  WYLDetailController.m
//  EnjoyTrip
//
//  Created by 王亚龙 on 16/3/11.
//  Copyright © 2016年 YCD. All rights reserved.
//

#import "WYLDetailController.h"

#import "WYLDetailHeaderView.h"
#import "WYLDateHeaderView.h"

#import "WYLDetailAllDescModel.h"
#import "WYLDetailCell.h"

#define reuseName(_type) [NSString stringWithFormat:@"WYLDetailCell%@",_type]

@interface WYLDetailController ()<UITableViewDataSource,UITableViewDelegate>

{
    NSInteger _isState;
}

@property (nonatomic, strong) UITableView * tableView;

@property (nonatomic, strong) WYLDetailHeaderView * topHeaderView;

@property (nonatomic, strong) WYLDetailAllDescModel * deailAllSource;

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
    _isState = 0;
    
    if (self.idCode) {
        [self requestData:URL_DetailTrips(self.idCode)];
    }
}

- (void)createUI {
    [self.view addSubview:self.tableView];
    
}

- (void)requestData:(NSString *)url {
    NSLog(@"url:%@",url);
    [WYLDataRequestModel httpRequestSource:url param:nil progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSError * jsonError = nil;
        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&jsonError];
        if (!jsonError) {
            
            WYLDetailAllDescModel * model = [WYLDetailAllDescModel mj_objectWithKeyValues:dic];
            self.deailAllSource = model;
            //topHeader
            [self.topHeaderView.bigBackImage sd_setImageWithURL:[NSURL URLWithString:self.deailAllSource.front_cover_photo_url] placeholderImage:[UIImage imageNamed:@"kong"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                
            }];
            NSString * dateStr = [NSString stringWithFormat:@"%@/%ld天/%@图",[WYLTool dateFormatHandleWith:model.start_date],[model.trip_days count],model.photos_count];
            [(WYLTitleAndDescView *)self.topHeaderView.descView setTitle:model.name desc:dateStr userHeaderImage:model.user.image];
            [self.tableView reloadData];
            
        }else {
            NSLog(@"jsonError:%@",jsonError);
        }
        
        
    } failer:^(NSURLSessionDataTask *task, NSError *error) {
        DLog(@"%@",error);
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[(WYLDetailAllDescModel *)self.deailAllSource trip_days] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray * array = [(WYLDetailAllDescModel *)self.deailAllSource trip_days];
    WYLTripDayModel * model = (WYLTripDayModel *)array[section];
    NSInteger allcount = 0;
    NSArray * nodesArray = model.nodes;
    for (WYLDetailNodesModel * nodesModel in nodesArray) {
        allcount += nodesModel.notes.count;
    }
    return allcount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WYLDetailDaysNodesNotesModel * model = [self getDetailDayWithRow:indexPath];
    WYLDetailCell * cell = nil;
    //暂时还没有加入视频的逻辑
    //0:tip 1:photo 2:tipAndPhoto
    cell = [WYLFactory factoryDetailCellTableView:tableView reusename:[self getReusename:model] model:model selected:[self getSelectedType:model]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    WYLDetailDaysNodesNotesModel * model = [self getDetailDayWithRow:indexPath];
    WYLDetailCell * playCell = [tableView cellForRowAtIndexPath:indexPath];
    playCell.model = model;
}


- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NSArray * array = [(WYLDetailAllDescModel *)self.deailAllSource trip_days];
    WYLTripDayModel * model = (WYLTripDayModel *)array[section];
    
    WYLDateHeaderView * view = [WYLDateHeaderView dateHeaderViewWithHeight:kUserHeadImageWidth];
    
    [view setDayCOunt:model.day detail:model.trip_date];
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section {
    return kUserHeadImageWidth;
}

- (NSInteger)getSelectedType:(WYLDetailDaysNodesNotesModel *)model {
    if (model.photo && model.desc) {
        return 2;
    }else if (model.photo && !model.desc) {
        return 1;
    }else if (!model.photo && model.desc) {
        return 0;
    }
    return -1;
}

- (NSString *)getReusename:(WYLDetailDaysNodesNotesModel *)model {
    NSString * thisReusename = nil;
    if (model.photo && model.desc) {
        thisReusename = reuseName(@2);
    }else if (model.photo && !model.desc) {
        reuseName(@1);
    }else if (!model.photo && model.desc) {
        reuseName(@0);
    }
    return thisReusename;
}

- (WYLDetailDaysNodesNotesModel *)getDetailDayWithRow:(NSIndexPath *)indexPath {
    NSArray * dayDetailArray = [(WYLDetailAllDescModel *)self.deailAllSource trip_days];
    NSArray * nodesArray =  [(WYLTripDayModel *)dayDetailArray[indexPath.section] nodes];
    NSInteger allcount = 0;
    for (WYLDetailNodesModel * nodesModel in nodesArray) {
        for (WYLDetailDaysNodesNotesModel * model in nodesModel.notes) {
            if (indexPath.row == allcount) {
                return model;
            }
            allcount += 1;
        }
    }
    return nil;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint point = scrollView.contentOffset;
//    NSLog(@"point:%@-->%f",NSStringFromCGPoint(point),CGRectGetHeight(self.topHeaderView.frame) - 64);
    
    if (point.y >= CGRectGetHeight(self.topHeaderView.frame) - 64 && _isState == 0) {
        _isState = 1;
        self.navigationController.navigationBar.translucent = NO;
        scrollView.contentOffset = CGPointMake(0, point.y + 64);
    }
    if (point.y < CGRectGetHeight(self.topHeaderView.frame) - 64 && _isState == 1 && point.y >0) {
        _isState = 0;
        self.navigationController.navigationBar.translucent = YES;
        scrollView.contentOffset = CGPointMake(0, point.y - 64);
    }
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Size.width, SCREEN_Size.height) style:UITableViewStylePlain];
        _tableView.tableHeaderView = self.topHeaderView;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (WYLDetailHeaderView *)topHeaderView {
    if (!_topHeaderView) {
        _topHeaderView = [[WYLDetailHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Size.width, SCREEN_Size.width / 1.6f)];
    }
    return _topHeaderView;
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
