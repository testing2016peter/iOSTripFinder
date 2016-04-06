//
//  APSearchImagesCollectionViewCell.m
//  tripFinder
//
//  Created by Anson Ng on 4/5/16.
//  Copyright © 2016 Anson Ng. All rights reserved.
//

#import "APSearchListImagesCollectionViewCell.h"
#import "APImageCollectionViewCell.h"
#import "APNibSizeCalculator.h"
@interface APSearchListImagesCollectionViewCell ()

@property (strong, nonatomic) NSArray *images;

@end

@implementation APSearchListImagesCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setupView
{
    [self.collectionView registerNib:[UINib nibWithNibName:APImageCollectionViewCellIdentified bundle:nil] forCellWithReuseIdentifier:APImageCollectionViewCellIdentified];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;

    [self prepareForReuse];

}



- (void)prepareForReuse
{
    self.userImageView.image = nil;
    self.backgroundImageView.image = nil;
    [self setupImages:@[]];
}

- (void)setupImages:(NSArray *)images
{
    self.images = images;
    [self.collectionView reloadData];
}



#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    APImageCollectionViewCell *returnCell = [collectionView dequeueReusableCellWithReuseIdentifier:APImageCollectionViewCellIdentified forIndexPath:indexPath];
    if (indexPath.row < self.images.count) {
        returnCell.imageView.image = self.images[indexPath.row];
    }
    return returnCell;

}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize cellSize = CGSizeZero;
    cellSize.width = (CGRectGetWidth(self.collectionView.bounds) / 3) - 5.0f;
    cellSize.height =CGRectGetHeight(self.collectionView.bounds);


    return cellSize;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
}



@end
