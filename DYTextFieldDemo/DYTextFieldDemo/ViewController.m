//
//  ViewController.m
//  DYTextFieldDemo
//
//  Created by 段清伦 on 16/6/7.
//  Copyright © 2016年 duanyu. All rights reserved.
//

#import "ViewController.h"
#import "DYTextView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DYTextView *tv = [[DYTextView alloc] initWithFrame:CGRectMake(0, 100, 320, 30)];
    tv.backgroundColor = [UIColor lightGrayColor];
    tv.minHeight = 30;
    tv.maxNumberOfLines = 5;
    tv.placeholder = @"placeholder";
    tv.placeholderColor = [UIColor darkGrayColor];
    tv.textColor = [UIColor blackColor];
    tv.font = [UIFont systemFontOfSize:20.f];
    [self.view addSubview:tv];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
