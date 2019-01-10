//
//  UIImage+KSOFontAwesomeExtensions.m
//  KSOFontAwesomeExtensions
//
//  Created by William Towe on 3/28/17.
//  Copyright © 2019 Kosoku Interactive, LLC. All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

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

+ (KSOImage *)KSO_fontAwesomeBrandImageWithString:(NSString *)string size:(KSOSize)size; {
    return [self KSO_fontAwesomeBrandImageWithString:string foregroundColor:nil size:size];
}
+ (KSOImage *)KSO_fontAwesomeBrandImageWithString:(NSString *)string foregroundColor:(KSOColor *)foregroundColor size:(KSOSize)size; {
    return [self KSO_fontAwesomeImageWithString:string fontName:[KSOFont KSO_fontAwesomeFontNameBrand] foregroundColor:foregroundColor backgroundColor:nil size:size];
}

+ (KSOImage *)KSO_fontAwesomeSolidImageWithString:(NSString *)string size:(KSOSize)size; {
    return [self KSO_fontAwesomeSolidImageWithString:string foregroundColor:nil size:size];
}
+ (KSOImage *)KSO_fontAwesomeSolidImageWithString:(NSString *)string foregroundColor:(KSOColor *)foregroundColor size:(KSOSize)size; {
    return [self KSO_fontAwesomeImageWithString:string fontName:[KSOFont KSO_fontAwesomeFontNameSolid] foregroundColor:foregroundColor backgroundColor:nil size:size];
}

+ (KSOImage *)KSO_fontAwesomeLightImageWithString:(NSString *)string size:(KSOSize)size; {
    return [self KSO_fontAwesomeLightImageWithString:string foregroundColor:nil size:size];
}
+ (KSOImage *)KSO_fontAwesomeLightImageWithString:(NSString *)string foregroundColor:(KSOColor *)foregroundColor size:(KSOSize)size; {
    return [self KSO_fontAwesomeImageWithString:string fontName:[KSOFont KSO_fontAwesomeFontNameLight] foregroundColor:foregroundColor backgroundColor:nil size:size];
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
