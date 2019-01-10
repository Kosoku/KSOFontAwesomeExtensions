//
//  StringSection.h
//  KSOFontAwesomeExtensions
//
//  Created by William Towe on 3/14/18.
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
#import "StringItem.h"

@interface StringSection : NSObject

@property (readonly,copy,nonatomic) NSString *fontName;
@property (readonly,copy,nonatomic) NSString *title;
@property (readonly,copy,nonatomic) NSArray<StringItem *> *items;

- (instancetype)initWithFontName:(NSString *)fontName title:(NSString *)title strings:(NSArray<NSString *> *)strings;
- (instancetype)initWithFontName:(NSString *)fontName title:(NSString *)title items:(NSArray<StringItem *> *)items;

+ (NSArray<StringSection *> *)stringSectionsFromJSON;
+ (KSOImage *)imageForFontName:(NSString *)fontName string:(NSString *)string size:(KSOSize)size;
+ (NSString *)hexForString:(NSString *)string;

@end
