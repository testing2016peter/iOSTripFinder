//
//  APTripFinderClient.h
//  tripFinder
//
//  Created by Anson Ng on 3/13/16.
//  Copyright © 2016 Anson Ng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import "APUser.h"
#import "APLocation.h"

typedef void(^APClientSuccessBlock)(AFHTTPRequestOperation *operation, id response);
typedef void(^APClientFailureBlock)(AFHTTPRequestOperation *operation, NSError *err);

@interface APClient : NSObject

+ (instancetype )sharedInstance;

- (void)signUpUser:(APUser *)user success:(APClientSuccessBlock)success failure:(APClientFailureBlock)failure;

- (void)signInUserName:(NSString *)username password:(NSString *)password success:(APClientSuccessBlock)success failure:(APClientFailureBlock)failure;

- (void)getUserName:(NSString *)username success:(APClientSuccessBlock)success failure:(APClientFailureBlock)failure;

- (void)updateUserWithDictionary:(NSDictionary *)params success:(APClientSuccessBlock)success failure:(APClientFailureBlock)failure;

- (void)updateUserHomeLocation:(APLocation *)location success:(APClientSuccessBlock)success failure:(APClientFailureBlock)failure;
- (void)updateUserCurrentLocation:(APLocation *)location success:(APClientSuccessBlock)success failure:(APClientFailureBlock)failure;
@end
