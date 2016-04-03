//
//  APTripFinderClient.m
//  tripFinder
//
//  Created by Anson Ng on 3/13/16.
//  Copyright © 2016 Anson Ng. All rights reserved.
//

#import "APClient.h"
#import "APTripFinderAppConstant.h"
#import "APConfig.h"

@interface APClient ()

@property (strong, nonatomic) APConfig *config;

@end

@implementation APClient
+ (instancetype )sharedInstance
{
    static APClient *instance = nil;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        @synchronized(self) {
            instance = [[APClient alloc] init];
            instance.config = [AppConstantUtil config];

        }
    });

    return instance;
}

- (void)signUpUser:(APUser *)user success:(APClientSuccessBlock)success failure:(APClientFailureBlock)failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    NSString *host = self.config.apiUrl;
    NSString *urlString = [[NSString alloc] initWithFormat:@"%@%@" ,host,@"/v1/users/signup"];;
    [manager POST:urlString parameters:[user toDictionary] success:success failure:failure];
}

- (void)signInUserName:(NSString *)username password:(NSString *)password success:(APClientSuccessBlock)success failure:(APClientFailureBlock)failure
{
    NSString *host = self.config.apiUrl;
    NSString *urlString = [[NSString alloc] initWithFormat:@"%@%@" ,host,@"/v1/users/login"];

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *params = @{@"username": username,
                             @"password": password};
    [manager POST:urlString parameters:params success:success failure:failure];
}

- (void)getUserName:(NSString *)username success:(APClientSuccessBlock)success failure:(APClientFailureBlock)failure
{
    NSString *host = self.config.apiUrl;
    NSString *urlString = [[NSString alloc] initWithFormat:@"%@%@%@" ,host,@"/v1/users/", username];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:urlString parameters:nil success:success failure:failure];
}

- (void)updateUserWithDictionary:(NSDictionary *)params success:(APClientSuccessBlock)success failure:(APClientFailureBlock)failure
{
    NSString *host = self.config.apiUrl;
    NSString *urlString = [[NSString alloc] initWithFormat:@"%@%@" ,host,@"/v1/users/me"];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:urlString parameters:params success:success failure:failure];
}

- (void)updateUserHomeLocation:(APLocation *)location success:(APClientSuccessBlock)success failure:(APClientFailureBlock)failure
{
    NSString *path =  @"/v1/users/me/location/home";
    [self updateUserLocationWithPath:path location:location success:success failure:failure];
}

- (void)updateUserCurrentLocation:(APLocation *)location success:(APClientSuccessBlock)success failure:(APClientFailureBlock)failure
{
    NSString *path =  @"/v1/users/me/location/current";
    [self updateUserLocationWithPath:path location:location success:success failure:failure];
}

- (void)updateUserLocationWithPath:(NSString *)path location:(APLocation *)location success:(APClientSuccessBlock)success failure:(APClientFailureBlock)failure
{
    NSString *host = self.config.apiUrl;
    NSString *urlString = [[NSString alloc] initWithFormat:@"%@%@" ,host, path];

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager PUT:urlString parameters:[location toDictionary] success:success failure:failure];
}
@end
