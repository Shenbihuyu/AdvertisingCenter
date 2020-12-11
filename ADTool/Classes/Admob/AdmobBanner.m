//
//  AdmobBanner.m
//  Advertising
//
//  Created by huang le on 2020/3/30.
//  Copyright © 2020 Lete. All rights reserved.
//

#import "AdmobBanner.h"
#import <GoogleMobileAds/GoogleMobileAds.h>

@interface AdmobBanner()

@property(nonatomic, strong) GADBannerView *bannerView;

@end

@implementation AdmobBanner


- (UIView *)refreshBanner{
    self.bannerView = [[GADBannerView alloc] initWithAdSize:kGADAdSizeBanner];
    if(self.layout != NoLayout){
        [self addBannerViewToView];
    }
    NSString *path = [[NSBundle mainBundle] pathForResource:@"AdvertisingConf" ofType:@"plist"];
    NSDictionary *dict =[NSDictionary dictionaryWithContentsOfFile:path];
    NSString *bannerID = dict[@"Admob"][@"bannerID"];
    self.bannerView.adUnitID = bannerID;
    self.bannerView.rootViewController = self.rootViewContrller;
    [self.bannerView loadRequest:[GADRequest request]];
    return self.bannerView;
}

- (UIView *)refreshBannerWithBannerID:(NSString*)slotID {
    self.bannerView = [[GADBannerView alloc] initWithAdSize:kGADAdSizeBanner];
    if(self.layout != NoLayout){
        [self addBannerViewToView];
    }
    self.bannerView.adUnitID = slotID;
    self.bannerView.rootViewController = self.rootViewContrller;
    [self.bannerView loadRequest:[GADRequest request]];
    return self.bannerView;
}

- (void)addBannerViewToView {
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

@end
