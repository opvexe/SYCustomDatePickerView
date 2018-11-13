//
//  SYCustomPickerView.h
//  SYPickerView
//
//  Created by FaceBooks on 2018/11/13.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SYCustomPickerView : UIView

@property (nonatomic, copy) void(^PickerSelectedBlock)(NSString *);

/** 中间标题 */
@property (nonatomic, strong) NSString *title;
/** 中间标题字体颜色 */
@property (nonatomic, strong) UIColor *titleColor;
/** 中间标题字体大小 */
@property (nonatomic, assign) CGFloat titleFontSize;

/** 取消按钮标题 */
@property (nonatomic, strong) NSString *cancelTitle;
/** 取消按钮字体颜色 */
@property (nonatomic, strong) UIColor *cancelTitleColor;
/** 取消按钮字体大小 */
@property (nonatomic, assign) CGFloat cancelTitleFontSize;
/** 确定按钮标题 */
@property (nonatomic, strong) NSString *confirmTitle;
/** 确定按钮字体颜色 */
@property (nonatomic, strong) UIColor *confirmTitleColor;
/** 确定按钮字体大小 */
@property (nonatomic, assign) CGFloat confirmTitleFontSize;
/**
 显示
 */
-(void)show;

/**
 * 设置数值
 */
-(void)initWithArraySouce:(NSArray *)souce;
@end

NS_ASSUME_NONNULL_END
