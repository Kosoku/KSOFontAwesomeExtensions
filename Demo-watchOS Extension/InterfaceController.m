//
//  InterfaceController.m
//  Demo-watchOS Extension
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

#import "InterfaceController.h"
#import "TableRowController.h"
#import "StringSection.h"

@interface InterfaceController ()
@property (weak,nonatomic) IBOutlet WKInterfaceTable *interfaceTable;

@property (copy,nonatomic) NSArray<StringSection *> *sections;
@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    self.sections = [StringSection stringSectionsFromJSON];
    
    [self.interfaceTable setNumberOfRows:self.sections.firstObject.items.count withRowType:NSStringFromClass(TableRowController.class)];
    
    for (NSInteger i=0; i<self.interfaceTable.numberOfRows; i++) {
        TableRowController *rowController = [self.interfaceTable rowControllerAtIndex:i];
        NSString *string = self.sections.firstObject.items[i].string;
        
        rowController.image = [StringSection imageForFontName:self.sections.firstObject.fontName string:string size:CGSizeMake(32, 32)];
        rowController.string = [StringSection hexForString:string];
    }
}

@end



