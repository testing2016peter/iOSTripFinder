//
//  APTripFinderLocationManager.h
//  tripFinder
//
//  Created by Anson Ng on 3/19/16.
//  Copyright © 2016 Anson Ng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "APLocation.h"
@class APLocationManager;

@protocol APLocationManagerDelegate <NSObject>

@optional

- (void)apLocationManager:(APLocationManager *)manager didUpdateAPTripFinderLocation:(APLocation *)apTripFinderLocation;

@end

@interface APLocationManager : NSObject

@property (strong, nonatomic) id <APLocationManagerDelegate> delegate;
+ (instancetype)sharedInstance;
- (void)checkLocationServicesAndStartUpdatingLocation;

@end
