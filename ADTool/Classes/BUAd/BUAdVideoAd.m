//
//  BUAdVideoAd.m
//  Advertising
//
//  Created by huang le on 2020/4/8.
//  Copyright © 2020 Lete. All rights reserved.
//

#import "BUAdVideoAd.h"
#import <BUAdSDK/BUAdSDK.h>

@interface BUAdVideoAd()<BUNativeExpressFullscreenVideoAdDelegate>

@property(nonatomic,strong)BUNativeExpressFullscreenVideoAd *fullscreenAd;
@property(nonatomic,assign)BOOL earnReward;

@end

@implementation BUAdVideoAd

- (void)createAndLoadVideo{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"AdvertisingConf" ofType:@"plist"];
    NSDictionary *dict =[NSDictionary dictionaryWithContentsOfFile:path];
    NSString *slotID = dict[@"BUAd"][@"fullscreenAdID"];
    self.fullscreenAd = [[BUNativeExpressFullscreenVideoAd alloc] initWithSlotID:slotID];
    self.fullscreenAd.delegate = self;
    [self.fullscreenAd loadAdData];
}


- (BOOL)show{
    if(self.fullscreenAd.adValid){
        return [self.fullscreenAd showAdFromRootViewController:self.rootViewContrller];
    }else{
        [self createAndLoadVideo];
        return NO;
    }
}

- (BOOL)show:(void(^)(BOOL earnReward))block{
    self.callback = block;
    self.earnReward = NO;
    return [self show];
}


- (void)nativeExpressFullscreenVideoAdDidLoad:(BUNativeExpressFullscreenVideoAd *)fullscreenVideoAd{
    
}

/**
 This method is called when video ad materia failed to load.
 @param error : the reason of error
 */
- (void)nativeExpressFullscreenVideoAd:(BUNativeExpressFullscreenVideoAd *)fullscreenVideoAd didFailWithError:(NSError *_Nullable)error{
    
}

/**
 This method is called when rendering a nativeExpressAdView successed.
 */
- (void)nativeExpressFullscreenVideoAdViewRenderSuccess:(BUNativeExpressFullscreenVideoAd *)rewardedVideoAd{
    
}

/**
 This method is called when a nativeExpressAdView failed to render.
 @param error : the reason of error
 */
- (void)nativeExpressFullscreenVideoAdViewRenderFail:(BUNativeExpressFullscreenVideoAd *)rewardedVideoAd error:(NSError *_Nullable)error{
    if(self.callback){
        self.callback(NO);
    }
}

/**
 This method is called when video cached successfully.
 */
- (void)nativeExpressFullscreenVideoAdDidDownLoadVideo:(BUNativeExpressFullscreenVideoAd *)fullscreenVideoAd{
    
}

/**
 This method is called when video ad slot will be showing.
 */
- (void)nativeExpressFullscreenVideoAdWillVisible:(BUNativeExpressFullscreenVideoAd *)fullscreenVideoAd{
    
}

/**
 This method is called when video ad slot has been shown.
 */
- (void)nativeExpressFullscreenVideoAdDidVisible:(BUNativeExpressFullscreenVideoAd *)fullscreenVideoAd{
    
}

/**
 This method is called when video ad is clicked.
 */
- (void)nativeExpressFullscreenVideoAdDidClick:(BUNativeExpressFullscreenVideoAd *)fullscreenVideoAd{
    
}

/**
 This method is called when the user clicked skip button.
 */
- (void)nativeExpressFullscreenVideoAdDidClickSkip:(BUNativeExpressFullscreenVideoAd *)fullscreenVideoAd{
    
}

/**
 This method is called when video ad is about to close.
 */
- (void)nativeExpressFullscreenVideoAdWillClose:(BUNativeExpressFullscreenVideoAd *)fullscreenVideoAd{
    if(self.callback){
        self.callback(YES);
    }
}

/**
 This method is called when video ad is closed.
 */
- (void)nativeExpressFullscreenVideoAdDidClose:(BUNativeExpressFullscreenVideoAd *)fullscreenVideoAd{
    [self createAndLoadVideo];
}

/**
 This method is called when video ad play completed or an error occurred.
 @param error : the reason of error
 */
- (void)nativeExpressFullscreenVideoAdDidPlayFinish:(BUNativeExpressFullscreenVideoAd *)fullscreenVideoAd didFailWithError:(NSError *_Nullable)error{
    
}

/**
This method is used to get the type of nativeExpressFullScreenVideo ad
 */
- (void)nativeExpressFullscreenVideoAdCallback:(BUNativeExpressFullscreenVideoAd *)fullscreenVideoAd withType:(BUNativeExpressFullScreenAdType) nativeExpressVideoAdType{
    
}

/**
 This method is called when another controller has been closed.
 @param interactionType : open appstore in app or open the webpage or view video ad details page.
 */
- (void)nativeExpressFullscreenVideoAdDidCloseOtherController:(BUNativeExpressFullscreenVideoAd *)fullscreenVideoAd interactionType:(BUInteractionType)interactionType{
    
}

@end
