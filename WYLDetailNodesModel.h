//
//  WYLDetailNodesModel.h
//  EnjoyTrip
//
//  Created by 王亚龙 on 16/3/20.
//  Copyright © 2016年 YCD. All rights reserved.
//

#import "WYLDataRequestModel.h"
#import "WYLDetailDaysNodesNotesModel.h"

@interface WYLDetailNodesModel : WYLDataRequestModel

@property (nonatomic, strong) NSNumber * row_order;

@property (nonatomic, strong) NSNumber * score;


@property (nonatomic, strong) NSNumber * entry_id;
@property (nonatomic, copy) NSString * entry_type;

@property (nonatomic, strong) NSNumber * lat;
@property (nonatomic, strong) NSNumber * lng;

@property (nonatomic, strong) NSArray<WYLDetailDaysNodesNotesModel *> * notes;

/**
 *  下面都是没用的
 */

@property (nonatomic, copy) NSString * attraction_type;
@property (nonatomic, strong) NSNumber * updated_at;

//不知道干啥的属性
@property (nonatomic, copy) NSString * comment;
@property (nonatomic, strong) NSDictionary * memo;

@end
