//
//  SBHYSplashAd.h
//  Advertising
//
//  Created by huang le on 2020/7/14.
//  Copyright © 2020 Lete. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface SBHYSplashAd : NSObject

@property(nonatomic,strong)UIViewController *rootViewContrller;
@property(nonatomic,assign)CGRect adFrame;

+ (instancetype)shareInstance;
- (void)createAndLoad;
- (BOOL)show;

@end


