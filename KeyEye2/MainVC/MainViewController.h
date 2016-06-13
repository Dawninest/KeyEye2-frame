//
//  MainViewController.h
//  KeyEye2
//
//  Created by 蒋一博 on 16/5/28.
//  Copyright © 2016年 JiangYibo. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LeftViewController.h"
#import "HomeViewController.h"

@interface MainViewController : UIViewController

- (void)useDrawer;

- (instancetype)initWithLeftViewController:(LeftViewController *)leftVC rootViewController:(UINavigationController *)rootVC;

@end
