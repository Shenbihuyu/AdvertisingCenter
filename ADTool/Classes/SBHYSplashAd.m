//
//  SBHYSplashAd.m
//  Advertising
//
//  Created by huang le on 2020/7/14.
//  Copyright © 2020 Lete. All rights reserved.
//

#import "SBHYSplashAd.h"

@implementation SBHYSplashAd

+ (instancetype)shareInstance{
    static SBHYSplashAd *single;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        single = [[super allocWithZone:NULL] init];
    });
    
    return single;
}

- (void)createAndLoad{
    
}


- (BOOL)show{
    return NO;
}

@end
