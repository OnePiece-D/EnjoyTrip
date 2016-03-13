//
//  WYLRootViewController.m
//  EnjoyTrip
//
//  Created by 王亚龙 on 16/3/8.
//  Copyright © 2016年 YCD. All rights reserved.
//

#import "WYLRootViewController.h"

@interface WYLRootViewController ()

@end

@implementation WYLRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)setNeedsStatusBarAppearanceUpdate {
    [super setNeedsStatusBarAppearanceUpdate];
    
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
