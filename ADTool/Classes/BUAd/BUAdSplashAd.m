//
//  BUAdSplashAd.m
//  Advertising
//
//  Created by huang le on 2020/7/14.
//  Copyright © 2020 Lete. All rights reserved.
//

#import "BUAdSplashAd.h"
#import <BUAdSDK/BUAdSDK.h>

@interface BUAdSplashAd()<BUSplashAdDelegate>

@end

@implementation BUAdSplashAd

- (void)createAndLoad{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"AdvertisingConf" ofType:@"plist"];
    NSDictionary *dict =[NSDictionary dictionaryWithContentsOfFile:path];
    NSString *slotID = dict[@"BUAd"][@"splashAdID"];
    BUSplashAdView *splashView = [[BUSplashAdView alloc] initWithSlotID:slotID frame:self.adFrame];
    splashView.delegate = self;
    [splashView loadAdData];
    [self.rootViewContrller.view addSubview:splashView];
    splashView.rootViewController = self.rootViewContrller;
}


#pragma mark - delegate

/**
 This method is called when splash ad material loaded successfully.
 */
- (void)splashAdDidLoad:(BUSplashAdView *)splashAd{
    
}

/**
 This method is called when splash ad material failed to load.
 @param error : the reason of error
 */
- (void)splashAd:(BUSplashAdView *)splashAd didFailWithError:(NSError * _Nullable)error{
    [splashAd removeFromSuperview];
}

/**
 This method is called when splash ad slot will be showing.
 */
- (void)splashAdWillVisible:(BUSplashAdView *)splashAd{
    
}

/**
 This method is called when splash ad is clicked.
 */
- (void)splashAdDidClick:(BUSplashAdView *)splashAd{
    
}

/**
 This method is called when splash ad is closed.
 */
- (void)splashAdDidClose:(BUSplashAdView *)splashAd{
    [splashAd removeFromSuperview];
}

/**
 This method is called when splash ad is about to close.
 */
- (void)splashAdWillClose:(BUSplashAdView *)splashAd{
    
}

/**
 This method is called when another controller has been closed.
 @param interactionType : open appstore in app or open the webpage or view video ad details page.
 */
- (void)splashAdDidCloseOtherController:(BUSplashAdView *)splashAd interactionType:(BUInteractionType)interactionType{
    
}

/**
 This method is called when spalashAd skip button  is clicked.
 */
- (void)splashAdDidClickSkip:(BUSplashAdView *)splashAd{
    
}

/**
 This method is called when spalashAd countdown equals to zero
 */
- (void)splashAdCountdownToZero:(BUSplashAdView *)splashAd{
    
}

@end
