//
//  SBHYRewardedVideo.m
//  Advertising
//
//  Created by huang le on 2020/3/30.
//  Copyright © 2020 Lete. All rights reserved.
//

#import "SBHYRewardedVideo.h"

@implementation SBHYRewardedVideo

+ (instancetype)shareInstance{
    static SBHYRewardedVideo *single;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        single = [[super allocWithZone:NULL] init];
    });
    
    return single;
}


- (void)createAndLoadRewardedVideo{
    
}

- (BOOL)show:(void(^)(BOOL earnReward))block{
    return YES;
}

@end
