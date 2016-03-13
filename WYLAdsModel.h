//
//  WYLAdsModel.h
//  EnjoyTrip
//
//  Created by 王亚龙 on 16/3/10.
//  Copyright © 2016年 YCD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYLAdsModel : WYLDataRequestModel

@property (nonatomic, copy) NSString * posotion;
@property (nonatomic, copy) NSString * image_url;
@property (nonatomic, copy) NSString * advert_type;
@property (nonatomic, copy) NSString * content;
@property (nonatomic, assign) BOOL rotation;



@end
