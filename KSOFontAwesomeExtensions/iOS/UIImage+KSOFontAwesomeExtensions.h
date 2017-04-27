//
//  UIImage+KSOFontAwesomeExtensions.h
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

#import <UIKit/UIKit.h>

#import <KSOFontAwesomeExtensions/KSOFontAwesomeConstants.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (KSOFontAwesomeExtensions)

/**
 Calls `KSO_fontAwesomeImageWithIcon:foregroundColor:backgroundColor:size:`, passing icon, nil, nil, and size.
 
 @param icon The Font Awesome icon
 @param size The desired size of the image
 @return The Font Awesome image
 */
+ (UIImage *)KSO_fontAwesomeImageWithIcon:(KSOFontAwesomeIcon)icon size:(CGSize)size;
/**
 Calls `KSO_fontAwesomeImageWithIcon:foregroundColor:backgroundColor:size:`, passing icon, foregroundColor, nil, and size.
 
 @param icon The Font Awesome icon
 @param foregroundColor The foreground color of the image, default is UIApplication.sharedApplication.keyWindow.tintColor
 @param size The desired size of the image
 @return The Font Awesome image
 */
+ (UIImage *)KSO_fontAwesomeImageWithIcon:(KSOFontAwesomeIcon)icon foregroundColor:(nullable UIColor *)foregroundColor size:(CGSize)size;
/**
 Draws the Font Awesome string for the provided icon into a graphics context of the provided size using the provided foreground and background colors.
 
 @param icon The Font Awesome icon
 @param foregroundColor The foreground color of the image, default is UIApplication.sharedApplication.keyWindow.tintColor
 @param backgroundColor The background color of the image
 @param size The desired size of the image
 @return The Font Awesome image
 */
+ (UIImage *)KSO_fontAwesomeImageWithIcon:(KSOFontAwesomeIcon)icon foregroundColor:(nullable UIColor *)foregroundColor backgroundColor:(nullable UIColor *)backgroundColor size:(CGSize)size;

/**
 Calls `[self KSO_fontAwesomeImageWithString:string foregroundColor:nil backgroundColor:nil size:size]`.
 
 The string should be in Unicode escaped form (e.g. @"\uf26e").
 
 @param string The Font Awesome string
 @param size The desired size of the image
 @return The Font Awesome image
 */
+ (UIImage *)KSO_fontAwesomeImageWithString:(NSString *)string size:(CGSize)size;
/**
 Calls `[self KSO_fontAwesomeImageWithString:string foregroundColor:foregroundColor backgroundColor:nil size:size]`.
 
 The string should be in Unicode escaped form (e.g. @"\uf26e").
 
 @param string The Font Awesome string
 @param foregroundColor The foreground color of the image, default is UIApplication.sharedApplication.keyWindow.tintColor
 @param size The desired size of the image
 @return The Font Awesome image
 */
+ (UIImage *)KSO_fontAwesomeImageWithString:(NSString *)string foregroundColor:(nullable UIColor *)foregroundColor size:(CGSize)size;
/**
 Draws the Font Awesome string into a graphics context of the provided size using the provided foreground and background colors.
 
 The string should be in Unicode escaped form (e.g. @"\uf26e").
 
 @param string The Font Awesome string
 @param foregroundColor The foreground color of the image, default is UIApplication.sharedApplication.keyWindow.tintColor
 @param backgroundColor The background color of the image
 @param size The desired size of the image
 @return The Font Awesome image
 */
+ (UIImage *)KSO_fontAwesomeImageWithString:(NSString *)string foregroundColor:(nullable UIColor *)foregroundColor backgroundColor:(nullable UIColor *)backgroundColor size:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
