//
//  LoginViewController.m
//  tripFinder
//
//  Created by Anson Ng on 3/13/16.
//  Copyright © 2016 Anson Ng. All rights reserved.
//

#import "APSignInViewController.h"
#import "APTripFinderService.h"
#import "APUserViewController.h"
#import "APSignUpNickNameViewController.h"
#import "APLocationManager.h"
@interface APSignInViewController ()

@end

@implementation APSignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    APLocationManager *manager = [APLocationManager sharedInstance];
    [manager checkLocationServicesAndStartUpdatingLocation];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)tapSignInButton:(id)sender
{
    [[APTripFinderService sharedInstance] signInUserName:self.userNameLabel.text password:self.passwordLabel.text success:^(AFHTTPRequestOperation *operation, id response) {

        [[APTripFinderService sharedInstance] getUserName:@"me" success:^(AFHTTPRequestOperation *operation, id response) {
            APUserViewController *vc = [[APUserViewController alloc] initWithUser:response];
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
    APUser *user = [[APUser alloc] initWithDictionary:@{} error:&err];
    user.username = self.userNameLabel.text;
    user.password = self.passwordLabel.text;

    APSignUpNickNameViewController *signUpNickNameViewController = [[APSignUpNickNameViewController alloc] initWithNewUser:user];
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
