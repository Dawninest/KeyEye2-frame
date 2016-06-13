//
//  VCManager.m
//  KeyEye2
//
//  Created by 蒋一博 on 16/5/28.
//  Copyright © 2016年 JiangYibo. All rights reserved.
//

#import "VCManager.h"

@implementation VCManager

static VCManager *manager = nil;

/**
 *   创建单例
 *
 *   @return manager
 */
+ (VCManager *)shareManager{
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        manager = [[VCManager alloc]init];
    });
    
    return manager;
}

#pragma mark -- getter
- (LeftViewController *)leftViewController{
    if (_leftViewController == nil) {
        _leftViewController = [[LeftViewController alloc]init];
    }
    return _leftViewController;
}

- (HomeViewController *)homeViewController{

    if (_homeViewController == nil) {
        _homeViewController = [[HomeViewController alloc]init];
    }
    return _homeViewController;

}

- (MainViewController *)mainViewController{
    if (_mainViewController == nil) {
        _mainViewController = [[MainViewController alloc]initWithLeftViewController:self.leftViewController rootViewController:self.rootViewController];
    }
    return _mainViewController;
}

- (UINavigationController *)rootViewController{
    if (!_rootViewController) {
        _rootViewController = [[UINavigationController alloc]initWithRootViewController:self.homeViewController];
        //_rootViewController.navigationBarHidden = YES;
    }
    return _rootViewController;
}

@end
