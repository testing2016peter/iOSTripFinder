//
//  SignUpSuccessViewController.m
//  tripFinder
//
//  Created by Anson Ng on 3/27/16.
//  Copyright © 2016 Anson Ng. All rights reserved.
//

#import "APSignUpSuccessViewController.h"

@interface APSignUpSuccessViewController ()
@property (strong, nonatomic) APUser *user;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@end

@implementation APSignUpSuccessViewController


- (instancetype)initWithNewUser:(APUser *)user
{
    self  = [super init];
    if (self) {
        self.user = user;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[APTripFinderService sharedInstance] signUpUser:self.user success:^(AFHTTPRequestOperation *operation, id response) {
        NSLog(@"success");
        self.statusLabel.text = @"success";
    } failure:^(AFHTTPRequestOperation *operation, NSError *err) {
        NSLog(@"err:%@", err);
        self.statusLabel.text = @"fail";

    }];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
