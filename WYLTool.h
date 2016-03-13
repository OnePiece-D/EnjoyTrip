//
//  WYLTool.h
//  EnjoyTrip
//
//  Created by 王亚龙 on 16/3/10.
//  Copyright © 2016年 YCD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYLTool : NSObject

/**
 *  时间戳转换
 *
 *  @return Str
 */
+ (NSString *)dateHandleWith:(NSString *)date;

/**
 *  时间字符串格式转化
 */
+ (NSString *)dateFormatHandleWith:(NSString *)dateStr;

/**
 *  计算时间差
 */
+ (NSNumber *)dateToInterval:(NSString *)startDateStr endDateStr:(NSString *)endDateStr;

@end
