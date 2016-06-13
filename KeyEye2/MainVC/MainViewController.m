//
//  MainViewController.m
//  KeyEye2
//
//  Created by 蒋一博 on 16/5/28.
//  Copyright © 2016年 JiangYibo. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@property (strong ,nonatomic) LeftViewController *leftViewController;

@property (strong ,nonatomic) UINavigationController *rootViewController;

@property (nonatomic ,strong) UIScreenEdgePanGestureRecognizer *screenEdgePan;

@property (nonatomic ,strong) UIButton *maskButton;

@end

@implementation MainViewController

- (instancetype)initWithLeftViewController:(LeftViewController *)leftVC rootViewController:(UINavigationController *)rootVC{
 
    self = [super init];
    if (self) {
        _leftViewController = leftVC;
        _rootViewController = rootVC;
    }
    return self;
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initializeDataSource];
    
    [self initializeInterface];
    
}

- (void)initializeDataSource{
    

}

- (void)initializeInterface{

    [self addChildViewController:self.leftViewController];
    self.leftViewController.view.frame = CGRectMake(0, 0, 300, [UIScreen mainScreen].bounds.size.height);
    [self addChildViewController:self.rootViewController];
    
    [self.view addGestureRecognizer:self.screenEdgePan];

}

#pragma mark -- 侧栏按键及手势操作
- (void)useDrawer {
    
    if (self.rootViewController.view.frame.origin.x == 0) {
        [self.rootViewController.view addSubview:self.maskButton];
        self.maskButton.alpha = 0;
        self.leftViewController.view.transform = CGAffineTransformMakeScale(0.8, 0.8);
        [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.9 initialSpringVelocity:4 options:0 animations:^{
            self.leftViewController.view.transform = CGAffineTransformIdentity;
            self.rootViewController.view.frame = CGRectMake(300, 0, self.rootViewController.view.bounds.size.width, self.rootViewController.view.bounds.size.height);
            self.leftViewController.view.frame = CGRectMake(0, 0, 350, [UIScreen mainScreen].bounds.size.height);
            self.maskButton.alpha = 1;
            
        } completion:^(BOOL finished) {
        }];
        
    }else{
        
        [UIView animateWithDuration:0.3 delay:0 options:0 animations:^{
            self.rootViewController.view.frame = CGRectMake(0, 0, self.rootViewController.view.bounds.size.width, self.rootViewController.view.bounds.size.height);
            self.maskButton.alpha = 0;
            self.leftViewController.view.transform = CGAffineTransformMakeScale(0.8, 0.8);
        } completion:^(BOOL finished) {
            self.leftViewController.view.transform = CGAffineTransformIdentity;
            self.leftViewController.view.frame = CGRectMake(0, 0, 300, [UIScreen mainScreen].bounds.size.height);
            [self.maskButton removeFromSuperview];
        }];
    }
}
#pragma mark - 手势
- (void)edgePanDrawer:(UIScreenEdgePanGestureRecognizer *)gesture{
    
    if (gesture.state == UIGestureRecognizerStateBegan) {
        //向左滑则return掉
        CGPoint velocity = [gesture velocityInView: self.view];
        if (velocity.x < 0) {
            return;
        }
    }else if(gesture.state == UIGestureRecognizerStateChanged){
        CGPoint translation = [gesture translationInView:self.view];
        CGFloat rate = translation.x / CGRectGetWidth(self.view.bounds);//拖拉距离比例
        CGFloat translation_x = 300 * rate;
        self.rootViewController.view.frame = CGRectMake(translation_x, 0, CGRectGetWidth(self.rootViewController.view.bounds), CGRectGetHeight(self.rootViewController.view.bounds));
        self.leftViewController.view.transform = CGAffineTransformMakeScale(0.8 + (0.2 *rate), 0.8 + (0.2 *rate));
        self.maskButton.alpha = rate;
        self.leftViewController.view.alpha = 0.5 + 0.5 * rate;
        
    }else if(gesture.state == UIGestureRecognizerStateCancelled || gesture.state == UIGestureRecognizerStateEnded){
        
        CGPoint translation = [gesture translationInView:self.view];
        CGFloat rate = translation.x / CGRectGetWidth(self.view.bounds);//拖拉距离比例
        
        if (rate >= 0.5) {
            //打开
            [self.rootViewController.view addSubview:self.maskButton];
            self.maskButton.alpha = 0;
            [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.9 initialSpringVelocity:4 options:0 animations:^{
                self.leftViewController.view.transform = CGAffineTransformIdentity;
                self.rootViewController.view.frame = CGRectMake(300, 0, self.rootViewController.view.bounds.size.width, self.rootViewController.view.bounds.size.height);
                self.leftViewController.view.frame = CGRectMake(0, 0, 300, [UIScreen mainScreen].bounds.size.height);
                self.leftViewController.view.alpha = 1;
                self.maskButton.alpha = 1;
            } completion:^(BOOL finished) {
            }];
            
        }else{
            //关闭
            [UIView animateWithDuration:0.3 delay:0.06 options:0 animations:^{
                
                self.rootViewController.view.frame = CGRectMake(0, 0, self.rootViewController.view.bounds.size.width, self.rootViewController.view.bounds.size.height);
                self.maskButton.alpha = 0;
                self.leftViewController.view.transform = CGAffineTransformMakeScale(0.8, 0.8);
            } completion:^(BOOL finished) {
                self.leftViewController.view.transform = CGAffineTransformIdentity;
                self.rootViewController.view.frame = CGRectMake(0, 0, 300, [UIScreen mainScreen].bounds.size.height);
            }];
            [self.maskButton removeFromSuperview];
        }
    }
}


#pragma mark -- Getter
- (void)addChildViewController:(UIViewController *)childController{
    [super addChildViewController:childController];
    [self.view addSubview:childController.view];
    [childController didMoveToParentViewController:self];
}

- (UIScreenEdgePanGestureRecognizer *)screenEdgePan{
    if (!_screenEdgePan) {
        
        _screenEdgePan = [[UIScreenEdgePanGestureRecognizer alloc]initWithTarget:self action:@selector(edgePanDrawer:)];
        _screenEdgePan.edges = UIRectEdgeLeft;
        
    }
    
    return _screenEdgePan;
}

- (UIButton *)maskButton {
    if (!_maskButton) {
        _maskButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _maskButton.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        _maskButton.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
        [_maskButton addTarget:self action:@selector(useDrawer) forControlEvents:UIControlEventTouchUpInside];
    }
    return _maskButton;
}



@end
