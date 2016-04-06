//
//  APSearchImagesCollectionViewCell.h
//  tripFinder
//
//  Created by Anson Ng on 4/5/16.
//  Copyright © 2016 Anson Ng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APBaseCollectionViewCell.h"
static NSString * const APSearchListImagesCollectionViewCellIdentified = @"APSearchListImagesCollectionViewCell";
@interface APSearchListImagesCollectionViewCell : APBaseCollectionViewCell <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
- (void)setupImages:(NSArray *)images;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@end