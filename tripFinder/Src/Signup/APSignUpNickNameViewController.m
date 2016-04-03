//
//  SignupNickNameViewController.m
//  tripFinder
//
//  Created by Anson Ng on 3/27/16.
//  Copyright © 2016 Anson Ng. All rights reserved.
//

#import "APSignUpNickNameViewController.h"
#import "APSignUpGenderViewController.h"
@interface APSignUpNickNameViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nickNameTextField;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (strong, nonatomic) APUser *user;
@end

@implementation APSignUpNickNameViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapNextButton:(id)sender
{
    self.user.nickname = self.nickNameTextField.text;
    APSignUpGenderViewController *signUpGenderViewController = [[APSignUpGenderViewController alloc] initWithNewUser:self.user];
    [self.navigationController pushViewController:signUpGenderViewController animated:YES];
}

@end