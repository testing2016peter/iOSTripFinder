//
//  SignupNickNameViewController.h
//  tripFinder
//
//  Created by Anson Ng on 3/27/16.
//  Copyright © 2016 Anson Ng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APTripFinderUser.h"
#import "TripFinderBaseViewController.h"
@interface SignUpNickNameViewController : TripFinderBaseViewController
- (instancetype)initWithNewUser:(APTripFinderUser *)user;
@end
