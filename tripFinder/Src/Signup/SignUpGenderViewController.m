//
//  SignupgenderViewController.m
//  tripFinder
//
//  Created by Anson Ng on 3/27/16.
//  Copyright © 2016 Anson Ng. All rights reserved.
//

#import "SignUpGenderViewController.h"
#import "SignUpSuccessViewController.h"

@interface SignUpGenderViewController ()
@property (weak, nonatomic) IBOutlet UIButton *maleButton;
@property (weak, nonatomic) IBOutlet UIButton *femaleButton;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (strong, nonatomic) APTripFinderUser *user;

@end

@implementation SignUpGenderViewController

- (instancetype)initWithNewUser:(APTripFinderUser *)user
{
    self  = [super init];
    if (self) {
        self.user = user;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)tapMaleButton:(id)sender
{
    self.maleButton.selected = YES;
    self.femaleButton.selected = NO;

    self.user.gender = APTripFinderUserGenderMale;
}

- (IBAction)tapFemaleButton:(id)sender
{
    self.maleButton.selected = NO;
    self.femaleButton.selected = YES;
    self.user.gender = APTripFinderUserGenderFemale;
}

- (IBAction)tapNextButton:(id)sender
{

    NSLog(@"user:%@", self.user);
    SignUpSuccessViewController  *vc = [[SignUpSuccessViewController alloc] initWithNewUser:self.user];
    [self.navigationController pushViewController:vc
                                         animated:YES];
    
}

@end