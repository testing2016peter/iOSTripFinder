//
//  APTripFinderCacheManager.m
//  tripFinder
//
//  Created by Anson Ng on 3/27/16.
//  Copyright © 2016 Anson Ng. All rights reserved.
//

#import "APTripFinderCacheManager.h"
#import "APTripFinderCacheData.h"


typedef NS_ENUM(NSUInteger, DATA_SAVE_FOR_TYPE) {
    DATA_SAVE_FOR_YID = 0,
    DATA_SAVE_FOR_DEVICE,
};

@interface APTripFinderCacheManager()
@property (strong, nonatomic) NSUserDefaults *userDefaults;
@property (strong, nonatomic) NSString *tutorialVersion;

@end

@implementation APTripFinderCacheManager

+ (instancetype)sharedInstance
{
    static APTripFinderCacheManager *instance = nil;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        @synchronized(self) {
            instance = [[APTripFinderCacheManager alloc]init];
        }
    });
    return instance;
}

- (instancetype)init
{
    self.userDefaults = [NSUserDefaults standardUserDefaults];
    return self;
}

- (void)setDataWithKey:(NSString *)key data:(id)data cacheSecDuration:(NSInteger)cacheSecDuration
{
    [self setDataWithKey:key dataType:DATA_SAVE_FOR_YID data:data cacheSecDuration:cacheSecDuration];
}

- (void)removeDataWithKey:(NSString *)key
{
    [self.userDefaults removeObjectForKey:key];
}

- (void)setCacheDataByDeviceWithKey:(NSString *)key data:(id)data cacheSecDuration:(NSInteger)cacheSecDuration
{
    [self setDataWithKey:key dataType:DATA_SAVE_FOR_DEVICE data:data cacheSecDuration:cacheSecDuration];
}



- (void)setDataWithKey:(NSString *)key dataType:(DATA_SAVE_FOR_TYPE)dataType data:(id)data cacheSecDuration:(NSInteger)cacheSecDuration
{
    if (data == nil) {
        return;
    }

    APTripFinderCacheData *cacheData = [[APTripFinderCacheData alloc]initWithExprieSec:cacheSecDuration];
    cacheData.data = data;
    NSData *archiverCacheData = [NSKeyedArchiver archivedDataWithRootObject:cacheData];
    NSMutableData *mutableData = [[NSMutableData alloc] init];

    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:mutableData];
    archiver.requiresSecureCoding = YES;
    [archiver encodeObject:cacheData forKey:[[NSBundle mainBundle] bundleIdentifier]];
    [archiver finishEncoding];
    [APTripFinderCacheManager setToKeyLists:key];

    [self.userDefaults setObject:mutableData forKey:key];
    [self.userDefaults synchronize];
}

- (id)getDataWithKey:(NSString *)key
{
    id returnData = nil;
    @try {
        if (key && [self.userDefaults objectForKey:key]) {

            NSMutableData *mutableData = [self.userDefaults objectForKey:key];
            NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:mutableData];
            unarchiver.requiresSecureCoding = YES;
            APTripFinderCacheData *cacheData  =  (APTripFinderCacheData *) [unarchiver decodeObjectOfClass:[APTripFinderCacheData class] forKey:[[NSBundle mainBundle] bundleIdentifier]];
            [unarchiver finishDecoding];
            NSTimeInterval currentTime = [[NSDate date] timeIntervalSince1970];
            NSTimeInterval createTime = [cacheData.createTime doubleValue];
            NSTimeInterval expireSec = [cacheData.expireSec doubleValue];

            if (currentTime <= (createTime + expireSec)) {
                returnData = cacheData.data;
            } else {
                [self.userDefaults removeObjectForKey:key];
            }
        }
    }
    @catch (NSException *exception) {
        NSLog(@"exception:%@", exception);
    }
    return returnData;
}

+ (void)setToKeyLists:(NSString *)key
{
    NSString *keysName = @"dataKeys";
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *keys = [[NSMutableArray alloc]initWithArray:[[APTripFinderCacheManager sharedInstance] getDataWithKey:keysName]];
    if (![keys containsObject:key]) {
        [keys addObject:key];
        [userDefaults setObject:[keys copy] forKey:keysName];
    }
}

@end
