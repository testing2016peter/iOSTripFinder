//
//  APTripFinderService.m
//  tripFinder
//
//  Created by Anson Ng on 3/13/16.
//  Copyright © 2016 Anson Ng. All rights reserved.
//

#import "APTripFinderService.h"

@interface APTripFinderService ()
@property (strong, nonatomic) APTripFinderClient *client;
@end
@implementation APTripFinderService

+ (instancetype )sharedInstance
{
    static APTripFinderService *instance = nil;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        @synchronized(self) {
            instance = [[APTripFinderService alloc] init];
            instance.client = [APTripFinderClient sharedInstance];
        }
    });
    return instance;
}

- (void)signInUserName:(NSString *)username password:(NSString *)password success:(APTripFinderClientSuccessBlock)success failure:(APTripFinderClientFailureBlock)failure
{
    [self.client signInUserName:username password:password success:^(AFHTTPRequestOperation *operation, id response) {
        success(operation, response);
    } failure:^(AFHTTPRequestOperation *operation, NSError *err) {
        failure(operation, err);
    }];
}

- (void)signUpUser:(APTripFinderUser *)user success:(APTripFinderClientSuccessBlock)success failure:(APTripFinderClientFailureBlock)failure
{
    [self.client signUpUser:user success:^(AFHTTPRequestOperation *operation, id response) {
        success(operation, response);
    } failure:^(AFHTTPRequestOperation *operation, NSError *err) {
        failure(operation, err);
    }];

}

- (void)getUserName:(NSString *)username success:(APTripFinderClientSuccessBlock)success failure:(APTripFinderClientFailureBlock)failure
{
    [self.client getUserName:username success:^(AFHTTPRequestOperation *operation, id response) {
        APTripFinderUser *user = [[APTripFinderUser alloc] initWithDictionary:response error:nil];
        success(operation, user);
    } failure:^(AFHTTPRequestOperation *operation, NSError *err) {
        failure(operation, err);

    }];
}

- (void)updateUser:(APTripFinderUser *)user success:(APTripFinderClientSuccessBlock)success failure:(APTripFinderClientFailureBlock)failure
{
    [self.client updateUserWithDictionary:[user toDictionary] success:^(AFHTTPRequestOperation *operation, id response) {
        success(operation, user);
    } failure:^(AFHTTPRequestOperation *operation, NSError *err) {
        failure(operation, err);
    }];
}

- (void)updateUserHomeLocation:(APTripFinderLocation *)location success:(APTripFinderClientSuccessBlock)success failure:(APTripFinderClientFailureBlock)failure
{
    [self.client updateUserHomeLocation:location success:success failure:failure];
}

- (void)updateUserCurrentLocation:(APTripFinderLocation *)location success:(APTripFinderClientSuccessBlock)success failure:(APTripFinderClientFailureBlock)failure
{
    [self.client updateUserCurrentLocation:location success:success failure:failure];
}

@end
