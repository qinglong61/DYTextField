//
//  DYTextField.h
//
//  Created by duanyu on 13-12-4.
//  Copyright (c) 2013年 All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PWTextField : UITextField

@property (nonatomic, strong) UIColor *placeholderColor;
@property (nonatomic, assign) UIEdgeInsets textInset;

@end

@class PWTextView;
@protocol PWTextViewDelegate <NSObject>

@optional

- (BOOL)textViewShouldBeginEditing:(PWTextView *)textView;
- (BOOL)textViewShouldEndEditing:(PWTextView *)textView;

- (void)textViewDidBeginEditing:(PWTextView *)textView;
- (void)textViewDidEndEditing:(PWTextView *)textView;

- (BOOL)textView:(PWTextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text;
- (void)textViewDidChange:(PWTextView *)textView;

- (void)textViewDidChangeSelection:(PWTextView *)textView;

@end

@interface PWTextView : UIView

@property (nonatomic, assign)               id<PWTextViewDelegate> delegate;
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
