//
//  TableRowController.m
//  KSOFontAwesomeExtensions
//
//  Created by William Towe on 4/4/17.
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

#import "TableRowController.h"

#import <WatchKit/WatchKit.h>

@interface TableRowController ()
@property (weak,nonatomic) IBOutlet WKInterfaceImage *interfaceImage;
@property (weak,nonatomic) IBOutlet WKInterfaceLabel *interfaceLabel;
@end

@implementation TableRowController

- (void)setImage:(UIImage *)image {
    [self.interfaceImage setImage:image];
}
- (void)setString:(NSString *)string {
    [self.interfaceLabel setText:string];
}

@end
