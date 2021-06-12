//
//  KSOFontAwesomeExtensions.h
//  KSOFontAwesomeExtensions
//
//  Created by William Towe on 3/27/17.
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

#import <TargetConditionals.h>
#if (TARGET_OS_IPHONE)
#import <UIKit/UIKit.h>
#else
#import <AppKit/AppKit.h>
#endif

//! Project version number for KSOFontAwesomeExtensions.
FOUNDATION_EXPORT double KSOFontAwesomeExtensionsVersionNumber;

//! Project version string for KSOFontAwesomeExtensions.
FOUNDATION_EXPORT const unsigned char KSOFontAwesomeExtensionsVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <KSOFontAwesomeExtensions/PublicHeader.h>

#import <KSOFontAwesomeExtensions/KSOFontAwesomeDefines.h>
#if (TARGET_OS_IPHONE)
#import <KSOFontAwesomeExtensions/UIFont+KSOFontAwesomeExtensions.h>
#import <KSOFontAwesomeExtensions/UIImage+KSOFontAwesomeExtensions.h>
#if (TARGET_OS_IOS || TARGET_OS_TV)
#import <KSOFontAwesomeExtensions/UIButton+KSOFontAwesomeExtensions.h>
#endif
#else
#import <KSOFontAwesomeExtensions/NSFont+KSOFontAwesomeExtensions.h>
#import <KSOFontAwesomeExtensions/NSImage+KSOFontAwesomeExtensions.h>
#endif
