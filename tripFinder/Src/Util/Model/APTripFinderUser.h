//
//  APTripFinderUserJSONMoel.h
//  tripFinder
//
//  Created by Anson Ng on 3/13/16.
//  Copyright © 2016 Anson Ng. All rights reserved.
//

#import "APTripFinderBaseJSONModel.h"

typedef NS_ENUM(NSUInteger, APTripFinderUserGenderType) {

    APTripFinderUserGenderFemale = 0,
    APTripFinderUserGenderMale = 1,
};
@interface APTripFinderUser : APTripFinderBaseJSONModel

@property (strong, nonatomic) NSString  <Optional> *username;
@property (strong, nonatomic) NSString  <Optional> *nickname;
@property (strong, nonatomic) NSString <Optional> *desc;
@property (strong, nonatomic) NSString <Optional> *imageUrl;
@property (strong, nonatomic) NSString <Optional> *backgroundUrl;
@property (assign, nonatomic) APTripFinderUserGenderType gender;
@property (strong, nonatomic) NSString <Optional> *password;

@end