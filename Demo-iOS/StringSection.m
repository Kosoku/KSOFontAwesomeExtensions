//
//  StringSection.m
//  KSOFontAwesomeExtensions
//
//  Created by William Towe on 3/14/18.
//  Copyright © 2018 Kosoku Interactive, LLC. All rights reserved.
//

#import "StringSection.h"

#import <KSOFontAwesomeExtensions/KSOFontAwesomeExtensions.h>
#import <Stanley/Stanley.h>

#import <CoreText/CoreText.h>

@interface StringSection ()
@property (readwrite,copy,nonatomic) NSString *title;
@property (readwrite,copy,nonatomic) NSArray<NSString *> *strings;
@end

@implementation StringSection

+ (void)initialize {
    if (self != StringSection.class) {
        return;
    }
#if (!TARGET_OS_WATCH)
    void(^block)(NSURL *) = ^(NSURL *fontURL){
        NSData *fontData = [NSData dataWithContentsOfURL:fontURL];
        
        if (fontData != nil) {
            CGDataProviderRef dataProvider = CGDataProviderCreateWithCFData((__bridge CFDataRef)fontData);
            CGFontRef font = CGFontCreateWithDataProvider(dataProvider);
            
            if (font != NULL) {
                CFErrorRef outError;
                if (!CTFontManagerRegisterGraphicsFont(font, &outError)) {
                    KSTLogObject(outError);
                    
                    if (outError != nil) {
                        CFRelease(outError);
                    }
                }
                
                CFRelease(font);
                CFRelease(dataProvider);
            }
        }
    };
    
    for (NSURL *fontURL in [NSBundle.mainBundle URLsForResourcesWithExtension:@"ttf" subdirectory:@"Fonts"]) {
        block(fontURL);
    }
#endif
}

- (instancetype)initWithTitle:(NSString *)title strings:(NSArray<NSString *> *)strings; {
    if (!(self = [super init]))
        return nil;
    
    _title = title;
    _strings = strings;
    
    return self;
}

+ (NSArray<StringSection *> *)stringSectionsFromJSON; {
    NSURL *fileURL = [NSBundle.mainBundle URLForResource:@"strings" withExtension:@"json"];
    NSData *data = [NSData dataWithContentsOfURL:fileURL];
    NSDictionary *JSON = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
    NSMutableArray *retval = [[NSMutableArray alloc] init];
    
    for (NSString *key in JSON[@"order"]) {
        if ([key isEqualToString:@"light"]) {
            if (![[UIFont fontNamesForFamilyName:@"Font Awesome 5 Pro"] containsObject:[UIFont KSO_fontAwesomeFontNameLight]]) {
                continue;
            }
        }
        [retval addObject:[[StringSection alloc] initWithTitle:key.localizedCapitalizedString strings:JSON[key]]];
    }
    
    return retval;
    
}
+ (KSOImage *)imageForTitle:(NSString *)title string:(NSString *)string size:(KSOSize)size; {
    if ([title.lowercaseString isEqualToString:@"regular"]) {
        return [KSOImage KSO_fontAwesomeRegularImageWithString:string size:size];
    }
    else if ([title.lowercaseString isEqualToString:@"solid"]) {
        return [KSOImage KSO_fontAwesomeSolidImageWithString:string size:size];
    }
    else if ([title.lowercaseString isEqualToString:@"brands"]) {
        return [KSOImage KSO_fontAwesomeBrandImageWithString:string size:size];
    }
    else if ([title.lowercaseString isEqualToString:@"light"]) {
        return [KSOImage KSO_fontAwesomeLightImageWithString:string size:size];
    }
    return nil;
}

@end
