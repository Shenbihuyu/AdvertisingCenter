//
//  ViewController.m
//  Example
//
//  Created by lete on 2020/12/8.
//

#import "ViewController.h"

#import <ADManager.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView *banner = [[[ADManager shareInstance] bannerWithRootViewContrller:self layout:Bottom adSize:CGSizeMake(320, 50)] refreshBanner];
    //    [self addBannerViewToView:banner adSize:CGSizeMake(320, 50)];
    [[[ADManager shareInstance] interstitialWithRootViewController:self adSize:CGSizeMake(300, 300)] createAndLoadInterstitial];
    [[[ADManager shareInstance] rewardedVideoWithRootViewController:self] createAndLoadRewardedVideo];
    [[[ADManager shareInstance] videoAdWithRootViewController:self] createAndLoadVideo];



}


- (void)addBannerViewToView:(UIView *)bannerView adSize:(CGSize)adSize{
    bannerView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:bannerView];
    [self.view addConstraints:@[
        [NSLayoutConstraint constraintWithItem:bannerView
                                     attribute:NSLayoutAttributeCenterX
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.view
                                     attribute:NSLayoutAttributeCenterX
                                    multiplier:1
                                      constant:0],
        [NSLayoutConstraint constraintWithItem:bannerView
                                     attribute:NSLayoutAttributeWidth
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:nil
                                     attribute:NSLayoutAttributeWidth
                                    multiplier:1
                                      constant:adSize.width],
        [NSLayoutConstraint constraintWithItem:bannerView
                                     attribute:NSLayoutAttributeHeight
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:nil
                                     attribute:NSLayoutAttributeHeight
                                    multiplier:1
                                      constant:adSize.height],
        [NSLayoutConstraint constraintWithItem:bannerView
                                     attribute:NSLayoutAttributeBottom
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.view
                                     attribute:NSLayoutAttributeBottom
                                    multiplier:1
                                      constant:0]
    ]];
    
}


- (IBAction)interstitiaBtn:(id)sender {
    [[[ADManager shareInstance] interstitial] show];
}

- (IBAction)rewardVideoBtn:(id)sender {
    [[[ADManager shareInstance] rewardedVideo] show:^(BOOL earnReward){
        if(earnReward){
            NSLog(@"earnReward");
        }
    }];
}

- (IBAction)operation:(id)sender {
    [[ADManager shareInstance] operationRecords];
}

- (IBAction)videoAd:(id)sender {
    [[[ADManager shareInstance] videoAd] show];
}



@end
