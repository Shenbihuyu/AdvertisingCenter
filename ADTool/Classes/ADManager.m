//
//  ADManager.m
//  Advertising
//
//  Created by huang le on 2019/11/22.
//  Copyright © 2019 Lete. All rights reserved.
//

#import "ADManager.h"
#import <BUAdSDK/BUAdSDK.h>
#import "BUAdBanner.h"
#import "BUAdInterstitial.h"
#import "BUAdRewardVideo.h"
#import "BUAdVideoAd.h"
#import "BUAdSplashAd.h"
#import "AdmobBanner.h"
#import "AdmobInterstitial.h"
#import "AdmobRewardedVideo.h"
#import "AdmobVideoAd.h"
#import "AdmobSplashAd.h"
#import <GoogleMobileAds/GoogleMobileAds.h>

#define KOperationNumber @"ADManager_OperationNumber"
#define ADLog(...)\
if(self.showLog)\
{\
printf("ADManager %s\n",[[NSString stringWithFormat:__VA_ARGS__]UTF8String]);\
}\

@interface ADManager()<BURewardedVideoAdDelegate>

@property(nonatomic,assign)NSInteger number;
@property(nonatomic,copy)NSString *appID;
@property(nonatomic,copy)NSString *adID;

@property(nonatomic,assign)BOOL showAdRightnow;
@property(nonatomic,assign)BOOL rewardedAdLoaded;

@property(nonatomic,strong)BURewardedVideoAd *rewardedVideoAd;


@end

@implementation ADManager

+ (instancetype)shareInstance{
    static ADManager *single;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        single = [[super allocWithZone:NULL] init];
        single.showLog = NO;
        single.threshold = 60;
        single.recordAdType = Reward;
        if([single operationNumber] == NULL){
            [single setOperationNumber:0];
        }
    });
    
    return single;
}

+ (id)allocWithZone:(struct _NSZone *)zone{
    return [ADManager shareInstance] ;
}

- (id)copyWithZone:(struct _NSZone *)zone{
    return [ADManager shareInstance] ;
}

- (void)SBHYADType:(SBHYADType)adType{
    self.adType = adType;
    switch (self.adType) {
        case BUAd:{
            NSString *path = [[NSBundle mainBundle] pathForResource:@"AdvertisingConf" ofType:@"plist"];
            NSDictionary *dict =[NSDictionary dictionaryWithContentsOfFile:path];
            NSString *appID = dict[@"BUAd"][@"appID"];
            [BUAdSDKManager setAppID:appID];
            [BUAdSDKManager setLoglevel:BUAdSDKLogLevelNone];
            NSString *deviceType = [UIDevice currentDevice].model;
            if([deviceType isEqualToString:@"iPad"]) {
                [BUAdSDKManager setIsPaidApp:YES];
            }else{
                [BUAdSDKManager setIsPaidApp:NO];
            }
        }
            break;
        case Admob:{
            [[GADMobileAds sharedInstance] startWithCompletionHandler:nil];
        }
            break;
        case Automatic:
        {
            //获取当前设备语言
            NSArray *appLanguages = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"];
            NSString *languageName = [appLanguages objectAtIndex:0];
            if([languageName containsString:@"zh-Hans"]){
                [self SBHYADType:BUAd];
            }else{
                [self SBHYADType:Admob];
            }
        }
            break;
        default:
            
            break;
    }
}

#pragma mark - Banner
- (SBHYBanner *)bannerWithRootViewContrller:(UIViewController *)root layout:(SBHYLayout)layout adSize:(CGSize)adSize{
    SBHYBanner *banner = [self banner];
    banner.rootViewContrller = root;
    banner.layout = layout;
    banner.adSize = adSize;
    return banner;
}

- (SBHYBanner *)banner{
    SBHYBanner *banner;
    switch (_adType) {
        case BUAd:
            banner = [BUAdBanner shareInstance];
            break;
        case Admob:
            banner = [AdmobBanner shareInstance];
            break;
        default:
            banner = [SBHYBanner shareInstance];
            break;
    }
    return banner;
}

