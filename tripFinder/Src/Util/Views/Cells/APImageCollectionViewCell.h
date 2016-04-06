//
//  APImageCollectionViewCell.h
//  tripFinder
//
//  Created by Anson Ng on 4/5/16.
//  Copyright © 2016 Anson Ng. All rights reserved.
//

#import <UIKit/UIKit.h>
static NSString * const APImageCollectionViewCellIdentified = @"APImageCollectionViewCell";
@interface APImageCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
