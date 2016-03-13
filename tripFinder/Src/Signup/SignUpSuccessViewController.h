//
//  SignUpSuccessViewController.h
//  tripFinder
//
//  Created by Anson Ng on 3/27/16.
//  Copyright © 2016 Anson Ng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APTripFinderService.h"
@interface SignUpSuccessViewController : UIViewController

- (instancetype)initWithNewUser:(APTripFinderUser *)user;

@end
