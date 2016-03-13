//
//  SignUpSuccessViewController.m
//  tripFinder
//
//  Created by Anson Ng on 3/27/16.
//  Copyright © 2016 Anson Ng. All rights reserved.
//

#import "SignUpSuccessViewController.h"

@interface SignUpSuccessViewController ()
@property (strong, nonatomic) APTripFinderUser *user;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@end

@implementation SignUpSuccessViewController


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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
