//
//  TripFinderBaseViewController.m
//  tripFinder
//
//  Created by Anson Ng on 3/13/16.
//  Copyright © 2016 Anson Ng. All rights reserved.
//

#import "APBaseViewController.h"

@interface APBaseViewController ()

@end

@implementation APBaseViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [APTrackUtil logEvent:[self screenName] withParameters:nil];
}

- (NSString *)screenName
{
    return NSStringFromClass([self class]);
}

@end
