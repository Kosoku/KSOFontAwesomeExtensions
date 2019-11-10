//
//  StringSection.m
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

#import "StringSection.h"

#import <KSOFontAwesomeExtensions/KSOFontAwesomeExtensions.h>
#import <Stanley/Stanley.h>

#import <CoreText/CoreText.h>

@interface StringSection ()
@property (readwrite,copy,nonatomic) NSString *fontName;
@property (readwrite,copy,nonatomic) NSString *title;
@property (readwrite,copy,nonatomic) NSArray<StringItem *> *items;
@end

@implementation StringSection

+ (void)initialize {
    if (self != StringSection.class) {
        return;
    }
    
#if (!TARGET_OS_WATCH)
    void(^block)(NSURL *) = ^(NSURL *fontURL) {
        CFErrorRef outErrorRef;
        if (!CTFontManagerRegisterFontsForURL((__bridge CFURLRef)fontURL, kCTFontManagerScopeProcess, &outErrorRef)) {
            if (outErrorRef != NULL) {
                NSError *outError = (__bridge_transfer NSError *)outErrorRef;
                
                KSTLogObject(outError);
            }
        }
    };
    
    for (NSURL *fontURL in [NSBundle.mainBundle URLsForResourcesWithExtension:@"otf" subdirectory:@"Fonts"]) {
        block(fontURL);
    }
#endif
}

- (instancetype)initWithFontName:(NSString *)fontName title:(NSString *)title strings:(NSArray<NSString *> *)strings; {
    if (!(self = [super init]))
        return nil;
    
    _fontName = fontName;
    _title = title;
    
    NSMutableArray *temp = [[NSMutableArray alloc] init];
    
    for (NSString *string in strings) {
        [temp addObject:[[StringItem alloc] initWithString:string]];
    }
    
    _items = temp;
    
    return self;
}
- (instancetype)initWithFontName:(NSString *)fontName title:(NSString *)title items:(NSArray<StringItem *> *)items; {
    if (!(self = [super init]))
        return nil;
    
    _fontName = fontName;
    _title = title;
    _items = items;
    
    return self;
}

+ (NSArray<StringSection *> *)stringSectionsFromJSON; {
    NSURL *fileURL = [NSBundle.mainBundle URLForResource:@"strings" withExtension:@"json"];
    NSData *data = [NSData dataWithContentsOfURL:fileURL];
    NSDictionary *JSON = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
    NSMutableArray *retval = [[NSMutableArray alloc] init];
    
    for (NSString *fontName in JSON[@"order"]) {
        KSOFont *font = [KSOFont fontWithName:fontName size:17.0];
        
        if (font == nil) {
            continue;
        }
        
        NSCharacterSet *charSet = (__bridge_transfer NSCharacterSet *)CTFontCopyCharacterSet((__bridge CTFontRef)font);
        NSArray *strings = charSet.KST_allStrings;
        
        [retval addObject:[[StringSection alloc] initWithFontName:fontName title:JSON[@"fontNamesToTitles"][fontName] strings:strings]];
    }
    
    return retval;
    
}
+ (KSOImage *)imageForFontName:(NSString *)fontName string:(NSString *)string size:(KSOSize)size; {
    return [KSOImage KSO_fontAwesomeImageWithString:string fontName:fontName size:size];
}
+ (NSString *)hexForString:(NSString *)string; {
    NSMutableString *retval = [[NSMutableString alloc] init];
    
    for (NSUInteger i=0; i<string.length; i++) {
        [retval appendFormat:@"%04x",[string characterAtIndex:i]];
    }
    
    return retval;
}

@end
