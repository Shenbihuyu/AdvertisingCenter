//
//  SBHYBanner.h
//  Advertising
//
//  Created by huang le on 2020/3/30.
//  Copyright © 2020 Lete. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum {
    Top,
    Bottom,
    NoLayout
} SBHYLayout;


@interface SBHYBanner : NSObject

@property(nonatomic,strong)UIViewController *rootViewContrller;
@property(nonatomic,assign)SBHYLayout layout;
@property(nonatomic,assign)CGSize adSize;


+ (instancetype)shareInstance;
- (UIView *)refreshBanner;
- (UIView *)refreshBannerWithBannerID:(NSString*)slotID;
- (void)removeBanner;

@end

