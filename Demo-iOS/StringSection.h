//
//  StringSection.h
//  KSOFontAwesomeExtensions
//
//  Created by William Towe on 3/14/18.
//  Copyright © 2018 Kosoku Interactive, LLC. All rights reserved.
//

#import <KSOFontAwesomeExtensions/KSOFontAwesomeDefines.h>

@interface StringSection : NSObject

@property (readonly,copy,nonatomic) NSString *title;
@property (readonly,copy,nonatomic) NSArray<NSString *> *strings;

- (instancetype)initWithTitle:(NSString *)title strings:(NSArray<NSString *> *)strings;

+ (NSArray<StringSection *> *)stringSectionsFromJSON;
+ (KSOImage *)imageForTitle:(NSString *)title string:(NSString *)string size:(KSOSize)size;
+ (NSString *)hexForString:(NSString *)string;

@end
