//
//  HomeViewController.m
//  KeyEye2
//
//  Created by 蒋一博 on 16/5/28.
//  Copyright © 2016年 JiangYibo. All rights reserved.
//

#import "HomeViewController.h"

#import "VCManager.h"

@interface HomeViewController ()



@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initializeDataSource];
    
    [self initializeInterface];
    
}

- (void)initializeDataSource{
    
    
}

- (void)initializeInterface{
    
    UILabel *tipLabel = [[UILabel alloc]init];
    tipLabel.frame = self.view.frame;
    
    tipLabel.text = @"homeView";
    
    tipLabel.textAlignment = NSTextAlignmentCenter;

    [self.view addSubview:tipLabel];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [[VCManager shareManager].mainViewController useDrawer];
    

}

@end
