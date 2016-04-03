//
//  APTripFinderService.m
//  tripFinder
//
//  Created by Anson Ng on 3/13/16.
//  Copyright © 2016 Anson Ng. All rights reserved.
//

#import "APTripFinderService.h"

@interface APTripFinderService ()
@property (strong, nonatomic) APClient *client;
@end
@implementation APTripFinderService

+ (instancetype )sharedInstance
{
    static APTripFinderService *instance = nil;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        @synchronized(self) {
            instance = [[APTripFinderService alloc] init];
            instance.client = [APClient sharedInstance];
        }
    });
    return instance;
}

- (void)signInUserName:(NSString *)username password:(NSString *)password success:(APClientSuccessBlock)success failure:(APClientFailureBlock)failure
{
    [self.client signInUserName:username password:password success:^(AFHTTPRequestOperation *operation, id response) {
        success(operation, response);
    } failure:^(AFHTTPRequestOperation *operation, NSError *err) {
        failure(operation, err);
    }];
}

- (void)signUpUser:(APUser *)user success:(APClientSuccessBlock)success failure:(APClientFailureBlock)failure
{
    [self.client signUpUser:user success:^(AFHTTPRequestOperation *operation, id response) {
        success(operation, response);
    } failure:^(AFHTTPRequestOperation *operation, NSError *err) {
        failure(operation, err);
    }];

}

- (void)getUserName:(NSString *)username success:(APClientSuccessBlock)success failure:(APClientFailureBlock)failure
{
    [self.client getUserName:username success:^(AFHTTPRequestOperation *operation, id response) {
        APUser *user = [[APUser alloc] initWithDictionary:response error:nil];
        success(operation, user);
    } failure:^(AFHTTPRequestOperation *operation, NSError *err) {
        failure(operation, err);

    }];
}

- (void)updateUser:(APUser *)user success:(APClientSuccessBlock)success failure:(APClientFailureBlock)failure
{
    [self.client updateUserWithDictionary:[user toDictionary] success:^(AFHTTPRequestOperation *operation, id response) {
        success(operation, user);
    } failure:^(AFHTTPRequestOperation *operation, NSError *err) {
        failure(operation, err);
    }];
}

- (void)updateUserHomeLocation:(APLocation *)location success:(APClientSuccessBlock)success failure:(APClientFailureBlock)failure
{
    [self.client updateUserHomeLocation:location success:success failure:failure];
}

- (void)updateUserCurrentLocation:(APLocation *)location success:(APClientSuccessBlock)success failure:(APClientFailureBlock)failure
{
    [self.client updateUserCurrentLocation:location success:success failure:failure];
}

@end
