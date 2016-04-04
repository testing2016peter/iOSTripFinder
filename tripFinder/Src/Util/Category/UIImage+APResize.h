//
//  UIImage+APResize.h
//  tripFinder
//
//  Created by Anson Ng on 4/4/16.
//  Copyright © 2016 Anson Ng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (APResize)

- (UIImage *)vImageScaledImageWithSize:(CGSize)destSize;
- (UIImage *)vImageScaledImageWithSize:(CGSize)destSize contentMode:(UIViewContentMode)contentMode;

@end
