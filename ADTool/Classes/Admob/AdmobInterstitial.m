//
//  AdmobInterstitial.m
//  Advertising
//
//  Created by huang le on 2020/3/30.
//  Copyright © 2020 Lete. All rights reserved.
//

#import "AdmobInterstitial.h"
#import <GoogleMobileAds/GoogleMobileAds.h>

@interface AdmobInterstitial()<GADNativeAdDelegate, GADFullScreenContentDelegate>

@property (nonatomic, strong) GADInterstitialAd *interstitialAd;

@end

/// 插屏广告
@implementation AdmobInterstitial

- (void)createAndLoadInterstitial{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"AdvertisingConf" ofType:@"plist"];
    NSDictionary *dict =[NSDictionary dictionaryWithContentsOfFile:path];
    NSString *AdmobInterstitialID = dict[@"Admob"][@"interstitialID"];
    [GADInterstitialAd loadWithAdUnitID:AdmobInterstitialID
                                request:[GADRequest request]
                      completionHandler:^(GADInterstitialAd * _Nullable interstitialAd, NSError * _Nullable error) {
        self.interstitialAd = interstitialAd;
        self.interstitialAd.fullScreenContentDelegate = self;
    }];
}

- (void)show{
    if (self.interstitialAd != nil) {
        [self.interstitialAd presentFromRootViewController:self.rootViewContrller];
    } else {
        NSLog(@"Ad wasn't ready");
        [self createAndLoadInterstitial];
    }
}

#pragma mark - GADInterstitialDelegate

/// Tells the delegate that an impression has been recorded for the ad.
- (void)adDidRecordImpression:(nonnull id<GADFullScreenPresentingAd>)ad {

}

/// Tells the delegate that the ad failed to present full screen content.
- (void)ad:(nonnull id<GADFullScreenPresentingAd>)ad didFailToPresentFullScreenContentWithError:(nonnull NSError *)error{
    
}

- (void)adDidPresentFullScreenContent:(nonnull id<GADFullScreenPresentingAd>)ad {
    
}

/// Tells the delegate that the user earned a reward.
- (void)rewardedAd:(nonnull GADRewardedAd *)rewardedAd userDidEarnReward:(nonnull GADAdReward *)reward{
    [self createAndLoadInterstitial];
}


@end
