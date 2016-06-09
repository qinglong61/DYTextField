//
//  ViewController.m
//  DYTextFieldDemo
//
//  Created by 段清伦 on 16/6/7.
//  Copyright © 2016年 duanyu. All rights reserved.
//

#import "ViewController.h"
#import "DYTextField.h"
#import "DYTextView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DYTextField *tf = [[DYTextField alloc] initWithFrame:CGRectMake(100, 30, 100, 100)];
    tf.placeholderColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:1];
    tf.textInset = UIEdgeInsetsMake(30, 30, 30, 30);
    tf.backgroundColor = [UIColor lightGrayColor];
    tf.placeholder = @"placeholder";
    tf.textColor = [UIColor blackColor];
    tf.font = [UIFont systemFontOfSize:20.f];
    [self.view addSubview:tf];
    
    DYTextView *tv = [[DYTextView alloc] initWithFrame:CGRectMake(0, 200, 320, 30)];
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
