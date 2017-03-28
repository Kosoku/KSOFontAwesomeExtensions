//
//  NSString+KSOFontAwesomeExtensions.h
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

#import <Foundation/Foundation.h>

#import <KSOFontAwesomeExtensions/KSOFontAwesomeConstants.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (KSOFontAwesomeExtensions)

/**
 Returns the Font Awesome identifier for the provided icon.
 
 @param icon The Font Awesome icon, see KSOFontAwesomeIcon
 @return The Font Awesome identifier, see KSOFontAwesomeIdentifier
 */
+ (NSString *)KSO_fontAwesomeIdentifierForIcon:(KSOFontAwesomeIcon)icon;
/**
 Returns the Font Awesome icon for the provided identifier.
 
 @param identifier The Font Awesome identifier, see KSOFontAwesomeIdentifier
 @return The Font Awesome icon, see KSOFontAwesomeIcon
 */
+ (KSOFontAwesomeIcon)KSO_fontAwesomeIconForIdentifier:(NSString *)identifier;

/**
 Returns the Font Awesome string for the provided icon.
 
 @param icon The Font Awesome icon, see KSOFontAwesomeIcon
 @return The Font Awesome string, see KSOFontAwesomeString
 */
+ (NSString *)KSO_fontAwesomeStringForIcon:(KSOFontAwesomeIcon)icon;
/**
 Returns the Font Awesome string for the provided identifier.
 
 @param identifier The Font Awesome identifier, see KSOFontAwesomeIdentifier
 @return The Font Awesome string, see KSOFontAwesomeString
 */
+ (nullable NSString *)KSO_fontAwesomeStringForIdentifier:(NSString *)identifier;

@end

NS_ASSUME_NONNULL_END
