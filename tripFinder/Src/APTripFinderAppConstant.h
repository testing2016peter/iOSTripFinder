//
//  APTripFinderAppConstant.h
//  tripFinder
//
//  Created by Anson Ng on 3/13/16.
//  Copyright © 2016 Anson Ng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APTripFinderConfig.h"

#import <UIKit/UIKit.h>



typedef NS_ENUM(NSUInteger, APTripFinderEnv) {
    APTripFinderEnvBeta = 0,
    APTripFinderEnvProduction = 1,
};

extern NSString * const APTripFinderEnvBetaApiUrl;
extern NSString * const APTripFinderEnvBetaApiProductionUrl;




@interface AppConstantUtil : NSObject


+ (APTripFinderConfig *)config;

@end