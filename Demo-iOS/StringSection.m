//
//  StringSection.m
//  KSOFontAwesomeExtensions
//
//  Created by William Towe on 3/14/18.
//  Copyright © 2018 Kosoku Interactive, LLC. All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
//  1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
//
//  2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

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
    
    for (NSURL *fontURL in [NSBundle.mainBundle URLsForResourcesWithExtension:@"ttf" subdirectory:@"Fonts"]) {
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
