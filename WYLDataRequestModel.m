//
//  WYLDataRequestModel.m
//  EnjoyTrip
//
//  Created by 王亚龙 on 16/3/10.
//  Copyright © 2016年 YCD. All rights reserved.
//

#import "WYLDataRequestModel.h"

@implementation WYLDataRequestModel

+ (void)httpRequestSource:(NSString *)url
                    param:(NSDictionary *)param
                 progress:(void (^) (NSProgress * progress))progress
                  success:(void (^) (NSURLSessionDataTask *task, id responseObject))success
                   failer:(void (^) (NSURLSessionDataTask *task, NSError * error))failer {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:param progress:progress success:success failure:failer];
}

@end
