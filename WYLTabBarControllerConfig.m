//
//  WYLTabBarControllerConfig.m
//  EnjoyTrip
//
//  Created by 王亚龙 on 16/3/8.
//  Copyright © 2016年 YCD. All rights reserved.
//

#import "WYLTabBarControllerConfig.h"
#import "WYLNaviBarController.h"
#import "WYLRootViewController.h"

@interface WYLTabBarControllerConfig()

@property (nonatomic, strong, readwrite) CYLTabBarController * tabBarController;

@end

@implementation WYLTabBarControllerConfig

//WYLHomeViewController
//WYLStrtageViewController
//WYLMineViewController

- (CYLTabBarController *)tabBarController {
    if (!_tabBarController) {
        NSArray * titleArray = @[@"WYLHomeViewController",
                                 @"WYLStrtageViewController",
                                 @"WYLMineViewController"];
        NSMutableArray * naviArray = [NSMutableArray array];
        for (int i = 0; i < titleArray.count; i++) {
            Class classname = NSClassFromString(titleArray[i]);
            WYLNaviBarController * navi = [[WYLNaviBarController alloc] initWithRootViewController:[[classname alloc] init]];
            [naviArray addObject:navi];
        }
        CYLTabBarController *tabBarController = [[CYLTabBarController alloc] init];
        
        // 在`-setViewControllers:`之前设置TabBar的属性，设置TabBarItem的属性，包括 title、Image、selectedImage。
        [self setUpTabBarItemsAttributesForController:tabBarController];
        
        [tabBarController setViewControllers:naviArray];
        // 更多TabBar自定义设置：比如：tabBarItem 的选中和不选中文字和背景图片属性、tabbar 背景图片属性
        //        [[self class] customizeTabBarAppearance:tabBarController];
        _tabBarController = tabBarController;
        
    }
    return _tabBarController;
}

/**
 *  在`-setViewControllers:`之前设置TabBar的属性，设置TabBarItem的属性，包括 title、Image、selectedImage。
 */
- (void)setUpTabBarItemsAttributesForController:(CYLTabBarController *)tabBarController {
    
    NSDictionary *dict1 = @{
                            CYLTabBarItemTitle : @"首页",
                            CYLTabBarItemImage : @"home_normal",
                            CYLTabBarItemSelectedImage : @"home_highlight",
                            };
    NSDictionary *dict2 = @{
                            CYLTabBarItemTitle : @"攻略",
                            CYLTabBarItemImage : @"mycity_normal",
                            CYLTabBarItemSelectedImage : @"mycity_highlight",
                            };
    NSDictionary *dict3 = @{
                            CYLTabBarItemTitle : @"我的",
                            CYLTabBarItemImage : @"message_normal",
                            CYLTabBarItemSelectedImage : @"message_highlight",
                            };
    NSArray *tabBarItemsAttributes = @[
                                       dict1,
                                       dict2,
                                       dict3
                                       ];
    tabBarController.tabBarItemsAttributes = tabBarItemsAttributes;
}

@end
