//
//  WYLDataRequestModel.h
//  EnjoyTrip
//
//  Created by 王亚龙 on 16/3/10.
//  Copyright © 2016年 YCD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYLDataRequestModel : NSObject

@property (nonatomic, strong) NSNumber * id;    //id Code


+ (void)httpRequestSource:(NSString *)url
                    param:(NSDictionary *)param
                 progress:(void (^) (NSProgress * progress))progress
                  success:(void (^) (NSURLSessionDataTask *task, id responseObject))success
                   failer:(void (^) (NSURLSessionDataTask *task, NSError * error))failer;

@end
