//
//  UIButton+KSOFontAwesomeExtensions.m
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

#import "UIButton+KSOFontAwesomeExtensions.h"
#import "UIImage+KSOFontAwesomeExtensions.h"

#import <objc/runtime.h>

static CGSize const kKSOFontAwesomeDefaultSize = {.width=25, .height=25};

@interface UIButton (KSOFontAwesomeExtensionsPrivate)
@property (readonly,nonatomic) NSMutableDictionary *KSO_controlStatesToFontAwesomeStrings;
@end

@implementation UIButton (KSOFontAwesomeExtensions)

static const void *kFontAwesomeSizeKey = &kFontAwesomeSizeKey;
@dynamic KSO_fontAwesomeSize;
- (CGSize)KSO_fontAwesomeSize {
    NSValue *retval = objc_getAssociatedObject(self, kFontAwesomeSizeKey);
    
    if (retval == nil) {
        retval = [NSValue valueWithCGSize:kKSOFontAwesomeDefaultSize];
    }
    
    return [retval CGSizeValue];
}
- (void)setKSO_fontAwesomeSize:(CGSize)KSO_fontAwesomeSize {
    objc_setAssociatedObject(self, kFontAwesomeSizeKey, [NSValue valueWithCGSize:KSO_fontAwesomeSize], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@dynamic KSO_fontAwesomeString;
- (NSString *)KSO_fontAwesomeString {
    return [self KSO_fontAwesomeStringForState:UIControlStateNormal];
}
- (void)setKSO_fontAwesomeString:(NSString *)KSO_fontAwesomeString {
    [self KSO_setFontAwesomeString:KSO_fontAwesomeString forState:UIControlStateNormal];
}

- (NSString *)KSO_fontAwesomeStringForState:(UIControlState)state; {
    return self.KSO_controlStatesToFontAwesomeStrings[@(state)];
}
- (void)KSO_setFontAwesomeString:(NSString *)fontAwesomeString forState:(UIControlState)state; {
    if (fontAwesomeString == nil) {
        [self.KSO_controlStatesToFontAwesomeStrings removeObjectForKey:@(state)];
        
        [self setImage:nil forState:state];
    }
    else {
        [self.KSO_controlStatesToFontAwesomeStrings setObject:fontAwesomeString forKey:@(state)];
        
        UIImage *image = [UIImage KSO_fontAwesomeSolidImageWithString:fontAwesomeString size:self.KSO_fontAwesomeSize];
        
        if (self.buttonType == UIButtonTypeSystem) {
            image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        }
        
        [self setImage:image forState:state];
    }
}

@end

@implementation UIButton (KSOFontAwesomeExtensionsPrivate)

- (NSMutableDictionary *)KSO_controlStatesToFontAwesomeStrings {
    NSMutableDictionary *retval = objc_getAssociatedObject(self, _cmd);
    
    if (retval == nil) {
        retval = [[NSMutableDictionary alloc] init];
        
        objc_setAssociatedObject(self, _cmd, retval, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return retval;
}

@end

