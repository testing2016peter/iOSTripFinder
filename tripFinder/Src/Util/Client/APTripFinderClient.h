//
//  APTripFinderClient.h
//  tripFinder
//
//  Created by Anson Ng on 3/13/16.
//  Copyright © 2016 Anson Ng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import "APTripFinderUser.h"
#import "APTripFinderLocation.h"

typedef void(^APTripFinderClientSuccessBlock)(AFHTTPRequestOperation *operation, id response);
typedef void(^APTripFinderClientFailureBlock)(AFHTTPRequestOperation *operation, NSError *err);

@interface APTripFinderClient : NSObject

+ (instancetype )sharedInstance;

- (void)signUpUser:(APTripFinderUser *)user success:(APTripFinderClientSuccessBlock)success failure:(APTripFinderClientFailureBlock)failure;

- (void)signInUserName:(NSString *)username password:(NSString *)password success:(APTripFinderClientSuccessBlock)success failure:(APTripFinderClientFailureBlock)failure;

- (void)getUserName:(NSString *)username success:(APTripFinderClientSuccessBlock)success failure:(APTripFinderClientFailureBlock)failure;

- (void)updateUserWithDictionary:(NSDictionary *)params success:(APTripFinderClientSuccessBlock)success failure:(APTripFinderClientFailureBlock)failure;

- (void)updateUserHomeLocation:(APTripFinderLocation *)location success:(APTripFinderClientSuccessBlock)success failure:(APTripFinderClientFailureBlock)failure;
- (void)updateUserCurrentLocation:(APTripFinderLocation *)location success:(APTripFinderClientSuccessBlock)success failure:(APTripFinderClientFailureBlock)failure;
@end
