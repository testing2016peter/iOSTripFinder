//
//  APTripFinderLocationManager.h
//  tripFinder
//
//  Created by Anson Ng on 3/19/16.
//  Copyright © 2016 Anson Ng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "APTripFinderLocation.h"
@class APTripFinderLocationManager;

@protocol APTripFinderLocationManagerDelegate <NSObject>

@optional

- (void)apTripFinderLocationManager:(APTripFinderLocationManager *)manager didUpdateAPTripFinderLocation:(APTripFinderLocation *)apTripFinderLocation;

@end

@interface APTripFinderLocationManager : NSObject

@property (strong, nonatomic) id <APTripFinderLocationManagerDelegate> delegate;
+ (instancetype)sharedInstance;
- (void)checkLocationServicesAndStartUpdatingLocation;

@end
