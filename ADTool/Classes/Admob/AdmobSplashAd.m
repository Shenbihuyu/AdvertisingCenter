//
//  AdmobSplashAd.m
//  Advertising
//
//  Created by huang le on 2020/12/10.
//  Copyright © 2020 Lete. All rights reserved.
//

#import "AdmobSplashAd.h"
#import <GoogleMobileAds/GoogleMobileAds.h>

@interface AdmobSplashAd()<GADFullScreenContentDelegate>

@property(nonatomic) GADAppOpenAd* appOpenAd;

@end

@implementation AdmobSplashAd


- (void)createAndLoad{
    self.appOpenAd = nil;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"AdvertisingConf" ofType:@"plist"];
    NSDictionary *dict =[NSDictionary dictionaryWithContentsOfFile:path];
    NSString *splashAdID = dict[@"Admob"][@"splashAdID"];
    [GADAppOpenAd loadWithAdUnitID:splashAdID
                           request:[GADRequest request]
                       orientation:UIInterfaceOrientationPortrait
                 completionHandler:^(GADAppOpenAd *_Nullable appOpenAd, NSError *_Nullable error) {
        if (error) {
            NSLog(@"Failed to load app open ad: %@", error);
            return;
        }
        if(appOpenAd){
            appOpenAd.fullScreenContentDelegate = self;
            [appOpenAd presentFromRootViewController:self.rootViewContrller];
        }
    }];
}

#pragma mark - GADFullScreenContentDelegate

- (void)adDidRecordImpression:(nonnull id<GADFullScreenPresentingAd>)ad{
    
}

- (void)ad:(nonnull id<GADFullScreenPresentingAd>)ad
    didFailToPresentFullScreenContentWithError:(nonnull NSError *)error {
  NSLog(@"didFailToPresentFullSCreenCContentWithError");

}

/// Tells the delegate that the ad presented full screen content.
- (void)adDidPresentFullScreenContent:(nonnull id<GADFullScreenPresentingAd>)ad {
  NSLog(@"adDidPresentFullScreenContent");
}

/// Tells the delegate that the ad dismissed full screen content.
- (void)adDidDismissFullScreenContent:(nonnull id<GADFullScreenPresentingAd>)ad {
  NSLog(@"adDidDismissFullScreenContent");
}

@end
