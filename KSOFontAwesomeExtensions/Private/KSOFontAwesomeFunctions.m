//
//  KSOFontAwesomeFunctions.m
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

#import "KSOFontAwesomeFunctions.h"
#if (TARGET_OS_IPHONE)
#import "UIFont+KSOFontAwesomeExtensions.h"
#else
#import "NSFont+KSOFontAwesomeExtensions.h"
#endif

#import <Stanley/Stanley.h>

CGFloat KSOFontAwesomePointSizeAndRectForFontTextAndSize(NSString *fontName, NSString *text, KSOSize size, KSORect *outRect) {
    CGFloat pointSize = MIN(size.width, size.height);
    KSOSize textSize = [text sizeWithAttributes:@{NSFontAttributeName: [KSOFont KSO_fontAwesomeFontWithName:fontName size:pointSize]}];
    
    while (textSize.width <= size.width &&
           textSize.height <= size.height) {
        
        pointSize++;
        
        textSize = [text sizeWithAttributes:@{NSFontAttributeName: [KSOFont KSO_fontAwesomeFontWithName:fontName size:pointSize]}];
    }
    
    while (textSize.width > size.width ||
           textSize.height > size.height) {
        
        pointSize--;

        textSize = [text sizeWithAttributes:@{NSFontAttributeName: [KSOFont KSO_fontAwesomeFontWithName:fontName size:pointSize]}];
    }
    
    KSORect rect;
    
#if (TARGET_OS_IPHONE)
    rect = KSTCGRectCenterInRect(CGRectMake(0, 0, textSize.width, textSize.height), CGRectMake(0, 0, size.width, size.height));
#else
    rect = KSTNSRectCenterInRect(NSMakeRect(0, 0, textSize.width, textSize.height), NSMakeRect(0, 0, size.width, size.height));
#endif
    
    *outRect = rect;
    
    return pointSize;
}
