//
//  ViewController.m
//  Demo-macOS
//
//  Created by William Towe on 3/28/17.
//  Copyright © 2017 Kosoku Interactive, LLC. All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
//  1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
//
//  2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#import "ViewController.h"
#import "StringSection.h"

#import <KSOFontAwesomeExtensions/KSOFontAwesomeExtensions.h>

#import <Quartz/Quartz.h>

static NSSize const kItemSize = {.width=64, .height=64};

@interface PreviewItem : NSObject <QLPreviewItem>
@property (copy,nonatomic) NSURL *URL;
@property (copy,nonatomic) NSString *title;

- (instancetype)initWithURL:(NSURL *)URL title:(NSString *)title;
@end

@implementation PreviewItem

- (NSURL *)previewItemURL {
    return self.URL;
}
- (NSString *)previewItemTitle {
    return self.title;
}

- (instancetype)initWithURL:(NSURL *)URL title:(NSString *)title; {
    if (!(self = [super init]))
        return nil;
    
    _URL = URL;
    _title = title;
    
    return self;
}

@end

@interface CollectionViewSectionHeader : NSView
@property (strong,nonatomic) NSTextField *titleLabel;
@end

@implementation CollectionViewSectionHeader
- (instancetype)initWithFrame:(NSRect)frameRect {
    if (!(self = [super initWithFrame:frameRect]))
        return nil;
    
    self.titleLabel = [NSTextField labelWithString:@""];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.titleLabel];
    
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[view]-|" options:0 metrics:nil views:@{@"view": self.titleLabel}]];
    [NSLayoutConstraint activateConstraints:@[[NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]]];
    
    return self;
}
- (BOOL)isOpaque {
    return NO;
}
- (void)drawRect:(NSRect)dirtyRect {
    [[NSColor colorWithWhite:0.95 alpha:0.5] setFill];
    NSRectFill(self.bounds);
}
@end

@interface CollectionViewItem : NSCollectionViewItem
@property (strong,nonatomic) NSImageView *iconImageView;
@property (strong,nonatomic) NSTextField *titleLabel;
@end

@implementation CollectionViewItem

- (void)loadView {
    [self setView:[[NSView alloc] initWithFrame:NSZeroRect]];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setIconImageView:[[NSImageView alloc] initWithFrame:NSZeroRect]];
    [self.iconImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:self.iconImageView];
    
    self.titleLabel = [NSTextField labelWithString:@""];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.titleLabel.alignment = NSTextAlignmentCenter;
    [self.view addSubview:self.titleLabel];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]|" options:0 metrics:nil views:@{@"view": self.iconImageView}]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]" options:0 metrics:nil views:@{@"view": self.iconImageView}]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]|" options:0 metrics:nil views:@{@"view": self.titleLabel}]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[top][view]|" options:0 metrics:nil views:@{@"view": self.titleLabel, @"top": self.iconImageView}]];
}

@end

@interface ViewController () <NSCollectionViewDataSource,NSCollectionViewDelegate,QLPreviewPanelDataSource>
@property (weak,nonatomic) IBOutlet NSCollectionView *collectionView;

@property (strong,nonatomic) PreviewItem *previewItem;

@property (copy,nonatomic) NSArray<StringSection *> *sections;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.sections = [StringSection stringSectionsFromJSON];
    
    NSCollectionViewFlowLayout *layout = [[NSCollectionViewFlowLayout alloc] init];
    
    [layout setSectionInset:NSEdgeInsetsMake(8, 8, 8, 8)];
    [layout setMinimumLineSpacing:8.0];
    [layout setMinimumInteritemSpacing:8.0];
    [layout setEstimatedItemSize:NSMakeSize(kItemSize.width, kItemSize.height + 24)];
    [layout setHeaderReferenceSize:CGSizeMake(0, 24.0)];
    [layout setSectionHeadersPinToVisibleBounds:YES];
    
    [self.collectionView setCollectionViewLayout:layout];
    [self.collectionView registerClass:CollectionViewSectionHeader.class forSupplementaryViewOfKind:NSCollectionElementKindSectionHeader withIdentifier:NSStringFromClass(CollectionViewSectionHeader.class)];
    [self.collectionView registerClass:[CollectionViewItem class] forItemWithIdentifier:NSStringFromClass([CollectionViewItem class])];
    [self.collectionView setDataSource:self];
    [self.collectionView setDelegate:self];
    
    [NSNotificationCenter.defaultCenter addObserverForName:NSControlTintDidChangeNotification object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
        [self.collectionView reloadData];
    }];
}

- (NSInteger)numberOfSectionsInCollectionView:(NSCollectionView *)collectionView {
    return self.sections.count;
}
- (NSInteger)collectionView:(NSCollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.sections[section].items.count;
}
- (NSCollectionViewItem *)collectionView:(NSCollectionView *)collectionView itemForRepresentedObjectAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewItem *item = [collectionView makeItemWithIdentifier:NSStringFromClass([CollectionViewItem class]) forIndexPath:indexPath];
    
    item.iconImageView.image = [StringSection imageForFontName:self.sections[indexPath.section].fontName string:self.sections[indexPath.section].items[indexPath.item].string size:kItemSize];
    item.titleLabel.stringValue = self.sections[indexPath.section].items[indexPath.item].title;
    
    return item;
}
- (NSView *)collectionView:(NSCollectionView *)collectionView viewForSupplementaryElementOfKind:(NSCollectionViewSupplementaryElementKind)kind atIndexPath:(NSIndexPath *)indexPath {
    CollectionViewSectionHeader *retval = [collectionView makeSupplementaryViewOfKind:kind withIdentifier:NSStringFromClass(CollectionViewSectionHeader.class) forIndexPath:indexPath];
    
    retval.titleLabel.stringValue = self.sections[indexPath.section].title;
    
    return retval;
}

- (void)collectionView:(NSCollectionView *)collectionView didSelectItemsAtIndexPaths:(NSSet<NSIndexPath *> *)indexPaths {
    NSIndexPath *indexPath = indexPaths.anyObject;
    NSImage *image = [StringSection imageForFontName:self.sections[indexPath.section].fontName string:self.sections[indexPath.section].items[indexPath.item].string size:self.view.window.frame.size];
    NSData *data = [image TIFFRepresentation];
    NSURL *previewURL = [NSURL fileURLWithPath:[[NSTemporaryDirectory() stringByAppendingPathComponent:[[NSUUID UUID] UUIDString]] stringByAppendingPathExtension:@"tiff"]];
    
    [data writeToURL:previewURL options:NSDataWritingAtomic error:NULL];
    
    [self setPreviewItem:[[PreviewItem alloc] initWithURL:previewURL title:self.sections[indexPath.section].title]];
    
    [[QLPreviewPanel sharedPreviewPanel] makeKeyAndOrderFront:nil];
}

- (NSInteger)numberOfPreviewItemsInPreviewPanel:(QLPreviewPanel *)panel {
    return 1;
}
- (id<QLPreviewItem>)previewPanel:(QLPreviewPanel *)panel previewItemAtIndex:(NSInteger)index {
    return self.previewItem;
}

- (BOOL)acceptsPreviewPanelControl:(QLPreviewPanel *)panel {
    return YES;
}
- (void)beginPreviewPanelControl:(QLPreviewPanel *)panel {
    [panel setDataSource:self];
}
- (void)endPreviewPanelControl:(QLPreviewPanel *)panel {
    [panel setDataSource:nil];
}

@end
