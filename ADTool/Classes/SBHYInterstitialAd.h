//
//  SBHYInterstitialAd.h
//  Advertising
//
//  Created by huang le on 2020/3/30.
//  Copyright © 2020 Lete. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



@interface SBHYInterstitialAd : NSObject

@property(nonatomic,strong)UIViewController *rootViewContrller;
@property(nonatomic,assign)CGSize adSize;

+ (instancetype)shareInstance;
- (void)createAndLoadInterstitial;
- (void)show;

@end

