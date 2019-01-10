//
//  UIButton+KSOFontAwesomeExtensions.m
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

