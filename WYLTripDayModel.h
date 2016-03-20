//
//  WYLTripDayModel.h
//  EnjoyTrip
//
//  Created by 王亚龙 on 16/3/20.
//  Copyright © 2016年 YCD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WYLDestinationModel.h"
#import "WYLDetailNodesModel.h"

@class WYLDataRequestModel;

@interface WYLTripDayModel : WYLDataRequestModel

@property (nonatomic, copy) NSString * trip_date;

@property (nonatomic, strong) NSNumber * day;

@property (nonatomic, strong) NSNumber * updated_at;

@property (nonatomic, strong) WYLDestinationModel * destination;
@property (nonatomic, strong) NSArray<WYLDetailNodesModel *> * nodes;

@end
