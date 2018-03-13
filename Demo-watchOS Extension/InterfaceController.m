//
//  InterfaceController.m
//  Demo-watchOS Extension
//
//  Created by William Towe on 4/4/17.
//  Copyright © 2017 Kosoku Interactive, LLC. All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
//  1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
//
//  2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#import "InterfaceController.h"
#import "TableRowController.h"

@interface InterfaceController ()
@property (weak,nonatomic) IBOutlet WKInterfaceTable *interfaceTable;

@property (copy,nonatomic) NSArray<NSString *> *strings;
@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    self.strings = @[@"\uf2b9",@"\uf042"];
    
    [self.interfaceTable setNumberOfRows:self.strings.count withRowType:NSStringFromClass(TableRowController.class)];
    
    for (NSInteger i=0; i<self.interfaceTable.numberOfRows; i++) {
        TableRowController *rowController = [self.interfaceTable rowControllerAtIndex:i];
        
        [rowController setString:self.strings[i]];
    }
}

@end



