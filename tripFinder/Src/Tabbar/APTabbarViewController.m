//
//  APTabbarViewController.m
//  tripFinder
//
//  Created by Anson Ng on 4/4/16.
//  Copyright © 2016 Anson Ng. All rights reserved.
//

#import "APTabbarViewController.h"
#import "UIImage+APResize.h"

@interface APTabbarViewController ()

@end

@implementation APTabbarViewController

- (void)addChildViewController:(UIViewController *)childController
{
    [super addChildViewController:childController];
    UIImage *image = [UIImage imageNamed:@"Icon-Activity-Feed-Filled"];
    image = [image vImageScaledImageWithSize:CGSizeMake(30.0f, 30.0f)];
    childController.tabBarItem.image = image;
}

@end
