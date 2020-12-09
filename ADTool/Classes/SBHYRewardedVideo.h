//
//  SBHYRewardedVideo.h
//  Advertising
//
//  Created by huang le on 2020/3/30.
//  Copyright © 2020 Lete. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//typedef void (^rewardedBlock)(BOOL earnReward);

@interface SBHYRewardedVideo : NSObject

@property(nonatomic,strong)UIViewController *rootViewContrller;
@property(nonatomic,copy)void(^callback)(BOOL earnReward);

+ (instancetype)shareInstance;
- (void)createAndLoadRewardedVideo;
- (BOOL)show:(void(^)(BOOL earnReward))block;

@end


