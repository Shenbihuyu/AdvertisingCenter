//
//  SBHYBanner.m
//  Advertising
//
//  Created by huang le on 2020/3/30.
//  Copyright © 2020 Lete. All rights reserved.
//

#import "SBHYBanner.h"

@implementation SBHYBanner

+ (instancetype)shareInstance{
    static SBHYBanner *single;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        single = [[super allocWithZone:NULL] init];
    });
    
    return single;
}


-  (UIView *)refreshBanner{
    return nil;
}

- (void)removeBanner{
    
}

@end
