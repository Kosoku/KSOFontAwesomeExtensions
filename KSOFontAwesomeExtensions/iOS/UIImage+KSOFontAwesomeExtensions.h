//
//  UIImage+KSOFontAwesomeExtensions.h
//  KSOFontAwesomeExtensions
//
//  Created by William Towe on 3/28/17.
//  Copyright © 2021 Kosoku Interactive, LLC. All rights reserved.
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

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 Methods to create images from Font Awesome strings using the respective named font (e.g. regular, solid, light, or brands). Some strings exist in multiple fonts, ensure you specify the version you want.
 */
@interface UIImage (KSOFontAwesomeExtensions)

/**
 Returns [self KSO_fontAwesomeRegularImageWithString:foregroundColor:size], passing *string*, nil, and *size*.
 */
+ (nullable UIImage *)KSO_fontAwesomeRegularImageWithString:(NSString *)string size:(CGSize)size;
/**
 Returns [self KSO_fontAwesomeImageWithString:fontName:foregroundColor:backgroundColor:size:], passing *string*, [UIFont KSO_fontAwesomeFontNameRegular], *foregroundColor*, nil, and *size*.
 */
+ (nullable UIImage *)KSO_fontAwesomeRegularImageWithString:(NSString *)string foregroundColor:(nullable UIColor *)foregroundColor size:(CGSize)size;

/**
 Returns [self KSO_fontAwesomeBrandImageWithString:foregroundColor:size:], passing *string*, nil, and *size*.
 */
+ (nullable UIImage *)KSO_fontAwesomeBrandImageWithString:(NSString *)string size:(CGSize)size;
/**
 Returns [self KSO_fontAwesomeImageWithString:fontName:foregroundColor:backgroundColor:size:], passing *string*, [UIFont KSO_fontAwesomeFontNameBrand], *foregroundColor*, nil, and *size*.
 */
+ (nullable UIImage *)KSO_fontAwesomeBrandImageWithString:(NSString *)string foregroundColor:(nullable UIColor *)foregroundColor size:(CGSize)size;

/**
 Returns [self KSO_fontAwesomeSolidImageWithString:foregroundColor:size:], passing *string*, nil, and *size*.
 */
+ (nullable UIImage *)KSO_fontAwesomeSolidImageWithString:(NSString *)string size:(CGSize)size;
/**
 Returns [self KSO_fontAwesomeImageWithString:fontName:foregroundColor:backgroundColor:size:], passing *string*, [UIFont KSO_fontAwesomeFontNameSolid], *foregroundColor*, nil, and *size*.
 */
+ (nullable UIImage *)KSO_fontAwesomeSolidImageWithString:(NSString *)string foregroundColor:(nullable UIColor *)foregroundColor size:(CGSize)size;

/**
 Returns [self KSO_fontAwesomeLightImageWithString:foregroundColor:size:], passing *string*, nil, and *size*.
 */
+ (nullable UIImage *)KSO_fontAwesomeLightImageWithString:(NSString *)string size:(CGSize)size;
/**
 Returns [self KSO_fontAwesomeImageWithString:fontName:foregroundColor:backgroundColor:size:], passing *string*, [UIFont KSO_fontAwesomeFontNameLight], *foregroundColor*, nil, and *size*.
 */
+ (nullable UIImage *)KSO_fontAwesomeLightImageWithString:(NSString *)string foregroundColor:(nullable UIColor *)foregroundColor size:(CGSize)size;

/**
 Returns [self KSO_fontAwesomeImageWithString:fontName:foregroundColor:backgroundColor:size:], passing *string*, *fontName*, nil, nil, and *size*.
 */
+ (nullable UIImage *)KSO_fontAwesomeImageWithString:(NSString *)string fontName:(NSString *)fontName size:(CGSize)size;
/**
 Returns [self KSO_fontAwesomeImageWithString:fontName:foregroundColor:backgroundColor:size:], passing *string*, *fontName*, *foregroundColor*, nil, and *size*.
 */
+ (nullable UIImage *)KSO_fontAwesomeImageWithString:(NSString *)string fontName:(NSString *)fontName foregroundColor:(nullable UIColor *)foregroundColor size:(CGSize)size;
/**
 Returns an image created by drawing the specified string, which must be in Unicode escaped format (e.g. @"\uf2ab"), into an image with the specified foreground and background colors at the specified size. When passing the *fontName* param, you should use one of the class methods KSO_fontAwesomeFontNameRegular, KSO_fontAwesomeFontNameBrand, KSO_fontAwesomeFontNameLight, or KSO_fontAwesomeFontNameSolid.
 
 @param string The escaped Unicode to draw into an image
 @param fontName The Font Awesome font to use when drawing the string
 @param foregroundColor The foreground color to apply to the image
 @param backgroundColor The background color to use
 @param size The size to draw the image
 @return The image or nil
 */
+ (nullable UIImage *)KSO_fontAwesomeImageWithString:(NSString *)string fontName:(NSString *)fontName foregroundColor:(nullable UIColor *)foregroundColor backgroundColor:(nullable UIColor *)backgroundColor size:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
