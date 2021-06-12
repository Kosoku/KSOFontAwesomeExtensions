//
//  UIButton+KSOFontAwesomeExtensions.h
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

@interface UIButton (KSOFontAwesomeExtensions)

/**
 Set and get the size at which to draw the associated Font Awesome image. The default is CGSizeMake(25,25).
 */
@property (assign,nonatomic) CGSize KSO_fontAwesomeSize;

/**
 Calls through to KSO_setFontAwesomeString:forState:, passing KSO_fontAwesomeString and UIControlStateNormal.
 */
@property (copy,nonatomic,nullable) NSString *KSO_fontAwesomeString;
/**
 Returns the Font Awesome string set for the provided control state.
 
 @param state The control state
 @return The Font Awesome string
 */
- (nullable NSString *)KSO_fontAwesomeStringForState:(UIControlState)state;
/**
 Sets the Font Awesome string for the provided control state. Passing nil, clears the Font Awesome string for that control state.
 
 @param fontAwesomeString The Font Awesome string
 @param state The control state
 */
- (void)KSO_setFontAwesomeString:(nullable NSString *)fontAwesomeString forState:(UIControlState)state;

@end

NS_ASSUME_NONNULL_END
