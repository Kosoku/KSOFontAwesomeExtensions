//
//  UIImage+KSOFontAwesomeExtensions.m
//  KSOFontAwesomeExtensions
//
//  Created by William Towe on 3/28/17.
//  Copyright © 2017 Kosoku Interactive, LLC. All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
//  1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
//
//  2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#import <TargetConditionals.h>
#if (TARGET_OS_IPHONE)
#import "UIImage+KSOFontAwesomeExtensions.h"
#import "UIFont+KSOFontAwesomeExtensions.h"
#else
#import "NSImage+KSOFontAwesomeExtensions.h"
#import "NSFont+KSOFontAwesomeExtensions.h"
#endif
#import "KSOFontAwesomeDefines.h"
#import "NSString+KSOFontAwesomeExtensions.h"
#import "KSOFontAwesomeFunctions.h"

@implementation KSOImage (KSOFontAwesomeExtensions)

+ (KSOImage *)KSO_fontAwesomeImageWithIcon:(KSOFontAwesomeIcon)icon size:(KSOSize)size; {
    return [self KSO_fontAwesomeImageWithIcon:icon foregroundColor:nil backgroundColor:nil size:size];
}
+ (KSOImage *)KSO_fontAwesomeImageWithIcon:(KSOFontAwesomeIcon)icon foregroundColor:(KSOColor *)foregroundColor size:(KSOSize)size; {
    return [self KSO_fontAwesomeImageWithIcon:icon foregroundColor:foregroundColor backgroundColor:nil size:size];
}
+ (KSOImage *)KSO_fontAwesomeImageWithIcon:(KSOFontAwesomeIcon)icon foregroundColor:(KSOColor *)foregroundColor backgroundColor:(KSOColor *)backgroundColor size:(KSOSize)size; {
    return [self KSO_fontAwesomeImageWithString:[NSString KSO_fontAwesomeStringForIcon:icon] foregroundColor:foregroundColor backgroundColor:backgroundColor size:size];
}

+ (KSOImage *)KSO_fontAwesomeImageWithString:(NSString *)string size:(KSOSize)size {
    return [self KSO_fontAwesomeImageWithString:string foregroundColor:nil backgroundColor:nil size:size];
}
+ (KSOImage *)KSO_fontAwesomeImageWithString:(NSString *)string foregroundColor:(KSOColor *)foregroundColor size:(KSOSize)size {
    return [self KSO_fontAwesomeImageWithString:string foregroundColor:foregroundColor backgroundColor:nil size:size];
}
+ (KSOImage *)KSO_fontAwesomeImageWithString:(NSString *)string foregroundColor:(KSOColor *)foregroundColor backgroundColor:(KSOColor *)backgroundColor size:(KSOSize)size {
#if (TARGET_OS_IPHONE)
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    
    if (backgroundColor != nil) {
        [backgroundColor setFill];
        UIRectFill(CGRectMake(0, 0, size.width, size.height));
    }
    
    NSString *text = string;
    CGRect rect;
    CGFloat pointSize = KSOFontAwesomePointSizeAndRectForIconAndSize(text, size, &rect);
    
    if (foregroundColor == nil) {
        UIColor *defaultColor = [UIColor colorWithRed:0 green:122.0/255.0 blue:1.0 alpha:1.0];
        
#if (TARGET_OS_WATCH)
        foregroundColor = defaultColor;
#else
        foregroundColor = [UIApplication sharedApplication].keyWindow.tintColor ?: defaultColor;
#endif
    }
    
    [text drawInRect:rect withAttributes:@{NSFontAttributeName: [KSOFont KSO_fontAwesomeFontOfSize:pointSize], NSForegroundColorAttributeName: foregroundColor}];
    
    UIImage *retval = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return retval;
#else
    NSImage *retval = [[NSImage alloc] initWithSize:size];
    
    [retval lockFocus];
    
    if (backgroundColor != nil) {
        [backgroundColor setFill];
        NSRectFill(NSMakeRect(0, 0, size.width, size.height));
    }
    
    NSString *text = string;
    NSRect rect;
    CGFloat pointSize = KSOFontAwesomePointSizeAndRectForIconAndSize(text, size, &rect);
    
    if (foregroundColor == nil) {
        foregroundColor = [NSColor colorForControlTint:[NSColor currentControlTint]];
    }
    
    [text drawInRect:rect withAttributes:@{NSFontAttributeName: [KSOFont KSO_fontAwesomeFontOfSize:pointSize], NSForegroundColorAttributeName: foregroundColor}];
    
    [retval unlockFocus];
    
    return retval;
#endif
}

@end
