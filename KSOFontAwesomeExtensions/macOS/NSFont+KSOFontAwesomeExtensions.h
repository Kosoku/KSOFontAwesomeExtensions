//
//  NSFont+KSOFontAwesomeExtensions.h
//  KSOFontAwesomeExtensions
//
//  Created by William Towe on 3/27/17.
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

#import <KSOFontAwesomeExtensions/KSOFontAwesomeDefines.h>

NS_ASSUME_NONNULL_BEGIN

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
