//
//  SBHYVideoAd.m
//  Advertising
//
//  Created by huang le on 2020/4/8.
//  Copyright © 2020 Lete. All rights reserved.
//

#import "SBHYVideoAd.h"

@implementation SBHYVideoAd

+ (instancetype)shareInstance{
    static SBHYVideoAd *single;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        single = [[super allocWithZone:NULL] init];
    });
    
    return single;
}

- (void)createAndLoadVideo{
    
}


- (BOOL)show{
    return NO;
}

- (BOOL)show:(void(^)(BOOL earnReward))block {
    return NO;
}

@end
