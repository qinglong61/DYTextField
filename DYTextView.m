//
//  DYTextView.m
//
//  Created by duanyu on 16/6/8.
//  Copyright © 2016年 duanyu. All rights reserved.
//

#import "DYTextView.h"

@interface TextRectLabel : UILabel

@property (nonatomic, assign) UIEdgeInsets textInset;

@end

@implementation TextRectLabel

- (void)drawTextInRect:(CGRect)rect
{
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, _textInset)];
}

@end

@interface DYTextView () <UITextViewDelegate>

@end

@implementation DYTextView
{
    UITextView *_textView;
    TextRectLabel *_placeholderLbl;
    
    float _heightOfMaxLines;
    float _textContainerInsetTop;
}

@synthesize placeholder = _placeholder;
@synthesize placeholderColor = _placeholderColor;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _textView = [[UITextView alloc] initWithFrame:(CGRect){CGPointZero, frame.size}];
        _textView.delegate = self;
        _textView.returnKeyType = UIReturnKeyDone;
        _textView.enablesReturnKeyAutomatically = YES;
        _textView.backgroundColor = [UIColor clearColor];
        _textView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        [self addSubview:_textView];
        
        _placeholderLbl = [[TextRectLabel alloc] initWithFrame:_textView.frame];
        _placeholderLbl.textInset = UIEdgeInsetsMake(0, 5, 0, 5);
        [self addSubview:_placeholderLbl];
    }
    return self;
}

- (NSString *)text
{
    return _textView.text;
}

- (void)setText:(NSString *)text
{
    _textView.text = text;
    [self textViewDidChange:_textView];
}

- (UIFont *)font
{
    return _textView.font;
}

- (void)setFont:(UIFont *)font
{
    _textView.font = font;
    _placeholderLbl.font = font;
}

- (UIColor *)textColor
{
    return _textView.textColor;
}

- (void)setTextColor:(UIColor *)textColor
{
    _textView.textColor = textColor;
}

- (NSTextAlignment)textAlignment
{
    return _textView.textAlignment;
}

- (void)setTextAlignment:(NSTextAlignment)textAlignment
{
    _textView.textAlignment = textAlignment;
    _placeholderLbl.textAlignment = textAlignment;
}

- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = placeholder;
    _placeholderLbl.text = _placeholder;
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    _placeholderColor = placeholderColor;
    _placeholderLbl.textColor = _placeholderColor;
}

#pragma mark - UITextViewDelegate

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    if ([self.delegate respondsToSelector:@selector(textViewShouldBeginEditing:)]) {
        _editing = [self.delegate textViewShouldBeginEditing:self];
        return self.editing;
    }
    _editing = YES;
    return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    if ([self.delegate respondsToSelector:@selector(textViewShouldEndEditing:)]) {
        return [self.delegate textViewShouldEndEditing:self];
    }
    return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    _textContainerInsetTop = (_minHeight - contentSizeWithFontAndNumberOfLines(_textView.font, 1)) / 2.f;
    _heightOfMaxLines = contentSizeWithFontAndNumberOfLines(_textView.font, _maxNumberOfLines) + _textContainerInsetTop * 2.f;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 7.0) {
        _textView.textContainerInset = UIEdgeInsetsMake(_textContainerInsetTop, 0, _textContainerInsetTop, 0);
    }
    
    if ([self.delegate respondsToSelector:@selector(textViewDidBeginEditing:)]) {
        [self.delegate textViewDidBeginEditing:self];
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    if ([self.delegate respondsToSelector:@selector(textViewDidEndEditing:)]) {
        [self.delegate textViewDidEndEditing:self];
    }
    _editing = NO;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([self.delegate respondsToSelector:@selector(textView:shouldChangeTextInRange:replacementText:)]) {
        return [self.delegate textView:self shouldChangeTextInRange:range replacementText:text];
    }
    return YES;
}

- (void)textViewDidChange:(UITextView *)textView
{
    float newHeight = textView.contentSize.height;
    if ([UIDevice currentDevice].systemVersion.intValue == 7) {
        newHeight = [self textContainerView].frame.size.height;
        textView.contentOffset = CGPointMake(0, newHeight - textView.frame.size.height);
    }
    if ([textView.text isEqualToString:@""]) {
        newHeight = _minHeight;
    }
    if (newHeight > _heightOfMaxLines) {
        newHeight = _heightOfMaxLines;
    }
    if (newHeight >= _minHeight && newHeight <= _heightOfMaxLines) {
        if (self.frame.size.height != newHeight) {
            CGRect rect = self.frame;
            rect.size.height = newHeight;
            self.frame = rect;
        }
    }
    [textView scrollRangeToVisible:textView.selectedRange];
    _placeholderLbl.hidden = textView.text.length != 0;
    if ([self.delegate respondsToSelector:@selector(textViewDidChange:)]) {
        [self.delegate textViewDidChange:self];
    }
}

- (void)textViewDidChangeSelection:(UITextView *)textView
{
    [textView scrollRangeToVisible:textView.selectedRange];
    if ([self.delegate respondsToSelector:@selector(textViewDidChangeSelection:)]) {
        [self.delegate textViewDidChangeSelection:self];
    }
}

#pragma mark - util

float contentSizeWithFontAndNumberOfLines(UIFont *font, int numberOfLines)
{
    return ceilf(font.lineHeight * numberOfLines);
}

- (UIView *)textContainerView
{
    for (UIView *subview in [_textView subviews]) {
        if ([subview isKindOfClass:NSClassFromString(@"_UITextContainerView")]) {
            return subview;
        }
    }
    return nil;
}

@end