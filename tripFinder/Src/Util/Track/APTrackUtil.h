//
//  APTripFinderTrackUtil.h
//  tripFinder
//
//  Created by Anson Ng on 3/13/16.
//  Copyright © 2016 Anson Ng. All rights reserved.
//

#import "APTrackConstant.h"
@interface APTrackUtil : NSObject
+ (void)startSession;
+ (void)logEvent:(NSString *)eventName withParameters:(NSDictionary *)parameters;
@end
