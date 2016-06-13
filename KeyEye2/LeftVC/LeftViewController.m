//
//  LeftViewController.m
//  KeyEye2
//
//  Created by 蒋一博 on 16/5/28.
//  Copyright © 2016年 JiangYibo. All rights reserved.
//

#import "LeftViewController.h"

#import "LoginViewController.h"

#import "VCManager.h"

@interface LeftViewController ()



@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    [self initializeDataSource];
    
    [self initializeInterface];
    
}

- (void)initializeDataSource{
    
    
}

- (void)initializeInterface{
    
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    //弹出登录界面
    [self showLoginVCWithAnimation:YES];

}

- (void)showLoginVCWithAnimation:(BOOL)animation {
    
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    
    if (animation) {
        
        loginVC.view.transform = CGAffineTransformMakeScale(1.2, 1.2);
        [[VCManager shareManager].mainViewController addChildViewController:loginVC];
        loginVC.view.alpha = 0.5;
        
        [UIView animateWithDuration:0.5 animations:^{
            loginVC.view.transform = CGAffineTransformMakeScale(1, 1);
            loginVC.view.alpha = 1;
        }];
        
    }else {
        
        [[VCManager shareManager].mainViewController addChildViewController:loginVC];
        
    }
}


@end
