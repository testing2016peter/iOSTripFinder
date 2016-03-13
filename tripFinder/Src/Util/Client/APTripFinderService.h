//
//  APTripFinderService.h
//  tripFinder
//
//  Created by Anson Ng on 3/13/16.
//  Copyright © 2016 Anson Ng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APTripFinderModels.h"
#import "APTripFinderLocation.h"
#import "APTripFinderClient.h"

@interface APTripFinderService : NSObject

+ (instancetype )sharedInstance;

- (void)signUpUser:(APTripFinderUser *)user success:(APTripFinderClientSuccessBlock)success failure:(APTripFinderClientFailureBlock)failure;
- (void)signInUserName:(NSString *)username password:(NSString *)password success:(APTripFinderClientSuccessBlock)success failure:(APTripFinderClientFailureBlock)failure;
- (void)getUserName:(NSString *)username success:(APTripFinderClientSuccessBlock)success failure:(APTripFinderClientFailureBlock)failure;

- (void)updateUser:(APTripFinderUser *)user success:(APTripFinderClientSuccessBlock)success failure:(APTripFinderClientFailureBlock)failure;

- (void)updateUserHomeLocation:(APTripFinderLocation *)location success:(APTripFinderClientSuccessBlock)success failure:(APTripFinderClientFailureBlock)failure;

- (void)updateUserCurrentLocation:(APTripFinderLocation *)location success:(APTripFinderClientSuccessBlock)success failure:(APTripFinderClientFailureBlock)failure;


@end
