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

@interface CollectionViewCell : UICollectionViewCell
@property (assign,nonatomic) KSOFontAwesomeIcon icon;
@property (strong,nonatomic) UIImageView *imageView;
@end

@implementation CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (!(self = [super initWithFrame:frame]))
        return nil;
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:_imageView];
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.imageView setFrame:self.contentView.bounds];
}

- (void)setIcon:(KSOFontAwesomeIcon)icon {
    _icon = icon;
    
    [self.imageView setImage:[UIImage KSO_fontAwesomeImageWithIcon:self.icon size:kItemSize]];
}

@end

@interface ViewController () <UICollectionViewDataSource,UICollectionViewDelegate,QLPreviewControllerDataSource>
@property (strong,nonatomic) UICollectionView *collectionView;

@property (strong,nonatomic) PreviewItem *previewItem;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    [layout setSectionInset:UIEdgeInsetsMake(8, 8, 0, 8)];
    [layout setMinimumLineSpacing:8.0];
    [layout setMinimumInteritemSpacing:8.0];
    [layout setItemSize:kItemSize];
    
    [self setCollectionView:[[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout]];
    [self.collectionView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.collectionView setBackgroundColor:[UIColor whiteColor]];
    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([CollectionViewCell class])];
    [self.collectionView setDataSource:self];
    [self.collectionView setDelegate:self];
    [self.view addSubview:self.collectionView];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]|" options:0 metrics:nil views:@{@"view": self.collectionView}]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[top][view][bottom]" options:0 metrics:nil views:@{@"view": self.collectionView, @"top": self.topLayoutGuide, @"bottom": self.bottomLayoutGuide}]];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return KSO_FONT_AWESOME_ICON_TOTAL_ICONS;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CollectionViewCell class]) forIndexPath:indexPath];
    
    [cell setIcon:(KSOFontAwesomeIcon)indexPath.row];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    UIImage *image = [UIImage KSO_fontAwesomeImageWithIcon:(KSOFontAwesomeIcon)indexPath.row foregroundColor:self.collectionView.tintColor size:[UIScreen mainScreen].bounds.size];
    NSData *data = UIImagePNGRepresentation(image);
    NSURL *previewURL = [NSURL fileURLWithPath:[[NSTemporaryDirectory() stringByAppendingPathComponent:[[NSUUID UUID] UUIDString]] stringByAppendingPathExtension:@"png"]];
    
    [data writeToURL:previewURL options:NSDataWritingAtomic error:NULL];
    
    [self setPreviewItem:[[PreviewItem alloc] initWithURL:previewURL title:[NSString KSO_fontAwesomeIdentifierForIcon:(KSOFontAwesomeIcon)indexPath.row]]];
    
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

@end
