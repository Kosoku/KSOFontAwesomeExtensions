//
//  KSOFontAwesomeFunctions.h
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

#import <TargetConditionals.h>

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGGeometry.h>
#if (TARGET_OS_OSX)
#import <Foundation/NSGeometry.h>
#endif

#import "KSOFontAwesomeDefines.h"

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT CGFloat KSOFontAwesomePointSizeAndRectForFontTextAndSize(NSString *fontName, NSString *text, KSOSize size, KSORect *outRect);

NS_ASSUME_NONNULL_END
