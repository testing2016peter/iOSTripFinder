//
//  TripFinderBaseViewController.m
//  tripFinder
//
//  Created by Anson Ng on 3/13/16.
//  Copyright © 2016 Anson Ng. All rights reserved.
//

#import "TripFinderBaseViewController.h"

@interface TripFinderBaseViewController ()

@end

@implementation TripFinderBaseViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [APTripFinderTrackUtil logEvent:[self screenName] withParameters:nil];
}

- (NSString *)screenName
{
    return NSStringFromClass([self class]);
}

@end
