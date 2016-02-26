//
//  QKNavigationController.m
//  WeiboJingxuan
//
//  Created by dc-macbook on 16/2/26.
//  Copyright © 2016年 乾坤翰林. All rights reserved.
//

#import "QKNavigationController.h"

@interface QKNavigationController ()

@end

@implementation QKNavigationController

+(void)initialize
{
    UINavigationBar * appearance = [UINavigationBar appearance];
    [appearance setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    [appearance setTitleTextAttributes:@{NSFontAttributeName : [UIFont boldSystemFontOfSize:15]}];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count) {
        viewController.hidesBottomBarWhenPushed = YES;
        
        UIButton * button = [[UIButton alloc] init];
        [button setTitle:@"返回" forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        button.bounds = CGRectMake(0, 0, 70, 30);
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];

    }
    [super pushViewController:viewController animated:YES];
}

-(void)back
{
    [self popViewControllerAnimated:YES];
}

@end
