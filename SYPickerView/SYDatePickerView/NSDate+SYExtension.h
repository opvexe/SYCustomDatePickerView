//
//  NSDate+SYExtension.h
//  SYPickerView
//
//  Created by FaceBooks on 2018/11/13.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (SYExtension)

/**
 * NSDate 转换成 NSString

 @param date 对应时间
 @param formatter 时间格式 YYYY-MM-dd HH:mm
 @return 时间字符串
 */
+(NSString *)stringFromDate:(NSDate *)date formatter:(NSString *)formatter;

/**
 * NSString 转换成 NSDate

 @param dateString 时间字符串
 @param formatter YYYY-MM-dd HH:mm
 @return 对应时间格式
 */
+(NSDate *)dateFromString:(NSString *)dateString formatter:(NSString *)formatter;

@end

NS_ASSUME_NONNULL_END
