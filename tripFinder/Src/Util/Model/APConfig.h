//
//  APTripConfig.h
//  tripFinder
//
//  Created by Anson Ng on 3/13/16.
//  Copyright © 2016 Anson Ng. All rights reserved.
//

#import "APBaseJSONModel.h"

@interface APConfig : APBaseJSONModel
@property (strong, nonatomic) NSString <Optional> *apiUrl;
@end
