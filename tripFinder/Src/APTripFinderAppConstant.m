//
//  APTripFinderAppConstant.m
//  tripFinder
//
//  Created by Anson Ng on 3/13/16.
//  Copyright © 2016 Anson Ng. All rights reserved.
//

#import "APTripFinderAppConstant.h"
#import "APTripFinderConfig.h"

NSString * const APTripFinderEnvBetaApiUrl = @"https://petertest2016.herokuapp.com";
NSString * const APTripFinderEnvBetaApiProductionUrl = @"https://petertest2016.herokuapp.com";

@implementation AppConstantUtil

+ (APTripFinderConfig *)config
{
    NSDictionary *dic = @{
                          @"apiUrl": APTripFinderEnvBetaApiUrl,

                          };
    APTripFinderConfig *config = [[APTripFinderConfig alloc] initWithDictionary:dic error:nil];
    return config;
}


@end
