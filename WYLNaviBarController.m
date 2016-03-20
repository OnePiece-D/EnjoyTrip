//
//  WYLNaviBarController.m
//  EnjoyTrip
//
//  Created by 王亚龙 on 16/3/11.
//  Copyright © 2016年 YCD. All rights reserved.
//

#import "WYLNaviBarController.h"

@interface WYLNaviBarController ()

@end

@implementation WYLNaviBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [super pushViewController:viewController animated:animated];
    
    [self.navigationBar setTranslucent:YES];
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"CustomBarBackground"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:[UIImage imageNamed:@"clearImage"]];
    viewController.automaticallyAdjustsScrollViewInsets = NO;
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    
//    DLog(self.navigationController.visibleViewController);
    if (!NSStringFromClass([self.navigationController.topViewController class])) {
        [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"NavigationBarShadow"] forBarMetrics:UIBarMetricsDefault];
        [self.navigationBar setShadowImage:[UIImage imageNamed:@"kong"]];
        [self.navigationBar setTranslucent:NO];
    }
    
    
    return [super popViewControllerAnimated:animated];
}

- (UIViewController *)childViewControllerForStatusBarStyle {
    return self.topViewController;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
