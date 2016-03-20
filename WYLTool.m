//
//  WYLTool.m
//  EnjoyTrip
//
//  Created by 王亚龙 on 16/3/10.
//  Copyright © 2016年 YCD. All rights reserved.
//

#import "WYLTool.h"

@implementation WYLTool

+ (NSString *)dateHandleWith:(NSString *)date {
    NSString * string = nil;
    
    
    return string;
}

+ (NSString *)dateFormatHandleWith:(NSString *)dateStr {
    NSArray * dateArray = [dateStr componentsSeparatedByString:@"-"];//三个
    return [dateArray componentsJoinedByString:@"."];
}

+ (NSNumber *)dateToInterval:(NSString *)startDateStr endDateStr:(NSString *)endDateStr {
    NSNumber * interval = nil;
    
    NSArray * startDateArray = [startDateStr componentsSeparatedByString:@"-"];//三个
    NSArray * endDateArray = [endDateStr componentsSeparatedByString:@"-"];
    
    CGFloat year = 0;
    CGFloat month = 0;
    CGFloat day = 0;
    
    if (([startDateArray[0] intValue] + 1 )!= [endDateArray[0] intValue]) {
        year = [endDateArray[0] intValue] - [startDateArray[0] intValue];
    }
    
    if ([startDateArray[1] intValue] != [endDateArray[1] intValue]) {
        month = [startDateArray[1] intValue] - [endDateArray[1] intValue];
    }
    
    if ([startDateArray[2] intValue] != [endDateArray[2] intValue]) {
        day = [startDateArray[2] intValue] - [endDateArray[2] intValue];
    }
    
    interval = [NSNumber numberWithInteger:day];
    
    return interval;
}

+ (CGSize)scaleImageOriginalSize:(CGSize)size {
    CGFloat width = size.width;
    CGFloat height = size.height;
    CGFloat scale = width / SCREEN_Size.width;
    width = SCREEN_Size.width;
    height = height / scale;
//    NSLog(@"size:%@",NSStringFromCGSize(size));
    return CGSizeMake(width, height);
}

@end
