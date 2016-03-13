//
//  WYLNavigationSet.m
//  EnjoyTrip
//
//  Created by 王亚龙 on 16/3/8.
//  Copyright © 2016年 YCD. All rights reserved.
//

#import "WYLNavigationSet.h"

#import <UIKit/UIKit.h>

@implementation WYLNavigationSet

+ (void)naviAttributeSet {
    
    [[UINavigationBar appearance] setBarStyle:UIBarStyleDefault];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"NavigationBarShadow"] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setTranslucent:NO];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
}

@end
