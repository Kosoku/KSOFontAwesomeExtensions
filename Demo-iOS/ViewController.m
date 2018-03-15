//
//  ViewController.m
//  Demo-iOS
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

#import <QuickLook/QuickLook.h>

static CGSize const kItemSize = {.width=64, .height=64};

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

@interface CollectionViewSectionHeader : UICollectionReusableView
@property (strong,nonatomic) UILabel *titleLabel;
@end

@implementation CollectionViewSectionHeader
- (instancetype)initWithFrame:(CGRect)frame {
    if (!(self = [super initWithFrame:frame]))
        return nil;
    
    self.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [self addSubview:_titleLabel];

    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.titleLabel.frame = CGRectMake(8.0, 0, CGRectGetWidth(self.bounds) - 16.0, CGRectGetHeight(self.bounds));
}
@end

@interface CollectionViewCell : UICollectionViewCell
@property (strong,nonatomic) UIImageView *imageView;
@property (strong,nonatomic) UILabel *titleLabel;
@end

@implementation CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (!(self = [super initWithFrame:frame]))
        return nil;
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    _imageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_imageView];
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_titleLabel];
    
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]|" options:0 metrics:nil views:@{@"view": _imageView}]];
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]" options:0 metrics:nil views:@{@"view": _imageView}]];
    
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]|" options:0 metrics:nil views:@{@"view": _titleLabel}]];
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[top][view]|" options:0 metrics:nil views:@{@"view": _titleLabel, @"top": _imageView}]];
    
    return self;
}

@end

@interface ViewController () <UICollectionViewDataSource,UICollectionViewDelegate,QLPreviewControllerDataSource>
@property (strong,nonatomic) UITextField *searchField;
@property (strong,nonatomic) UICollectionView *collectionView;

@property (strong,nonatomic) PreviewItem *previewItem;

@property (copy,nonatomic) NSArray<StringSection *> *sections;
@property (copy,nonatomic) NSArray<StringSection *> *filteredSections;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.sections = [StringSection stringSectionsFromJSON];
    self.filteredSections = self.sections;
    
    self.searchField = [[UITextField alloc] initWithFrame:CGRectZero];
    self.searchField.translatesAutoresizingMaskIntoConstraints = NO;
    self.searchField.borderStyle = UITextBorderStyleRoundedRect;
    self.searchField.placeholder = @"Search by hex";
    [self.searchField addTarget:self action:@selector(_searchFieldAction:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:self.searchField];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[view]-|" options:0 metrics:nil views:@{@"view": self.searchField}]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[top][view]" options:0 metrics:nil views:@{@"view": self.searchField, @"top": self.topLayoutGuide}]];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    [layout setSectionInset:UIEdgeInsetsMake(8, 8, 8, 8)];
    [layout setMinimumLineSpacing:8.0];
    [layout setMinimumInteritemSpacing:8.0];
    [layout setEstimatedItemSize:CGSizeMake(kItemSize.width, kItemSize.height + 24)];
    [layout setHeaderReferenceSize:CGSizeMake(0, 32.0)];
    [layout setSectionHeadersPinToVisibleBounds:YES];
    
    [self setCollectionView:[[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout]];
    [self.collectionView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.collectionView setBackgroundColor:[UIColor whiteColor]];
    [self.collectionView registerClass:CollectionViewSectionHeader.class forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass(CollectionViewSectionHeader.class)];
    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([CollectionViewCell class])];
    [self.collectionView setDataSource:self];
    [self.collectionView setDelegate:self];
    [self.view addSubview:self.collectionView];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]|" options:0 metrics:nil views:@{@"view": self.collectionView}]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[top]-[view][bottom]" options:0 metrics:nil views:@{@"view": self.collectionView, @"top": self.searchField, @"bottom": self.bottomLayoutGuide}]];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.filteredSections.count;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.filteredSections[section].items.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CollectionViewCell class]) forIndexPath:indexPath];
    NSString *string = self.filteredSections[indexPath.section].items[indexPath.row].string;
    
    cell.imageView.image = [StringSection imageForFontName:self.filteredSections[indexPath.section].fontName string:string size:kItemSize];
    cell.titleLabel.text = self.filteredSections[indexPath.section].items[indexPath.row].title;
    
    return cell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        CollectionViewSectionHeader *retval = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:NSStringFromClass(CollectionViewSectionHeader.class) forIndexPath:indexPath];
        
        retval.titleLabel.text = self.filteredSections[indexPath.section].title;
        
        return retval;
    }
    return nil;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    UIImage *image = [StringSection imageForFontName:self.filteredSections[indexPath.section].fontName string:self.filteredSections[indexPath.section].items[indexPath.row].string size:[UIScreen mainScreen].bounds.size];
    NSData *data = UIImagePNGRepresentation(image);
    NSURL *previewURL = [NSURL fileURLWithPath:[[NSTemporaryDirectory() stringByAppendingPathComponent:[[NSUUID UUID] UUIDString]] stringByAppendingPathExtension:@"png"]];
    
    [data writeToURL:previewURL options:NSDataWritingAtomic error:NULL];
    
    [self setPreviewItem:[[PreviewItem alloc] initWithURL:previewURL title:self.filteredSections[indexPath.section].title]];
    
    QLPreviewController *previewController = [[QLPreviewController alloc] init];
    
    [previewController setDataSource:self];
    
    [self presentViewController:previewController animated:YES completion:nil];
}

- (NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)controller {
    return 1;
}
- (id<QLPreviewItem>)previewController:(QLPreviewController *)controller previewItemAtIndex:(NSInteger)index {
    return self.previewItem;
}

- (IBAction)_searchFieldAction:(id)sender {
    if (self.searchField.text.length > 0) {
        NSMutableArray *sections = [[NSMutableArray alloc] init];
        
        for (StringSection *ss in self.sections) {
            NSMutableArray *items = [[NSMutableArray alloc] init];
            
            for (StringItem *si in ss.items) {
                if ([si.title rangeOfString:self.searchField.text options:NSCaseInsensitiveSearch|NSAnchoredSearch].length > 0) {
                    [items addObject:si];
                }
            }
            
            if (items.count > 0) {
                [sections addObject:[[StringSection alloc] initWithFontName:ss.fontName title:ss.title items:items]];
            }
        }
        
        self.filteredSections = sections;
    }
    else {
        self.filteredSections = self.sections;
    }
    
    [self.collectionView reloadData];
    [self.collectionView setContentOffset:CGPointZero];
}

@end
