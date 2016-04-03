//
//  APTripFinderTrackUtil.m
//  tripFinder
//
//  Created by Anson Ng on 3/13/16.
//  Copyright © 2016 Anson Ng. All rights reserved.
//

#import "APTrackUtil.h"
#import "Flurry.h"
@implementation APTrackUtil
+ (void)startSession
{
    [Flurry startSession:APTripFinderApiKey];
}
+ (void)logEvent:(NSString *)eventName withParameters:(NSDictionary *)parameters
{
    [Flurry logEvent:eventName withParameters:parameters];
}
@end
