//
//  APTripFinderClient.m
//  tripFinder
//
//  Created by Anson Ng on 3/13/16.
//  Copyright © 2016 Anson Ng. All rights reserved.
//

#import "APTripFinderClient.h"
#import "APTripFinderAppConstant.h"
#import "APTripFinderConfig.h"

@interface APTripFinderClient ()

@property (strong, nonatomic) APTripFinderConfig *config;

@end

@implementation APTripFinderClient
+ (instancetype )sharedInstance
{
    static APTripFinderClient *instance = nil;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        @synchronized(self) {
            instance = [[APTripFinderClient alloc] init];
            instance.config = [AppConstantUtil config];

        }
    });

    return instance;
}

- (void)signUpUser:(APTripFinderUser *)user success:(APTripFinderClientSuccessBlock)success failure:(APTripFinderClientFailureBlock)failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    NSString *host = self.config.apiUrl;
    NSString *urlString = [[NSString alloc] initWithFormat:@"%@%@" ,host,@"/v1/users/signup"];;
    [manager POST:urlString parameters:[user toDictionary] success:success failure:failure];
}

- (void)signInUserName:(NSString *)username password:(NSString *)password success:(APTripFinderClientSuccessBlock)success failure:(APTripFinderClientFailureBlock)failure
{
    NSString *host = self.config.apiUrl;
    NSString *urlString = [[NSString alloc] initWithFormat:@"%@%@" ,host,@"/v1/users/login"];

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *params = @{@"username": username,
                             @"password": password};
    [manager POST:urlString parameters:params success:success failure:failure];
}

- (void)getUserName:(NSString *)username success:(APTripFinderClientSuccessBlock)success failure:(APTripFinderClientFailureBlock)failure
{
    NSString *host = self.config.apiUrl;
    NSString *urlString = [[NSString alloc] initWithFormat:@"%@%@%@" ,host,@"/v1/users/", username];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:urlString parameters:nil success:success failure:failure];
}

- (void)updateUserWithDictionary:(NSDictionary *)params success:(APTripFinderClientSuccessBlock)success failure:(APTripFinderClientFailureBlock)failure
{
    NSString *host = self.config.apiUrl;
    NSString *urlString = [[NSString alloc] initWithFormat:@"%@%@" ,host,@"/v1/users/me"];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:urlString parameters:params success:success failure:failure];
}

- (void)updateUserHomeLocation:(APTripFinderLocation *)location success:(APTripFinderClientSuccessBlock)success failure:(APTripFinderClientFailureBlock)failure
{
    NSString *path =  @"/v1/users/me/location/home";
    [self updateUserLocationWithPath:path location:location success:success failure:failure];
}

- (void)updateUserCurrentLocation:(APTripFinderLocation *)location success:(APTripFinderClientSuccessBlock)success failure:(APTripFinderClientFailureBlock)failure
{
    NSString *path =  @"/v1/users/me/location/current";
    [self updateUserLocationWithPath:path location:location success:success failure:failure];
}

- (void)updateUserLocationWithPath:(NSString *)path location:(APTripFinderLocation *)location success:(APTripFinderClientSuccessBlock)success failure:(APTripFinderClientFailureBlock)failure
{
    NSString *host = self.config.apiUrl;
    NSString *urlString = [[NSString alloc] initWithFormat:@"%@%@" ,host, path];

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager PUT:urlString parameters:[location toDictionary] success:success failure:failure];
}
@end
