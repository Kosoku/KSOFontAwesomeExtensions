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
 The default Postscript name for the Font Awesome regular font, which is @"FontAwesome5FreeRegular".
 */
FOUNDATION_EXPORT NSString *const KSOFontAwesomeFontNameRegular;
/**
 The default Postscript name for the Font Awesome solid font, which is @"FontAwesome5FreeSolid".
 */
FOUNDATION_EXPORT NSString *const KSOFontAwesomeFontNameSolid;
/**
 The default Postscript name for the Font Awesome brands font, which is @"FontAwesome5BrandsRegular".
 */
FOUNDATION_EXPORT NSString *const KSOFontAwesomeFontNameBrand;
/**
 The default Postscript name for the Font Awesome light font, which is @"FontAwesome5ProLight". This is only available with a Font Awesome Pro license.
 */
FOUNDATION_EXPORT NSString *const KSOFontAwesomeFontNameLight;

@interface NSFont (KSOFontAwesomeExtensions)

/**
 Set and get the Font Awesome regular font name. Use this to set a name other than @"FontAwesome5FreeRegular" if necessary.
 */
@property (class,copy,nonatomic,null_resettable) NSString *KSO_fontAwesomeFontNameRegular;
/**
 Set and get the Font Awesome solid font name. Use this to set a name other than @"FontAwesome5FreeSolid" if necessary.
 */
@property (class,copy,nonatomic,null_resettable) NSString *KSO_fontAwesomeFontNameSolid;
/**
 Set and get the Font Awesome brands font name. Use this to set a name other than @"FontAwesome5BrandsRegular" if necessary.
 */
@property (class,copy,nonatomic,null_resettable) NSString *KSO_fontAwesomeFontNameBrand;
/**
 Set and get the Font Awesome light font name. Use this to set a name other than @"FontAwesome5ProLight" if necessary.
 */
@property (class,copy,nonatomic,null_resettable) NSString *KSO_fontAwesomeFontNameLight;

/**
 Returns the Font Awesome regular font at the provided size.
 
 @param size The font size
 @return The Font Awesome regular font
 */
+ (nullable NSFont *)KSO_fontAwesomeRegularFontOfSize:(CGFloat)size;
/**
 Returns the Font Awesome solid font at the provided size.
 
 @param size The font size
 @return The Font Awesome solid font
 */
+ (nullable NSFont *)KSO_fontAwesomeSolidFontOfSize:(CGFloat)size;
/**
 Returns the Font Awesome brands font at the provided size.
 
 @param size The font size
 @return The Font Awesome brands font
 */
+ (nullable NSFont *)KSO_fontAwesomeBrandFontOfSize:(CGFloat)size;
/**
 Returns the Font Awesome light font at the provided size.
 
 @param size The font size
 @return The Font Awesome light font
 */
+ (nullable NSFont *)KSO_fontAwesomeLightFontOfSize:(CGFloat)size;
/**
 Returns the Font Awesome font with the provided name at the provided size.
 
 @param name The Font Awesome font name
 @param size The font size
 @return The Font Awesome font
 */
+ (nullable NSFont *)KSO_fontAwesomeFontWithName:(NSString *)name size:(CGFloat)size;

@end

NS_ASSUME_NONNULL_END
