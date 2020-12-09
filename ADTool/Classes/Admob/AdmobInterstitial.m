//
//  AdmobInterstitial.m
//  Advertising
//
//  Created by huang le on 2020/3/30.
//  Copyright © 2020 Lete. All rights reserved.
//

#import "AdmobInterstitial.h"
#import <GoogleMobileAds/GoogleMobileAds.h>

@interface AdmobInterstitial()<GADInterstitialDelegate>

@property (nonatomic, strong) GADInterstitial *interstitialAd;

@end

@implementation AdmobInterstitial

- (void)createAndLoadInterstitial{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"AdvertisingConf" ofType:@"plist"];
    NSDictionary *dict =[NSDictionary dictionaryWithContentsOfFile:path];
    NSString *AdmobInterstitialID = dict[@"Admob"][@"interstitialID"];
    self.interstitialAd = [[GADInterstitial alloc] initWithAdUnitID:AdmobInterstitialID];
    self.interstitialAd.delegate = self;
    [self.interstitialAd loadRequest:[GADRequest request]];
}

- (void)show{
    if (self.interstitialAd.isReady) {
        [self.interstitialAd presentFromRootViewController:self.rootViewContrller];
    } else {
        NSLog(@"Ad wasn't ready");
        [self createAndLoadInterstitial];
    }
}

#pragma mark - GADInterstitialDelegate
- (void)interstitialDidReceiveAd:(nonnull GADInterstitial *)ad{
    
}

/// Called when an interstitial ad request completed without an interstitial to
/// show. This is common since interstitials are shown sparingly to users.
- (void)interstitial:(nonnull GADInterstitial *)ad
didFailToReceiveAdWithError:(nonnull GADRequestError *)error{
    
}


- (void)interstitialDidDismissScreen:(GADInterstitial *)interstitial {
    [self createAndLoadInterstitial];
}


@end
