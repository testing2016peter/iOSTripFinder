//
//  UserViewController.h
//  tripFinder
//
//  Created by Anson Ng on 3/13/16.
//  Copyright © 2016 Anson Ng. All rights reserved.
//

#import "APBaseViewController.h"
#import "APUser.h"

@interface APUserViewController : APBaseViewController

@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UIImageView *userBackgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;


- (instancetype) initWithUser:(APUser *)user;

@end