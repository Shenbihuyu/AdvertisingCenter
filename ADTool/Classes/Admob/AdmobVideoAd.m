//
//  AdmobVideoAd.m
//  Advertising
//
//  Created by huang le on 2020/4/8.
//  Copyright © 2020 Lete. All rights reserved.
//

#import "AdmobVideoAd.h"

#import <GoogleMobileAds/GoogleMobileAds.h>

@interface AdmobVideoAd()<GADFullScreenContentDelegate>

@property(nonatomic, strong) GADRewardedAd *rewardedAd;
@property(nonatomic, assign)BOOL earnReward;

@end

/// 全屏广告
@implementation AdmobVideoAd

- (void)createAndLoadVideo{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"AdvertisingConf" ofType:@"plist"];
    NSDictionary *dict =[NSDictionary dictionaryWithContentsOfFile:path];
    NSString *RewardBasedVideoAdID = dict[@"Admob"][@"rewardedVideoID"];
    GADRequest *request = [GADRequest request];
    [GADRewardedAd loadWithAdUnitID:RewardBasedVideoAdID
                            request:request
                  completionHandler:^(GADRewardedAd * _Nullable rewardedAd, NSError * _Nullable error) {
        if (error == nil) {
            self.rewardedAd = rewardedAd;
            self.rewardedAd.fullScreenContentDelegate = self;
        }
    }];
}

- (BOOL)show{
    if (self.rewardedAd != nil) {
        [self.rewardedAd presentFromRootViewController:self.rootViewContrller userDidEarnRewardHandler:^{
            self.earnReward = YES;
        }];
        return YES;
    } else {
        [self createAndLoadVideo];
        return NO;
    }
}

- (BOOL)show:(void(^)(BOOL earnReward))block{
    self.callback = block;
    self.earnReward = NO;
    if (self.rewardedAd != nil) {
        [self.rewardedAd presentFromRootViewController:self.rootViewContrller userDidEarnRewardHandler:^{
            self.earnReward = YES;
        }];
        return YES;
    } else {
        self.callback(NO);
        [self createAndLoadVideo];
        return NO;
    }
}

#pragma mark - GADRewardedAdDelegate
/// Tells the delegate that an impression has been recorded for the ad.
- (void)adDidRecordImpression:(nonnull id<GADFullScreenPresentingAd>)ad {
    
}

/// Tells the delegate that the ad failed to present full screen content.
- (void)ad:(nonnull id<GADFullScreenPresentingAd>)ad didFailToPresentFullScreenContentWithError:(nonnull NSError *)error {
    [self createAndLoadVideo];
    self.callback(NO);
}

/// Tells the delegate that the ad presented full screen content.
- (void)adDidPresentFullScreenContent:(nonnull id<GADFullScreenPresentingAd>)ad {
//    [self createAndLoadRewardedVideo];
}

/// Tells the delegate that the ad dismissed full screen content.
- (void)adDidDismissFullScreenContent:(nonnull id<GADFullScreenPresentingAd>)ad {
    if(self.callback){
        self.callback(self.earnReward);
    }
    [self createAndLoadVideo];
}

@end
