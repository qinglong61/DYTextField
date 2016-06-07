//
//  DYTextView.h
//
//  Created by duanyu on 16/6/8.
//  Copyright © 2016年 duanyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DYTextView;
@protocol DYTextViewDelegate <NSObject>

@optional

- (BOOL)textViewShouldBeginEditing:(DYTextView *)textView;
- (BOOL)textViewShouldEndEditing:(DYTextView *)textView;

- (void)textViewDidBeginEditing:(DYTextView *)textView;
- (void)textViewDidEndEditing:(DYTextView *)textView;

- (BOOL)textView:(DYTextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text;
- (void)textViewDidChange:(DYTextView *)textView;

- (void)textViewDidChangeSelection:(DYTextView *)textView;

@end

@interface DYTextView : UIView

@property (nonatomic, assign)               id<DYTextViewDelegate> delegate;
@property (nonatomic, copy)                 NSString *text;
@property (nonatomic, strong)               UIFont *font;
@property (nonatomic, strong)               UIColor *textColor;
@property (nonatomic)                       NSTextAlignment textAlignment;
@property (nonatomic, strong)               NSString *placeholder;
@property (nonatomic, strong)               UIColor *placeholderColor;
@property (nonatomic, assign, readonly)     BOOL editing;
@property (nonatomic, assign)               float minHeight;
@property (nonatomic, assign)               int maxNumberOfLines;

@end