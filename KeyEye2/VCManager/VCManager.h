//
//  VCManager.h
//  KeyEye2
//
//  Created by 蒋一博 on 16/5/28.
//  Copyright © 2016年 JiangYibo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "MainViewController.h"
#import "LeftViewController.h"
#import "HomeViewController.h"

@interface VCManager : NSObject

@property (nonatomic,strong) UINavigationController *rootViewController;
@property (nonatomic,strong) MainViewController *mainViewController;
@property (nonatomic,strong) LeftViewController *leftViewController;
@property (nonatomic,strong) HomeViewController *homeViewController;

+ (VCManager *)shareManager;//单例


@end
