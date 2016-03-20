//
//  WYLTripDayModel.m
//  EnjoyTrip
//
//  Created by 王亚龙 on 16/3/20.
//  Copyright © 2016年 YCD. All rights reserved.
//

#import "WYLTripDayModel.h"

#import "WYLDataRequestModel.h"

@implementation WYLTripDayModel

+ (NSDictionary *)mj_objectClassInArray {
    return @{
             @"nodes":@"WYLDetailNodesModel"
             };
}

@end
