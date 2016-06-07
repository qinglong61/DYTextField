//
//  DYTextField.m
//
//  Created by duanyu on 13-12-4.
//  Copyright (c) 2013年 All rights reserved.
//

#import "DYTextField.h"
#import <QuartzCore/QuartzCore.h>

@implementation DYTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.returnKeyType = UIReturnKeyDone;
        self.enablesReturnKeyAutomatically = YES;
    }
    return self;
}

- (UIColor *)placeholderColor
{
    return [self valueForKeyPath:@"_placeholderLabel.textColor"];
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    [self setValue:placeholderColor forKeyPath:@"_placeholderLabel.textColor"];
}

//placeHolder
- (CGRect)textRectForBounds:(CGRect)bounds
{
    return UIEdgeInsetsInsetRect(bounds, _textInset);
}

//text
- (CGRect)editingRectForBounds:(CGRect)bounds
{
    return UIEdgeInsetsInsetRect(bounds, _textInset);
}

@end