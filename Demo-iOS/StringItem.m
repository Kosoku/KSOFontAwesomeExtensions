//
//  StringItem.m
//  KSOFontAwesomeExtensions
//
//  Created by William Towe on 3/15/18.
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

#import "StringItem.h"
#import "StringSection.h"

@interface StringItem ()
@property (readwrite,copy,nonatomic) NSString *title;
@property (readwrite,copy,nonatomic) NSString *string;
@end

@implementation StringItem

- (instancetype)initWithString:(NSString *)string {
    if (!(self = [super init]))
        return nil;
    
    _string = string;
    _title = [StringSection hexForString:_string];
    
    return self;
}

@end
