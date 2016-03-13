//
//  APTripFinderCacheData.h
//  tripFinder
//
//  Created by Anson Ng on 3/27/16.
//  Copyright © 2016 Anson Ng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APTripFinderCacheData : NSObject <NSSecureCoding>
{
    NSString *createTime;
    NSString *expireSec;
    id data;
}

- (instancetype)init;
- (instancetype)initWithExprieSec:(NSTimeInterval)inputExpireSec;

@property (readonly, nonatomic) NSString *createTime;
@property (strong, nonatomic) NSString *expireSec;
@property (strong, nonatomic) NSSet *dataClassNames;
@property (strong, nonatomic) id data;

@end