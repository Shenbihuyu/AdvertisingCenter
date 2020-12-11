//
//  BUAdBanner.m
//  Advertising
//
//  Created by huang le on 2020/3/30.
//  Copyright © 2020 Lete. All rights reserved.
//

#import "BUAdBanner.h"
#import <BUAdSDK/BUAdSDK.h>

@interface BUAdBanner ()<BUNativeAdDelegate,BUNativeExpressBannerViewDelegate>

@property (nonatomic, strong) BUNativeAd *nativeAd;
@property (nonatomic, strong) BUNativeExpressBannerView *bannerView;

@end

@implementation BUAdBanner

-  (UIView *)refreshBanner {
//    if (self.bannerView == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"AdvertisingConf" ofType:@"plist"];
        NSDictionary *dict =[NSDictionary dictionaryWithContentsOfFile:path];
        NSString *slotID = dict[@"BUAd"][@"bannerID"];
        self.bannerView = [[BUNativeExpressBannerView alloc] initWithSlotID:slotID rootViewController:self.rootViewContrller adSize:self.adSize IsSupportDeepLink:NO interval:30];
        self.bannerView.delegate = self;
        self.bannerView.clipsToBounds = YES;
        if(self.layout != NoLayout){
            [self addBannerViewToView];
        }
//    }
    [self.bannerView loadAdData];
    
    return self.bannerView;
}

- (UIView *)refreshBannerWithBannerID:(NSString*)slotID {
//    if (self.bannerView == nil) {
         self.bannerView = [[BUNativeExpressBannerView alloc] initWithSlotID:slotID rootViewController:self.rootViewContrller adSize:self.adSize IsSupportDeepLink:NO interval:30];
        self.bannerView.delegate = self;
        self.bannerView.clipsToBounds = YES;
        if(self.layout != NoLayout){
            [self addBannerViewToView];
        }
//    }
    [self.bannerView loadAdData];
    
    return self.bannerView;
}

- (void)addBannerViewToView{
    self.bannerView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.rootViewContrller.view addSubview:self.bannerView];
    [self.rootViewContrller.view addConstraints:@[
        [NSLayoutConstraint constraintWithItem:self.bannerView
                                     attribute:NSLayoutAttributeCenterX
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.rootViewContrller.view
                                     attribute:NSLayoutAttributeCenterX
                                    multiplier:1
                                      constant:0],
        [NSLayoutConstraint constraintWithItem:self.bannerView
                                     attribute:NSLayoutAttributeWidth
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:nil
                                     attribute:NSLayoutAttributeWidth
                                    multiplier:1
                                      constant:self.adSize.width],
        [NSLayoutConstraint constraintWithItem:self.bannerView
                                     attribute:NSLayoutAttributeHeight
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:nil
                                     attribute:NSLayoutAttributeHeight
                                    multiplier:1
                                      constant:self.adSize.height]
    ]];
    switch (self.layout) {
        case Top:
            [self.rootViewContrller.view addConstraints:@[
                [NSLayoutConstraint constraintWithItem:self.bannerView
                                             attribute:NSLayoutAttributeTop
                                             relatedBy:NSLayoutRelationEqual
                                                toItem:self.rootViewContrller.view
                                             attribute:NSLayoutAttributeTop
                                            multiplier:1
                                              constant:0]
            ]];
            break;
        case Bottom:
            [self.rootViewContrller.view addConstraints:@[
                [NSLayoutConstraint constraintWithItem:self.bannerView
                                             attribute:NSLayoutAttributeBottom
                                             relatedBy:NSLayoutRelationEqual
                                                toItem:self.rootViewContrller.view
                                             attribute:NSLayoutAttributeBottom
                                            multiplier:1
                                              constant:0]
            ]];

        default:
            break;
    }
}

- (void)removeBanner{
    [self.bannerView removeFromSuperview];
}


#pragma mark - BUNativeExpressBannerViewDelegate
- (void)nativeExpressBannerAdViewDidLoad:(BUNativeExpressBannerView *)bannerAdView{
//    NSLog(@"nativeExpressBannerAdViewDidLoad");
}

/**
 This method is called when bannerAdView ad slot failed to load.
 @param error : the reason of error
 */
- (void)nativeExpressBannerAdView:(BUNativeExpressBannerView *)bannerAdView didLoadFailWithError:(NSError *_Nullable)error{
//    NSLog(@"nativeExpressBannerAdView didLoadFailWithError");
}

/**
 This method is called when rendering a nativeExpressAdView successed.
 */
- (void)nativeExpressBannerAdViewRenderSuccess:(BUNativeExpressBannerView *)bannerAdView{
//    NSLog(@"nativeExpressBannerAdViewRenderSuccess");
}

/**
 This method is called when a nativeExpressAdView failed to render.
 @param error : the reason of error
 */
- (void)nativeExpressBannerAdViewRenderFail:(BUNativeExpressBannerView *)bannerAdView error:(NSError * __nullable)error{
//    NSLog(@"nativeExpressBannerAdViewRenderFail");
}

/**
 This method is called when bannerAdView ad slot showed new ad.
 */
- (void)nativeExpressBannerAdViewWillBecomVisible:(BUNativeExpressBannerView *)bannerAdView{
    
}

/**
 This method is called when bannerAdView is clicked.
 */
- (void)nativeExpressBannerAdViewDidClick:(BUNativeExpressBannerView *)bannerAdView{
    
}

/**
 This method is called when the user clicked dislike button and chose dislike reasons.
 @param filterwords : the array of reasons for dislike.
 */
- (void)nativeExpressBannerAdView:(BUNativeExpressBannerView *)bannerAdView dislikeWithReason:(NSArray<BUDislikeWords *> *_Nullable)filterwords{
    
}

/**
 This method is called when another controller has been closed.
 @param interactionType : open appstore in app or open the webpage or view video ad details page.
 */
- (void)nativeExpressBannerAdViewDidCloseOtherController:(BUNativeExpressBannerView *)bannerAdView interactionType:(BUInteractionType)interactionType{
    
}

@end
