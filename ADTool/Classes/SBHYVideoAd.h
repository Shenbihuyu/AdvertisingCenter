//
//  SBHYVideoAd.h
//  Advertising
//
//  Created by huang le on 2020/4/8.
//  Copyright © 2020 Lete. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



@interface SBHYVideoAd : NSObject

@property(nonatomic,strong)UIViewController *rootViewContrller;
@property(nonatomic,copy)void(^callback)(BOOL earnReward);

+ (instancetype)shareInstance;
- (void)createAndLoadVideo;
- (BOOL)show;
- (BOOL)show:(void(^)(BOOL earnReward))block;

@end


