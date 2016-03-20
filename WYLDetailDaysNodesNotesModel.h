//
//  WYLDetailDaysNodesNotesModel.h
//  EnjoyTrip
//
//  Created by 王亚龙 on 16/3/20.
//  Copyright © 2016年 YCD. All rights reserved.
//

#import "WYLDataRequestModel.h"

#import "WYLPhotoModel.h"
#import "WYLVideoModel.h"

@interface WYLDetailDaysNodesNotesModel : WYLDataRequestModel

@property (nonatomic, strong) NSNumber * row_order;

@property (nonatomic, copy) NSString * layout;

@property (nonatomic, strong) NSNumber * col;

@property (nonatomic, copy) NSString * desc;

@property (nonatomic, strong) NSNumber * updated_at;

@property (nonatomic, strong) WYLPhotoModel * photo;

@property (nonatomic, strong) WYLVideoModel * video;

@end
