//
//  APTripFinderLocation.h
//  tripFinder
//
//  Created by Anson Ng on 3/19/16.
//  Copyright © 2016 Anson Ng. All rights reserved.
//

#import "APTripFinderBaseJSONModel.h"

@interface APTripFinderLocation : APTripFinderBaseJSONModel

@property (strong, nonatomic) NSString <Optional> *longtitude;
@property (strong, nonatomic) NSString <Optional> *latitude;
@property (strong, nonatomic) NSString <Optional> *country;
@property (strong, nonatomic) NSString <Optional> *state;
@property (strong, nonatomic) NSString <Optional> *city;
@property (strong, nonatomic) NSString <Optional> *postcode;

@end
