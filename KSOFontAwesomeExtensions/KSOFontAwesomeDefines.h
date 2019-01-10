//
//  KSOFontAwesomeDefines.h
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

#ifndef __KSO_FONT_AWESOME_DEFINES__
#define __KSO_FONT_AWESOME_DEFINES__

#import <TargetConditionals.h>
#if (TARGET_OS_IPHONE)
#import <UIKit/UIKit.h>
#else
#import <AppKit/AppKit.h>
#endif

#if (TARGET_OS_IPHONE)

#ifndef KSOSize
#define KSOSize CGSize
#endif
#ifndef KSORect
#define KSORect CGRect
#endif
#ifndef KSOFont
#define KSOFont UIFont
#endif
#ifndef KSOImage
#define KSOImage UIImage
#endif
#ifndef KSOColor
#define KSOColor UIColor
#endif

#else

#ifndef KSOSize
#define KSOSize NSSize
#endif
#ifndef KSORect
#define KSORect NSRect
#endif
#ifndef KSOFont
#define KSOFont NSFont
#endif
#ifndef KSOImage
#define KSOImage NSImage
#endif
#ifndef KSOColor
#define KSOColor NSColor
#endif

#endif

NS_ASSUME_NONNULL_BEGIN

/**
 The default Postscript name for the Font Awesome regular font, which is @"FontAwesome5FreeRegular".
 */
FOUNDATION_EXTERN NSString *const KSOFontAwesomeFontNameRegular;
/**
 The default Postscript name for the Font Awesome Pro regular font, which is @"FontAwesome5ProRegular". This is only available with a Font Awesome Pro license.
 */
FOUNDATION_EXTERN NSString *const KSOFontAwesomeFontNameRegularPro;
/**
 The default Postscript name for the Font Awesome solid font, which is @"FontAwesome5FreeSolid".
 */
FOUNDATION_EXTERN NSString *const KSOFontAwesomeFontNameSolid;
/**
 The default Postscript name for the Font Awesome Pro solid font, which is @"FontAwesome5ProSolid". This is only available with a Font Awesome Pro license.
 */
FOUNDATION_EXTERN NSString *const KSOFontAwesomeFontNameSolidPro;
/**
 The default Postscript name for the Font Awesome brands font, which is @"FontAwesome5BrandsRegular".
 */
FOUNDATION_EXTERN NSString *const KSOFontAwesomeFontNameBrand;
/**
 The default Postscript name for the Font Awesome light font, which is @"FontAwesome5ProLight". This is only available with a Font Awesome Pro license.
 */
FOUNDATION_EXTERN NSString *const KSOFontAwesomeFontNameLight;

NS_ASSUME_NONNULL_END

#endif
