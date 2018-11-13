//
//  SYCustomPickerView.m
//  SYPickerView
//
//  Created by FaceBooks on 2018/11/13.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import "SYCustomPickerView.h"
#define WEAKSELF(weakSelf) __weak typeof(self) (weakSelf) = self;
static CGFloat CONTENTVIEWHEIGHT = 254;
@interface SYCustomPickerView ()<UIPickerViewDelegate, UIPickerViewDataSource>
@property (nonatomic, strong) UIPickerView *pickerView;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIView *toolBarView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *cancelBtn;
@property (nonatomic, strong) UIButton *confirmBtn;
@property (nonatomic, strong) UIView *separatorLine;
@property (nonatomic, strong) NSString *selectedString;
@property (nonatomic, strong)NSMutableArray *lists;
@end
@implementation SYCustomPickerView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubViews];
    }
    return self;
}

-(void)setupSubViews {
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)]];
    [self addSubview:self.contentView];
    [self.contentView addSubview:self.toolBarView];
    [self.contentView addSubview:self.separatorLine];
    [self.contentView addSubview:self.pickerView];
}

-(void)initWithArraySouce:(NSArray *)souce{
    self.lists = [NSMutableArray arrayWithArray:souce];
    [self.pickerView reloadAllComponents];
}

-(void)show {
    
    WEAKSELF(weakSelf);
    [UIView animateWithDuration:0.25 animations:^{
        weakSelf.contentView.frame = CGRectMake(0, weakSelf.frame.size.height - CONTENTVIEWHEIGHT, [UIScreen mainScreen].bounds.size.width, CONTENTVIEWHEIGHT);
    }];
    [[[UIApplication sharedApplication] keyWindow] addSubview:self];
}

-(void)dismiss {
    WEAKSELF(weakSelf);
    [UIView animateWithDuration:0.3 animations:^{
        weakSelf.contentView.frame = CGRectMake(0, weakSelf.frame.size.height , weakSelf.frame.size.width, CONTENTVIEWHEIGHT);
        weakSelf.alpha = 0;
    } completion:^(BOOL finished) {
        [weakSelf removeFromSuperview];
    }];
}

-(UIView *)contentView {
    if (_contentView == nil) {
        _contentView = [[UIView alloc] initWithFrame:(CGRectMake(0, self.frame.size.height, [UIScreen mainScreen].bounds.size.width, CONTENTVIEWHEIGHT))];
        _contentView.backgroundColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0];
    }
    return _contentView;
}

-(UIView *)toolBarView {
    if (!_toolBarView) {
        _toolBarView = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 45))];
        _toolBarView.backgroundColor = [UIColor whiteColor];
        
        [_toolBarView addSubview:self.cancelBtn];
        [_toolBarView addSubview:self.titleLabel];
        [_toolBarView addSubview:self.confirmBtn];
    }
    return _toolBarView;
}

-(UILabel *)titleLabel {
    if (_titleLabel == nil) {
        UILabel *label = [[UILabel alloc] initWithFrame:(CGRectMake(([UIScreen mainScreen].bounds.size.width - 100)/2, 0, 100, 45))];
        label.text = @"选择日期";
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:16.f];
        _titleLabel = label;
    }
    return _titleLabel;
}

