//
//  NSFont+KSOFontAwesomeExtensions.h
//  KSOFontAwesomeExtensions
//
//  Created by William Towe on 3/27/17.
//  Copyright © 2017 Kosoku Interactive, LLC. All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
//  1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
//
//  2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#import <AppKit/AppKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 The default name for the Font Awesome font, which is "fa-regular". It is easiest to name the font file included in your bundle this name. If not, you need to set the appropriate name using setKSO_fontAwesomeFontName:.
 */
FOUNDATION_EXPORT NSString *const KSOFontAwesomeFontNameRegular;
FOUNDATION_EXPORT NSString *const KSOFontAwesomeFontNameSolid;
FOUNDATION_EXPORT NSString *const KSOFontAwesomeFontNameBrand;

@interface NSFont (KSOFontAwesomeExtensions)

/**
 Set and get the Font Awesome font name. Use this to set a name other than "fa-regular" if necessary.
 */
@property (class,copy,nonatomic,null_resettable) NSString *KSO_fontAwesomeFontNameRegular;
@property (class,copy,nonatomic,null_resettable) NSString *KSO_fontAwesomeFontNameSolid;
@property (class,copy,nonatomic,null_resettable) NSString *KSO_fontAwesomeFontNameBrand;

/**
 Returns the Font Awesome font at the provided size.
 
 @param size The font size
 @return The Font Awesome font
 */
+ (NSFont *)KSO_fontAwesomeRegularFontOfSize:(CGFloat)size;
+ (NSFont *)KSO_fontAwesomeSolidFontOfSize:(CGFloat)size;
+ (NSFont *)KSO_fontAwesomeBrandFontOfSize:(CGFloat)size;
+ (NSFont *)KSO_fontAwesomeFontWithName:(NSString *)name size:(CGFloat)size;

@end

NS_ASSUME_NONNULL_END
