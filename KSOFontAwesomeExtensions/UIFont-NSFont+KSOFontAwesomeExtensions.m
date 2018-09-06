//
//  UIFont+KSOFontAwesomeExtensions.m
//  KSOFontAwesomeExtensions
//
//  Created by William Towe on 3/27/17.
//  Copyright © 2018 Kosoku Interactive, LLC. All rights reserved.
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
#import "UIFont+KSOFontAwesomeExtensions.h"
#else
#import "NSFont+KSOFontAwesomeExtensions.h"
#endif
#import "NSBundle+KSOFontAwesomeExtensionsPrivate.h"

#import <Stanley/Stanley.h>

#import <CoreText/CoreText.h>
#import <objc/runtime.h>

NSString *const KSOFontAwesomeFontNameRegular = @"FontAwesome5FreeRegular";
NSString *const KSOFontAwesomeFontNameRegularPro = @"FontAwesome5ProRegular";
NSString *const KSOFontAwesomeFontNameSolid = @"FontAwesome5FreeSolid";
NSString *const KSOFontAwesomeFontNameSolidPro = @"FontAwesome5ProSolid";
NSString *const KSOFontAwesomeFontNameBrand = @"FontAwesome5BrandsRegular";
NSString *const KSOFontAwesomeFontNameLight = @"FontAwesome5ProLight";

@implementation KSOFont (KSOFontAwesomeExtensions)

+ (void)load {
#if (!TARGET_OS_WATCH)
    void(^block)(NSURL *) = ^(NSURL *fontURL) {
        CFErrorRef outErrorRef;
        if (!CTFontManagerRegisterFontsForURL((__bridge CFURLRef)fontURL, kCTFontManagerScopeProcess, &outErrorRef)) {
            if (outErrorRef != NULL) {
                NSError *outError = (__bridge_transfer NSError *)outErrorRef;
                
                KSTLogObject(outError);
            }
        }
    };
    
    for (NSURL *fontURL in [NSBundle.KSO_fontAwesomeExtensionsFrameworkBundle URLsForResourcesWithExtension:@"ttf" subdirectory:nil]) {
        block(fontURL);
    }
#endif
}

static void const *kFontAwesomeFontNameKeyRegular = &kFontAwesomeFontNameKeyRegular;
+ (NSString *)KSO_fontAwesomeFontNameRegular; {
    return objc_getAssociatedObject(self, kFontAwesomeFontNameKeyRegular) ?: KSOFontAwesomeFontNameRegular;
}
+ (void)setKSO_fontAwesomeFontNameRegular:(NSString *)fontName; {
    objc_setAssociatedObject(self, kFontAwesomeFontNameKeyRegular, fontName, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

static void const *kFontAwesomeFontNameKeySolid = &kFontAwesomeFontNameKeySolid;
+ (NSString *)KSO_fontAwesomeFontNameSolid {
    return objc_getAssociatedObject(self, kFontAwesomeFontNameKeySolid) ?: KSOFontAwesomeFontNameSolid;
}
+ (void)setKSO_fontAwesomeFontNameSolid:(NSString *)KSO_fontAwesomeFontNameSolid {
    objc_setAssociatedObject(self, kFontAwesomeFontNameKeySolid, KSO_fontAwesomeFontNameSolid, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

static void const *kFontAwesomeFontNameKeyBrand = &kFontAwesomeFontNameKeyBrand;
+ (NSString *)KSO_fontAwesomeFontNameBrand {
    return objc_getAssociatedObject(self, kFontAwesomeFontNameKeyBrand) ?: KSOFontAwesomeFontNameBrand;
}
+ (void)setKSO_fontAwesomeFontNameBrand:(NSString *)KSO_fontAwesomeFontNameBrand {
    objc_setAssociatedObject(self, kFontAwesomeFontNameKeyBrand, KSO_fontAwesomeFontNameBrand, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

static void const *kFontAwesomeFontNameKeyLight = &kFontAwesomeFontNameKeyLight;
+ (NSString *)KSO_fontAwesomeFontNameLight {
    return objc_getAssociatedObject(self, kFontAwesomeFontNameKeyLight) ?: KSOFontAwesomeFontNameLight;
}
+ (void)setKSO_fontAwesomeFontNameLight:(NSString *)KSO_fontAwesomeFontNameLight {
    objc_setAssociatedObject(self, kFontAwesomeFontNameKeyLight, KSO_fontAwesomeFontNameLight, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

+ (KSOFont *)KSO_fontAwesomeRegularFontOfSize:(CGFloat)size; {
    return [self KSO_fontAwesomeFontWithName:[self KSO_fontAwesomeFontNameRegular] size:size];
}
+ (KSOFont *)KSO_fontAwesomeSolidFontOfSize:(CGFloat)size; {
    return [self KSO_fontAwesomeFontWithName:[self KSO_fontAwesomeFontNameSolid] size:size];
}
+ (KSOFont *)KSO_fontAwesomeBrandFontOfSize:(CGFloat)size; {
    return [self KSO_fontAwesomeFontWithName:[self KSO_fontAwesomeFontNameBrand] size:size];
}
+ (KSOFont *)KSO_fontAwesomeLightFontOfSize:(CGFloat)size; {
    return [self KSO_fontAwesomeFontWithName:[self KSO_fontAwesomeFontNameLight] size:size];
}
+ (KSOFont *)KSO_fontAwesomeFontWithName:(NSString *)name size:(CGFloat)size; {
    KSOFont *retval = [KSOFont fontWithName:name size:size];
    
    if (retval == nil) {
#if (TARGET_OS_WATCH)
        KSTLog(@"Unable to find font named %@! Add the %@ font to your watchOS app target and watchOS extension target, as well as include it in the Info.plist of both targets using the UIAppFonts key",name,name);
#else
        KSTLog( @"Unable to find font named %@!",name);
#endif
    }
    
    return retval;
}

@end
