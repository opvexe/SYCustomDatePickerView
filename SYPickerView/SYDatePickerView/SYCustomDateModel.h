//
//  SYCustomDateModel.h
//  SYPickerView
//
//  Created by FaceBooks on 2018/11/13.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SYCustomDateModel : NSObject
@property (nonatomic, assign) NSInteger year;
@property (nonatomic, assign) NSInteger month;
@property (nonatomic, assign) NSInteger day;
@property (nonatomic, assign) NSInteger hour;
@property (nonatomic, assign) NSInteger minute;

+(instancetype)modelWithDate:(NSDate *)date isMaxDate:(BOOL)isMaxDate;
@end

NS_ASSUME_NONNULL_END