#pragma mark - 开屏
- (SBHYSplashAd *)splashAdWithRootViewController:(UIViewController *)root adFrame:(CGRect)adFrame{
    SBHYSplashAd *splash = [self splashAd];
    splash.rootViewContrller = root;
    splash.adFrame = adFrame;
    return splash;
}

- (SBHYSplashAd *)splashAd{
    SBHYSplashAd *splash;
    switch (_adType) {
        case BUAd:
            splash = [BUAdSplashAd shareInstance];
            break;
        case Admob:
            splash = [AdmobSplashAd shareInstance];
            break;
        default:
            splash = [SBHYSplashAd shareInstance];
            break;
    }
    return splash;
}

#pragma mark - 插屏
- (SBHYInterstitialAd *)interstitialWithRootViewController:(UIViewController *)root adSize:(CGSize)adSize{
    SBHYInterstitialAd *interstitial = [self interstitial];
    interstitial.rootViewContrller = root;
    interstitial.adSize = adSize;
    return interstitial;
}

- (SBHYInterstitialAd *)interstitial{
    SBHYInterstitialAd *interstitial;
    switch (self.adType) {
        case BUAd:
            interstitial = [BUAdInterstitial shareInstance];
            break;
        case Admob:
            interstitial = [AdmobInterstitial shareInstance];
            break;
        default:
            interstitial = [SBHYInterstitialAd shareInstance];
            break;
    }
    return interstitial;
}

#pragma mark - 激励视频
- (SBHYRewardedVideo *)rewardedVideoWithRootViewController:(UIViewController *)root{
    SBHYRewardedVideo *rewardedVideo = [self rewardedVideo];
    rewardedVideo.rootViewContrller = root;
    return rewardedVideo;
}

- (SBHYRewardedVideo *)rewardedVideo{
    SBHYRewardedVideo *rewardedVideo;
    switch (self.adType) {
        case BUAd:
            rewardedVideo = [BUAdRewardVideo shareInstance];
            break;
        case Admob:
            rewardedVideo = [AdmobRewardedVideo shareInstance];
            break;
        default:
            rewardedVideo = [SBHYRewardedVideo shareInstance];
            break;
    }
    return rewardedVideo;
}

#pragma mark - 全屏视频
- (SBHYVideoAd *)videoAd{
    SBHYVideoAd *videoAd;
    switch (self.adType) {
        case BUAd:
            videoAd = [BUAdVideoAd shareInstance];
            break;
        case Admob:
            videoAd = [AdmobVideoAd shareInstance];
            break;
        default:
            videoAd = [SBHYVideoAd shareInstance];
            break;
    }
    return videoAd;
}

- (SBHYVideoAd *)videoAdWithRootViewController:(UIViewController *)root{
    SBHYVideoAd *videoAd = [self videoAd];
    videoAd.rootViewContrller = root;
    return videoAd;
}


#pragma mark - 操作记录
- (void)operationRecords{
    if([[self operationNumber] integerValue] >= self.threshold-1){
        switch (self.recordAdType) {
            case Reward:
            {
                if([[self rewardedVideo] show:^(BOOL earnReward){}]){
                    [self setOperationNumber:0];
                }
            }
                break;
            case Video:
            {
                if([[self videoAd] show]){
                    [self setOperationNumber:0];
                }
            }
            default:
                break;
        }
        
    }else{
        [self setOperationNumber:[[self operationNumber] integerValue]+1];
    }
}

- (id)operationNumber{
    return [[NSUserDefaults standardUserDefaults] objectForKey:KOperationNumber];
}

- (void)setOperationNumber:(NSInteger)num{
    [[NSUserDefaults standardUserDefaults] setInteger:num forKey:KOperationNumber];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


@end
