//
//  ViewController.m
//  Demo-tvOS
//
//  Created by William Towe on 4/4/17.
//  Copyright © 2021 Kosoku Interactive, LLC. All rights reserved.
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

#import "ViewController.h"
#import "StringSection.h"

#import <KSOFontAwesomeExtensions/KSOFontAwesomeExtensions.h>

static CGSize const kItemSize = {.width=128, .height=128};

@interface CollectionViewCell : UICollectionViewCell
@property (strong,nonatomic) UIImageView *imageView;
@end

@implementation CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (!(self = [super initWithFrame:frame]))
        return nil;
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [_imageView setContentMode:UIViewContentModeCenter];
    [self.contentView addSubview:_imageView];
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.imageView setFrame:self.contentView.bounds];
}

@end

@interface ViewController () <UICollectionViewDataSource,UICollectionViewDelegate>
@property (strong,nonatomic) UICollectionView *collectionView;

@property (copy,nonatomic) NSArray<StringSection *> *sections;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.sections = [StringSection stringSectionsFromJSON];
    
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

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.sections.count;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.sections[section].items.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CollectionViewCell class]) forIndexPath:indexPath];
    
    cell.imageView.image = [StringSection imageForFontName:self.sections[indexPath.section].fontName string:self.sections[indexPath.section].items[indexPath.row].string size:kItemSize];
    
    return cell;
}

@end
