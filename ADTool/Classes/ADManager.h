//
//  ADManager.h
//  Advertising
//
//  Created by huang le on 2019/11/22.
//  Copyright © 2019 Lete. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SBHYBanner.h"
#import "SBHYInterstitialAd.h"
#import "SBHYRewardedVideo.h"
#import "SBHYVideoAd.h"
#import "SBHYSplashAd.h"

typedef enum {
    BUAd,//穿山甲
    Admob,//admob
    Automatic//自动，根据系统语言，简体中文穿山甲，其他admob
} SBHYADType;


typedef enum {
    Reward,//激励视频广告
    Video//全屏视频广告
} SBHYRecordAdType;


@interface ADManager : NSObject

@property(nonatomic,assign)SBHYADType adType;
@property(nonatomic,assign)SBHYRecordAdType recordAdType;
@property(nonatomic,assign)BOOL showLog;
//设置操作次数阀值，默认60次
@property(nonatomic,assign)NSInteger threshold;

+ (instancetype)shareInstance;


- (void)SBHYADType:(SBHYADType)adType;

- (SBHYBanner *)banner;
- (SBHYBanner *)bannerWithRootViewContrller:(UIViewController *)root layout:(SBHYLayout)layout adSize:(CGSize)adSize;

- (SBHYInterstitialAd *)interstitial;
- (SBHYInterstitialAd *)interstitialWithRootViewController:(UIViewController *)root adSize:(CGSize)adSize;

- (SBHYRewardedVideo *)rewardedVideo;
- (SBHYRewardedVideo *)rewardedVideoWithRootViewController:(UIViewController *)root;

- (SBHYVideoAd *)videoAd;
- (SBHYVideoAd *)videoAdWithRootViewController:(UIViewController *)root;


- (SBHYSplashAd *)splashAd;
- (SBHYSplashAd *)splashAdWithRootViewController:(UIViewController *)root adFrame:(CGRect)adFrame;

//操作记录
- (void)operationRecords;

@end

