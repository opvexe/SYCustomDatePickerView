//
//  ViewController.m
//  SYPickerView
//
//  Created by FaceBooks on 2018/11/13.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import "ViewController.h"
#import "SYCustomPickerView.h"
#import "SYToolBarDatePickerView.h"
#import "NSDate+SYExtension.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)ClickToolBarDatePickerView{
    SYToolBarDatePickerView *datePickerView = [[SYToolBarDatePickerView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    datePickerView.datePickerType = SYCustomDatePickerViewTypeYearMonthDayHourMinute;
    datePickerView.minDate = [NSDate dateFromString:@"2015-03-02 12:00" formatter:@"yyyy-MM-dd HH:mm"];
    datePickerView.defaultDate = [NSDate dateFromString:@"2016-03-02 12:00" formatter:@"yyyy-MM-dd HH:mm"];
    datePickerView.maxDate = [NSDate dateFromString:@"2034-03-31 12:00" formatter:@"yyyy-MM-dd HH:mm"];
    [datePickerView setDatePickerSelectedBlock:^(NSString *str, NSDate *date) {
        
    }];
    [datePickerView show];
}
-(void)ClickCustomPickView{
    SYCustomPickerView *pickView = [[SYCustomPickerView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [pickView initWithArraySouce:@[@"他行",@"跨行转账",@"全部"]];
    [pickView setPickerSelectedBlock:^(NSString * str) {
        
    }];
    [pickView show];
}
@end
