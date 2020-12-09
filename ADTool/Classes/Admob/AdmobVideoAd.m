//
//  AdmobVideoAd.m
//  Advertising
//
//  Created by huang le on 2020/4/8.
//  Copyright © 2020 Lete. All rights reserved.
//

#import "AdmobVideoAd.h"

#import <GoogleMobileAds/GoogleMobileAds.h>

@interface AdmobVideoAd()<GADRewardedAdDelegate>

@property(nonatomic, strong) GADRewardedAd *rewardedAd;
@property(nonatomic,assign)BOOL earnReward;

@end

@implementation AdmobVideoAd

- (void)createAndLoadVideo{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"AdvertisingConf" ofType:@"plist"];
    NSDictionary *dict =[NSDictionary dictionaryWithContentsOfFile:path];
    NSString *RewardBasedVideoAdID = dict[@"Admob"][@"rewardedVideoID"];
    self.rewardedAd = [[GADRewardedAd alloc] initWithAdUnitID:RewardBasedVideoAdID];
    GADRequest *request = [GADRequest request];
    [self.rewardedAd loadRequest:request completionHandler:^(GADRequestError * _Nullable error) {
        if (error) {
            // Handle ad failed to load case.
        } else {
            // Ad successfully loaded.
        }
    }];
}

- (BOOL)show{
    if (self.rewardedAd.isReady) {
        [self.rewardedAd presentFromRootViewController:self.rootViewContrller delegate:self];
        return YES;
    } else {
        [self createAndLoadVideo];
        return NO;
    }
}

- (BOOL)show:(void(^)(BOOL earnReward))block{
    self.callback = block;
    self.earnReward = NO;
    if (self.rewardedAd.isReady) {
        [self.rewardedAd presentFromRootViewController:self.rootViewContrller delegate:self];
        return YES;
    } else {
        self.callback(NO);
        [self createAndLoadVideo];
        return NO;
    }
}

#pragma mark - GADRewardedAdDelegate

/// Tells the delegate that the user earned a reward.
- (void)rewardedAd:(nonnull GADRewardedAd *)rewardedAd userDidEarnReward:(nonnull GADAdReward *)reward{
    self.earnReward = YES;
}


/// Tells the delegate that the rewarded ad failed to present.
- (void)rewardedAd:(nonnull GADRewardedAd *)rewardedAd didFailToPresentWithError:(nonnull NSError *)error{
    if(self.callback){
        self.callback(NO);
    }
}

/// Tells the delegate that the rewarded ad was presented.
- (void)rewardedAdDidPresent:(nonnull GADRewardedAd *)rewardedAd{
    
}

/// Tells the delegate that the rewarded ad was dismissed.
- (void)rewardedAdDidDismiss:(nonnull GADRewardedAd *)rewardedAd{
    [self createAndLoadVideo];
    if(self.earnReward){
        if(self.callback){
            self.callback(YES);
        }
    }else{
        if(self.callback){
            self.callback(NO);
        }
    }
}


@end
