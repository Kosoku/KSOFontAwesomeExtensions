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
#import "KSOFontAwesomeFunctions.h"

@implementation KSOImage (KSOFontAwesomeExtensions)

+ (KSOImage *)KSO_fontAwesomeRegularImageWithString:(NSString *)string size:(KSOSize)size {
    return [self KSO_fontAwesomeRegularImageWithString:string foregroundColor:nil size:size];
}
+ (KSOImage *)KSO_fontAwesomeRegularImageWithString:(NSString *)string foregroundColor:(KSOColor *)foregroundColor size:(KSOSize)size {
    return [self KSO_fontAwesomeImageWithString:string fontName:[KSOFont KSO_fontAwesomeFontNameRegular] foregroundColor:foregroundColor backgroundColor:nil size:size];
}

+ (KSOImage *)KSO_fontAwesomeBrandImageWithString:(NSString *)string size:(CGSize)size; {
    return [self KSO_fontAwesomeBrandImageWithString:string foregroundColor:nil size:size];
}
+ (KSOImage *)KSO_fontAwesomeBrandImageWithString:(NSString *)string foregroundColor:(KSOColor *)foregroundColor size:(KSOSize)size; {
    return [self KSO_fontAwesomeImageWithString:string fontName:[KSOFont KSO_fontAwesomeFontNameBrand] foregroundColor:foregroundColor backgroundColor:nil size:size];
}

+ (KSOImage *)KSO_fontAwesomeSolidImageWithString:(NSString *)string size:(CGSize)size; {
    return [self KSO_fontAwesomeSolidImageWithString:string foregroundColor:nil size:size];
}
+ (KSOImage *)KSO_fontAwesomeSolidImageWithString:(NSString *)string foregroundColor:(KSOColor *)foregroundColor size:(KSOSize)size; {
    return [self KSO_fontAwesomeImageWithString:string fontName:[KSOFont KSO_fontAwesomeFontNameSolid] foregroundColor:foregroundColor backgroundColor:nil size:size];
}

+ (KSOImage *)KSO_fontAwesomeImageWithString:(NSString *)string fontName:(NSString *)fontName size:(KSOSize)size; {
    return [self KSO_fontAwesomeImageWithString:string fontName:fontName foregroundColor:nil backgroundColor:nil size:size];
}
+ (KSOImage *)KSO_fontAwesomeImageWithString:(NSString *)string fontName:(NSString *)fontName foregroundColor:(nullable KSOColor *)foregroundColor size:(KSOSize)size; {
    return [self KSO_fontAwesomeImageWithString:string fontName:fontName foregroundColor:foregroundColor backgroundColor:nil size:size];
}
+ (KSOImage *)KSO_fontAwesomeImageWithString:(NSString *)string fontName:(NSString *)fontName foregroundColor:(KSOColor *)foregroundColor backgroundColor:(KSOColor *)backgroundColor size:(KSOSize)size; {
#if (TARGET_OS_IPHONE)
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    
    if (backgroundColor != nil) {
        [backgroundColor setFill];
        UIRectFill(CGRectMake(0, 0, size.width, size.height));
    }
    
    NSString *text = string;
    CGRect rect;
    CGFloat pointSize = KSOFontAwesomePointSizeAndRectForFontTextAndSize(fontName, text, size, &rect);
    
    if (foregroundColor == nil) {
        UIColor *defaultColor = [UIColor colorWithRed:0 green:122.0/255.0 blue:1.0 alpha:1.0];
        
#if (TARGET_OS_WATCH)
        foregroundColor = defaultColor;
#else
        foregroundColor = [UIApplication sharedApplication].keyWindow.tintColor ?: defaultColor;
#endif
    }
    
    [text drawInRect:rect withAttributes:@{NSFontAttributeName: [UIFont KSO_fontAwesomeFontWithName:fontName size:pointSize], NSForegroundColorAttributeName: foregroundColor}];
    
    UIImage *retval = [UIGraphicsGetImageFromCurrentImageContext() imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
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
    CGFloat pointSize = KSOFontAwesomePointSizeAndRectForFontTextAndSize(fontName, text, size, &rect);
    
    if (foregroundColor == nil) {
        foregroundColor = [NSColor colorForControlTint:[NSColor currentControlTint]];
    }
    
    [text drawInRect:rect withAttributes:@{NSFontAttributeName: [NSFont KSO_fontAwesomeFontWithName:fontName size:pointSize], NSForegroundColorAttributeName: foregroundColor}];
    
    [retval unlockFocus];
    
    return retval;
#endif
}

@end
