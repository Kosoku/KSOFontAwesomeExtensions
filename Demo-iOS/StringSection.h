//
//  StringSection.h
//  KSOFontAwesomeExtensions
//
//  Created by William Towe on 3/14/18.
//  Copyright © 2018 Kosoku Interactive, LLC. All rights reserved.
//

#import <TargetConditionals.h>
#if (TARGET_OS_IPHONE)
#import <UIKit/UIKit.h>
#else
#import <AppKit/AppKit.h>
#endif

@interface StringSection : NSObject

@property (readonly,copy,nonatomic) NSString *title;
@property (readonly,copy,nonatomic) NSArray<NSString *> *strings;

- (instancetype)initWithTitle:(NSString *)title strings:(NSArray<NSString *> *)strings;

+ (NSArray<StringSection *> *)stringSectionsFromJSON;
#if (TARGET_OS_IPHONE)
+ (UIImage *)imageForTitle:(NSString *)title string:(NSString *)string size:(CGSize)size;
#else
+ (NSImage *)imageForTitle:(NSString *)title string:(NSString *)string size:(NSSize)size;
#endif

@end
