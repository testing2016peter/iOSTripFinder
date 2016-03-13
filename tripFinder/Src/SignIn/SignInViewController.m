//
//  LoginViewController.m
//  tripFinder
//
//  Created by Anson Ng on 3/13/16.
//  Copyright © 2016 Anson Ng. All rights reserved.
//

#import "SignInViewController.h"
#import "APTripFinderService.h"
#import "UserViewController.h"
#import "SignUpNickNameViewController.h"
#import "APTripFinderLocationManager.h"
@interface SignInViewController ()

@end

@implementation SignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    APTripFinderLocationManager *manager = [APTripFinderLocationManager sharedInstance];
    [manager checkLocationServicesAndStartUpdatingLocation];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)tapSignInButton:(id)sender
{
    [[APTripFinderService sharedInstance] signInUserName:self.userNameLabel.text password:self.passwordLabel.text success:^(AFHTTPRequestOperation *operation, id response) {

        [[APTripFinderService sharedInstance] getUserName:@"me" success:^(AFHTTPRequestOperation *operation, id response) {
            UserViewController *vc = [[UserViewController alloc] initWithUser:response];
            [self presentViewController:vc animated:YES completion:nil];
        } failure:^(AFHTTPRequestOperation *operation, NSError *err) {
            NSLog(@"err:%@", err);
        }];

    } failure:^(AFHTTPRequestOperation *operation, NSError *err) {
        NSLog(@"err:%@", err);
    }];
    

}


- (IBAction)tapSignUpButton:(id)sender
{
    NSError *err;
    APTripFinderUser *user = [[APTripFinderUser alloc] initWithDictionary:@{} error:&err];
    user.username = self.userNameLabel.text;
    user.password = self.passwordLabel.text;

    SignUpNickNameViewController *signUpNickNameViewController = [[SignUpNickNameViewController alloc] initWithNewUser:user];
    [self.navigationController pushViewController:signUpNickNameViewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)screenName
{
    return @"sign_main_page";
}


@end
