//
//  APTripFinderLocationManager.m
//  tripFinder
//
//  Created by Anson Ng on 3/19/16.
//  Copyright © 2016 Anson Ng. All rights reserved.
//

#import "APTripFinderLocationManager.h"


@interface APTripFinderLocationManager () <CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLGeocoder *geocoder;
@end
@implementation APTripFinderLocationManager

+ (instancetype)sharedInstance
{
    static APTripFinderLocationManager *instance = nil;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        @synchronized(self) {
            instance = [[APTripFinderLocationManager alloc] init];
        }
    });

    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        self.geocoder = [[CLGeocoder alloc] init];
    }

    return self;
}

- (void)checkLocationServicesAndStartUpdatingLocation
{
    CLAuthorizationStatus authorizationStatus = [CLLocationManager authorizationStatus];
    if (![CLLocationManager locationServicesEnabled] || authorizationStatus == kCLAuthorizationStatusDenied) {
        return;
    }

    if (authorizationStatus == kCLAuthorizationStatusNotDetermined ||
        authorizationStatus == kCLAuthorizationStatusAuthorizedWhenInUse) {
        [self.locationManager requestWhenInUseAuthorization];
        [self.locationManager startUpdatingLocation];
    }
}


#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    [self.locationManager stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    CLLocation *currentLocation = [locations lastObject];

    __weak typeof(self) weakSelf = self;
    [self.geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {

        CLPlacemark *placemark = [placemarks lastObject];
        if (!error && placemark) {
            [weakSelf.locationManager stopUpdatingLocation];
            if ([weakSelf.delegate respondsToSelector:@selector(apTripFinderLocationManager:didUpdateAPTripFinderLocation:)]) {
                APTripFinderLocation *apLocation = [[APTripFinderLocation alloc] init];
                apLocation.longtitude = [[NSString alloc] initWithFormat:@"%f", placemark.location.coordinate.longitude ];
                apLocation.latitude = [[NSString alloc] initWithFormat:@"%f", placemark.location.coordinate.latitude ];
                apLocation.country = placemark.country;
                apLocation.state= placemark.administrativeArea;
                apLocation.city = placemark.subAdministrativeArea;
                apLocation.postcode = placemark.postalCode;
                [weakSelf.delegate apTripFinderLocationManager:weakSelf didUpdateAPTripFinderLocation:apLocation];
            }
        }
    }];
}

@end
