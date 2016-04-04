//
//  SearchListViewController.m
//  tripFinder
//
//  Created by Anson Ng on 3/27/16.
//  Copyright © 2016 Anson Ng. All rights reserved.
//

#import "APSearchListViewController.h"
#import "APSearchListCollectionViewCell.h"
#import "APNibSizeCalculator.h"
@interface APSearchListViewController () <UICollectionViewDelegate, UICollectionViewDataSource>


@end

@implementation APSearchListViewController

- (void)setupView
{
    [self setupCollectionView];
}

- (void)setupCollectionView
{

    [self.collectionView registerNib:[UINib nibWithNibName:APSearchListCollectionViewCellIdentified bundle:nil] forCellWithReuseIdentifier:APSearchListCollectionViewCellIdentified];


}


#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    APSearchListCollectionViewCell *returnCell = [collectionView dequeueReusableCellWithReuseIdentifier:APSearchListCollectionViewCellIdentified forIndexPath:indexPath];

    returnCell.userTextView.text = @"hihihihi";
    return returnCell;

}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize cellSize = CGSizeZero;
    cellSize = [[APNibSizeCalculator sharedInstance] sizeForNibNamed:APSearchListCollectionViewCellIdentified withstyle:APNibFixedHeightScaling];
    cellSize.width = cellSize.width - (2*16.0f);
    return cellSize;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
}


@end
