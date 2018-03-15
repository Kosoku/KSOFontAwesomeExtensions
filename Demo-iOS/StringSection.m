//
//  StringSection.m
//  KSOFontAwesomeExtensions
//
//  Created by William Towe on 3/14/18.
//  Copyright © 2018 Kosoku Interactive, LLC. All rights reserved.
//

#import "StringSection.h"

#import <KSOFontAwesomeExtensions/KSOFontAwesomeExtensions.h>

@interface StringSection ()
@property (readwrite,copy,nonatomic) NSString *title;
@property (readwrite,copy,nonatomic) NSArray<NSString *> *strings;
@end

@implementation StringSection

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
