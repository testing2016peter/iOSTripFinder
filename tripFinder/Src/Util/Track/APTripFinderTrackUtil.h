//
//  APTripFinderTrackUtil.h
//  tripFinder
//
//  Created by Anson Ng on 3/13/16.
//  Copyright © 2016 Anson Ng. All rights reserved.
//

#import "APTripFinderTrackConstant.h"
@interface APTripFinderTrackUtil : NSObject
+ (void)startSession;
+ (void)logEvent:(NSString *)eventName withParameters:(NSDictionary *)parameters;
@end