-(UIButton *)cancelBtn {
    if (_cancelBtn == nil) {
        _cancelBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_cancelBtn setTitle:@"取消" forState:(UIControlStateNormal)];
        _cancelBtn.titleLabel.font = [UIFont systemFontOfSize:15.f];
        [_cancelBtn setTitleColor:[UIColor grayColor] forState:(UIControlStateNormal)];
        [_cancelBtn setFrame:(CGRectMake(10, 0, 60, 45))];
        [_cancelBtn addTarget:self action:@selector(cancelAction:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _cancelBtn;
}

-(UIButton *)confirmBtn {
    if (_confirmBtn == nil) {
        UIButton *confirmBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [confirmBtn setTitle:@"确定" forState:(UIControlStateNormal)];
        [confirmBtn setTitleColor:[UIColor purpleColor] forState:(UIControlStateNormal)];
        confirmBtn.titleLabel.font = [UIFont systemFontOfSize:15.f];
        [confirmBtn setFrame:(CGRectMake([UIScreen mainScreen].bounds.size.width - 70, 0, 60, 45))];
        [confirmBtn addTarget:self action:@selector(sureAction:) forControlEvents:(UIControlEventTouchUpInside)];
        _confirmBtn = confirmBtn;
    }
    return _confirmBtn;
}

-(UIView *)separatorLine {
    if (_separatorLine == nil) {
        _separatorLine = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.toolBarView.frame), self.frame.size.width, 0.5)];
        _separatorLine.backgroundColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0];
    }
    return _separatorLine;
}

-(UIPickerView *)pickerView {
    if (_pickerView == nil) {
        _pickerView = [[UIPickerView alloc] init];
        _pickerView.delegate = self;
        _pickerView.dataSource = self;
        _pickerView.backgroundColor = [UIColor whiteColor];
        _pickerView.frame =CGRectMake(0, CGRectGetMaxY(self.separatorLine.frame), self.frame.size.width, self.contentView.frame.size.height - CGRectGetMaxY(self.separatorLine.frame));
    }
    return _pickerView;
}
#pragma mark - SEL Aciton
-(void)cancelAction:(UIButton *)sender {
    [self dismiss];
}

-(void)sureAction:(UIButton *)sender {
    if (self.PickerSelectedBlock) {
        self.PickerSelectedBlock(self.selectedString);
    }
    [self dismiss];
}

#pragma mark -  UIPickerViewDataSource

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.lists.count;
}

-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    return pickerView.frame.size.width / 2;
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 35.f;
}

-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, 0, pickerView.frame.size.width / 2, 35);
    label.textColor = [UIColor darkGrayColor];
    label.font = [UIFont systemFontOfSize:17.0];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = [NSString stringWithFormat:@"%@",[self.lists objectAtIndex:row]];
    return label;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.selectedString = [NSString stringWithFormat:@"%@",[self.lists objectAtIndex:row]];
}
#pragma mark - setter
-(void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = title;
}

-(void)setTitleColor:(UIColor *)titleColor {
    _titleColor = titleColor;
    self.titleLabel.textColor = titleColor;
}

-(void)setTitleFontSize:(CGFloat)titleFontSize {
    _titleFontSize = titleFontSize;
    self.titleLabel.font = [UIFont systemFontOfSize:titleFontSize];
}

-(void)setCancelTitle:(NSString *)cancelTitle {
    _cancelTitle = cancelTitle;
    [self.cancelBtn setTitle:cancelTitle forState:(UIControlStateNormal)];
}

-(void)setCancelTitleColor:(UIColor *)cancelTitleColor {
    _cancelTitleColor = cancelTitleColor;
    [self.cancelBtn setTitleColor:cancelTitleColor forState:(UIControlStateNormal)];
}

-(void)setCancelTitleFontSize:(CGFloat)cancelTitleFontSize {
    _cancelTitleFontSize = cancelTitleFontSize;
    self.cancelBtn.titleLabel.font = [UIFont systemFontOfSize:cancelTitleFontSize];
}

-(void)setConfirmTitle:(NSString *)confirmTitle {
    _confirmTitle = confirmTitle;
    [self.confirmBtn setTitle:confirmTitle forState:(UIControlStateNormal)];
}

-(void)setConfirmTitleColor:(UIColor *)confirmTitleColor {
    _confirmTitleColor = confirmTitleColor;
    [self.confirmBtn setTitleColor:confirmTitleColor forState:(UIControlStateNormal)];
}

-(void)setConfirmTitleFontSize:(CGFloat)confirmTitleFontSize {
    _confirmTitleFontSize = confirmTitleFontSize;
    self.confirmBtn.titleLabel.font = [UIFont systemFontOfSize:confirmTitleFontSize];
}

@end
