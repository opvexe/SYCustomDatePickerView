//
//  NSDate+SYExtension.m
//  SYPickerView
//
//  Created by FaceBooks on 2018/11/13.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import "NSDate+SYExtension.h"

@implementation NSDate (SYExtension)

+(NSString *)stringFromDate:(NSDate *)date formatter:(NSString *)formatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = formatter;
    return [dateFormatter stringFromDate:date];
}

+(NSDate *)dateFromString:(NSString *)dateString formatter:(NSString *)formatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = formatter;
    return [dateFormatter dateFromString:dateString];
}
@end
