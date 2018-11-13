//
//  SYCustomDatePickerView.h
//  SYPickerView
//
//  Created by FaceBooks on 2018/11/13.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, SYCustomDatePickerViewType) {
    SYCustomDatePickerViewTypeYearMonthDay,              //年月日
    SYCustomDatePickerViewTypeYearMonth,                 //年月
    SYCustomDatePickerViewTypeYearMonthDayHourMinute,    //年月日时分
    SYCustomDatePickerViewTypeHourMinute,                //时分
} NS_AVAILABLE_IOS(9_0);

@interface SYCustomDatePickerView : UIView

/**
 * 最小日期  SYCustomDatePickerViewTypeHourMinute模式下设置最小日期，必须同时设置最大日期，且必须是同一天，否则无意义
 */
@property (nonatomic, strong) NSDate *minDate;

/**
 * 最大日期  SYCustomDatePickerViewTypeHourMinute模式下设置最大日期，必须同时设置最小日期，且必须是同一天，否则无意义，
 */
@property (nonatomic, strong) NSDate *maxDate;

/**
 * 默认日期 即初始化时默认滚动到的日期，若是设置了最小日期，默认日期一定要大于或等于最小日期，不能小于最小日期（小于最小日期无意义）；同理，若是设置了最大日期，默认日期不能大于最大日期
 */
@property (nonatomic, strong) NSDate *defaultDate;

/**
 * 时间选择回调
 */
@property (nonatomic, copy) void(^DatePickerSelectedBlock)(NSString *,NSDate *);

/**
 * 是否限制今天为最大日期。默认NO
 */
@property (nonatomic, assign, getter=isLimitMaxDateToday) BOOL limitMaxDateToday;

/**
 * 类型
 */
@property (nonatomic, assign) SYCustomDatePickerViewType datePickerType;
@end

NS_ASSUME_NONNULL_END
