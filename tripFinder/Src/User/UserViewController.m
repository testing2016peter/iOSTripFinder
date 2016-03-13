//
//  UserViewController.m
//  tripFinder
//
//  Created by Anson Ng on 3/13/16.
//  Copyright © 2016 Anson Ng. All rights reserved.
//

#import "UserViewController.h"
#import "APTripFinderUser.h"
#import "APTripFinderLocationManager.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface UserViewController () <APTripFinderLocationManagerDelegate>
@property (strong, nonatomic)APTripFinderUser *user;
@end

@implementation UserViewController

- (instancetype) initWithUser:(APTripFinderUser *)user
{
    self = [self init];
    if (self) {
        self.user = user;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.userName.text = self.user.username;
    [self.userImageView sd_setImageWithURL:[NSURL URLWithString:self.user.imageUrl]
                      placeholderImage:[UIImage imageNamed:@"img-no-user-image"]
                             completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                                 if (image) {
                                     self.userImageView.image = image;
                                 }
                             }];
    
    [self.userBackgroundImageView sd_setImageWithURL:[NSURL URLWithString:self.user.backgroundUrl]
                          placeholderImage:[UIImage imageNamed:@"img-no-image-place"]
                                 completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                                     if (image) {
                                         self.userBackgroundImageView.image = image;
                                     }
                                 }];

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)screenName
{
    return @"user_main_page";
}

@end
