//
//  LoginViewController.m
//  KeyEye2
//
//  Created by 蒋一博 on 16/5/28.
//  Copyright © 2016年 JiangYibo. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()



@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initializeDataSource];
    
    [self initializeInterface];
    
}

- (void)initializeDataSource{
    
    
}

- (void)initializeInterface{
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    UILabel *tipLabel = [[UILabel alloc]init];
    tipLabel.frame = self.view.frame;
    
    tipLabel.text = @"loginView";
    
    tipLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:tipLabel];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [UIView animateWithDuration:0.4 animations:^{
        
        self.view.alpha = 0;
        
    } completion:^(BOOL finished) {
        [self.navigationController.view removeFromSuperview];
        [self.navigationController removeFromParentViewController];
        
    }];


}

@end
