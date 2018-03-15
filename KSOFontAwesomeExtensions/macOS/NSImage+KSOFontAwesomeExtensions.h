//
//  NSImage+KSOFontAwesomeExtensions.h
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

#import <AppKit/AppKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 Methods to create images from Font Awesome strings using the respective named font (e.g. regular, solid, light, or brands). Some strings exist in multiple fonts, ensure you specify the version you want. In order to use light icons you need a Font Awesome Pro license and must include the light font in your app bundle.
 */
@interface NSImage (KSOFontAwesomeExtensions)

/**
 Returns [self KSO_fontAwesomeRegularImageWithString:foregroundColor:size], passing *string*, nil, and *size*.
 */
+ (nullable NSImage *)KSO_fontAwesomeRegularImageWithString:(NSString *)string size:(NSSize)size;
/**
 Returns [self KSO_fontAwesomeImageWithString:fontName:foregroundColor:backgroundColor:size:], passing *string*, [NSFont KSO_fontAwesomeFontNameRegular], *foregroundColor*, nil, and *size*.
 */
+ (nullable NSImage *)KSO_fontAwesomeRegularImageWithString:(NSString *)string foregroundColor:(nullable NSColor *)foregroundColor size:(NSSize)size;

/**
 Returns [self KSO_fontAwesomeBrandImageWithString:foregroundColor:size:], passing *string*, nil, and *size*.
 */
+ (nullable NSImage *)KSO_fontAwesomeBrandImageWithString:(NSString *)string size:(NSSize)size;
/**
 Returns [self KSO_fontAwesomeImageWithString:fontName:foregroundColor:backgroundColor:size:], passing *string*, [NSFont KSO_fontAwesomeFontNameBrand], *foregroundColor*, nil, and *size*.
 */
+ (nullable NSImage *)KSO_fontAwesomeBrandImageWithString:(NSString *)string foregroundColor:(nullable NSColor *)foregroundColor size:(NSSize)size;

/**
 Returns [self KSO_fontAwesomeSolidImageWithString:foregroundColor:size:], passing *string*, nil, and *size*.
 */
+ (nullable NSImage *)KSO_fontAwesomeSolidImageWithString:(NSString *)string size:(NSSize)size;
/**
 Returns [self KSO_fontAwesomeImageWithString:fontName:foregroundColor:backgroundColor:size:], passing *string*, [NSFont KSO_fontAwesomeFontNameSolid], *foregroundColor*, nil, and *size*.
 */
+ (nullable NSImage *)KSO_fontAwesomeSolidImageWithString:(NSString *)string foregroundColor:(nullable NSColor *)foregroundColor size:(NSSize)size;

/**
 Returns [self KSO_fontAwesomeLightImageWithString:foregroundColor:size:], passing *string*, nil, and *size*.
 */
+ (nullable NSImage *)KSO_fontAwesomeLightImageWithString:(NSString *)string size:(NSSize)size;
/**
 Returns [self KSO_fontAwesomeImageWithString:fontName:foregroundColor:backgroundColor:size:], passing *string*, [NSFont KSO_fontAwesomeFontNameLight], *foregroundColor*, nil, and *size*.
 */
+ (nullable NSImage *)KSO_fontAwesomeLightImageWithString:(NSString *)string foregroundColor:(nullable NSColor *)foregroundColor size:(NSSize)size;

/**
 Returns [self KSO_fontAwesomeImageWithString:fontName:foregroundColor:backgroundColor:size:], passing *string*, *fontName*, nil, nil, and *size*.
 */
+ (nullable NSImage *)KSO_fontAwesomeImageWithString:(NSString *)string fontName:(NSString *)fontName size:(NSSize)size;
/**
 Returns [self KSO_fontAwesomeImageWithString:fontName:foregroundColor:backgroundColor:size:], passing *string*, *fontName*, *foregroundColor*, nil, and *size*.
 */
+ (nullable NSImage *)KSO_fontAwesomeImageWithString:(NSString *)string fontName:(NSString *)fontName foregroundColor:(nullable NSColor *)foregroundColor size:(NSSize)size;
/**
 Returns an image created by drawing the specified string, which must be in Unicode escaped format (e.g. @"\uf2ab"), into an image with the specified foreground and background colors at the specified size. When passing the *fontName* param, you should use one of the class methods KSO_fontAwesomeFontNameRegular, KSO_fontAwesomeFontNameBrand, KSO_fontAwesomeFontNameLight, or KSO_fontAwesomeFontNameSolid.
 
 @param string The escaped Unicode to draw into an image
 @param fontName The Font Awesome font to use when drawing the string
 @param foregroundColor The foreground color to apply to the image
 @param backgroundColor The background color to use
 @param size The size to draw the image
 @return The image or nil
 */
+ (nullable NSImage *)KSO_fontAwesomeImageWithString:(NSString *)string fontName:(NSString *)fontName foregroundColor:(nullable NSColor *)foregroundColor backgroundColor:(nullable NSColor *)backgroundColor size:(NSSize)size;

@end

NS_ASSUME_NONNULL_END
