//
//  BUAdInterstitial.m
//  Advertising
//
//  Created by huang le on 2020/3/30.
//  Copyright © 2020 Lete. All rights reserved.
//

#import "BUAdInterstitial.h"
#import <BUAdSDK/BUAdSDK.h>

@interface BUAdInterstitial ()<BUNativeExpresInterstitialAdDelegate>

@property (nonatomic, strong) BUNativeAd *nativeAd;
@property (nonatomic, strong) BUNativeExpressBannerView *bannerView;
@property (nonatomic, strong) BUNativeExpressInterstitialAd *interstitialAd;

@end


@implementation BUAdInterstitial

- (void)createAndLoadInterstitial{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"AdvertisingConf" ofType:@"plist"];
    NSDictionary *dict =[NSDictionary dictionaryWithContentsOfFile:path];
    NSString *slotID = dict[@"BUAd"][@"interstitialID"];
    self.interstitialAd = [[BUNativeExpressInterstitialAd alloc] initWithSlotID:slotID adSize:self.adSize];
    self.interstitialAd.delegate = self;
    [self.interstitialAd loadAdData];
}

- (void)show{
    if(self.interstitialAd.adValid){
        [self.interstitialAd showAdFromRootViewController:self.rootViewContrller];
    }else{
        [self createAndLoadInterstitial];
    }
}


#pragma mark - BUNativeExpresInterstitialAdDelegate
- (void)nativeExpresInterstitialAdDidLoad:(BUNativeExpressInterstitialAd *)interstitialAd{
//    NSLog(@"nativeExpresInterstitialAdDidLoad");
}

/**
 This method is called when interstitial ad material failed to load.
 @param error : the reason of error
 */
- (void)nativeExpresInterstitialAd:(BUNativeExpressInterstitialAd *)interstitialAd didFailWithError:(NSError * __nullable)error{
//    NSLog(@"nativeExpresInterstitialAd didFailWithError");
}

/**
 This method is called when rendering a nativeExpressAdView successed.
 */
- (void)nativeExpresInterstitialAdRenderSuccess:(BUNativeExpressInterstitialAd *)interstitialAd{
//    NSLog(@"nativeExpresInterstitialAdRenderSuccess");
}

/**
 This method is called when a nativeExpressAdView failed to render.
 @param error : the reason of error
 */
- (void)nativeExpresInterstitialAdRenderFail:(BUNativeExpressInterstitialAd *)interstitialAd error:(NSError * __nullable)error{
//    NSLog(@"nativeExpresInterstitialAdRenderFail error");
}

/**
 This method is called when interstitial ad slot will be showing.
 */
- (void)nativeExpresInterstitialAdWillVisible:(BUNativeExpressInterstitialAd *)interstitialAd{
    
}

/**
 This method is called when interstitial ad is clicked.
 */
- (void)nativeExpresInterstitialAdDidClick:(BUNativeExpressInterstitialAd *)interstitialAd{
    
}

/**
 This method is called when interstitial ad is about to close.
 */
- (void)nativeExpresInterstitialAdWillClose:(BUNativeExpressInterstitialAd *)interstitialAd{
    
}

/**
 This method is called when interstitial ad is closed.
 */
- (void)nativeExpresInterstitialAdDidClose:(BUNativeExpressInterstitialAd *)interstitialAd{
    [self createAndLoadInterstitial];
}

/**
 This method is called when another controller has been closed.
 @param interactionType : open appstore in app or open the webpage or view video ad details page.
 */
- (void)nativeExpresInterstitialAdDidCloseOtherController:(BUNativeExpressInterstitialAd *)interstitialAd interactionType:(BUInteractionType)interactionType{
    
}

@end
