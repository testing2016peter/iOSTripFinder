//
//  APSearchListCollectionViewCell.m
//  tripFinder
//
//  Created by Anson Ng on 4/4/16.
//  Copyright © 2016 Anson Ng. All rights reserved.
//

#import "APSearchListCollectionViewCell.h"

@implementation APSearchListCollectionViewCell

- (void)setupView
{
    [self prepareForReuse];
}

- (void)prepareForReuse
{
    self.userImageView.image = [UIImage imageNamed:@"Image-test-person"];
    self.mapImageView.image = [UIImage imageNamed:@"Image-test-map"];
    self.userTextView.text = @"";
}

@end
