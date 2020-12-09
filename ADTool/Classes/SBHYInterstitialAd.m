//
//  SBHYInterstitialAd.m
//  Advertising
//
//  Created by huang le on 2020/3/30.
//  Copyright © 2020 Lete. All rights reserved.
//

#import "SBHYInterstitialAd.h"


@implementation SBHYInterstitialAd

+ (instancetype)shareInstance{
    static SBHYInterstitialAd *single;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        single = [[super allocWithZone:NULL] init];
    });
    
    return single;
}


- (void)createAndLoadInterstitial{
    
}

- (void)show{
    
}

@end
