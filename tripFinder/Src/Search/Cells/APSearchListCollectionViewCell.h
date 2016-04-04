//
//  APSearchListCollectionViewCell.h
//  tripFinder
//
//  Created by Anson Ng on 4/4/16.
//  Copyright © 2016 Anson Ng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APBaseCollectionViewCell.h"

static NSString * const APSearchListCollectionViewCellIdentified = @"APSearchListCollectionViewCell";


@interface APSearchListCollectionViewCell : APBaseCollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UIImageView *mapImageView;
@property (weak, nonatomic) IBOutlet UITextView *userTextView;


@end
