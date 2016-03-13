//
//  APTripFinderCacheManager.h
//  tripFinder
//
//  Created by Anson Ng on 3/27/16.
//  Copyright © 2016 Anson Ng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APTripFinderCacheManager : NSObject

+ (instancetype)sharedInstance;

- (void)setDataWithKey:(NSString *)key data:(id)data cacheSecDuration:(NSInteger)cacheSecDuration;
- (id)getDataWithKey:(NSString *)key;

@end
