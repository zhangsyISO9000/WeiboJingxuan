//
//  QKMainViewController.m
//  WeiboJingxuan
//
//  Created by dc-macbook on 16/2/26.
//  Copyright © 2016年 乾坤翰林. All rights reserved.
//

#import "QKMainViewController.h"
#import "QKHomeViewController.h"
#import "QKAttentionViewController.h"
#import "QKNewCardViewController.h"
#import "QKProfileViewController.h"
#import "QKTabBar.h"

@interface QKMainViewController ()

@end

@implementation QKMainViewController
+(void)initialize{
    UITabBarItem * appearance = [UITabBarItem appearance];
    NSMutableDictionary * attrDic = [NSMutableDictionary dictionary];
    attrDic[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    [appearance setTitleTextAttributes:attrDic forState:UIControlStateNormal];
    [[UITabBar appearance]setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 替换tabbar
    [self setValue:[[QKTabBar alloc] init] forKeyPath:@"tabBar"];
    [self setupChildViewControllers];
    
}

-(void)setupChildViewControllers
{
    QKHomeViewController * home = [[QKHomeViewController alloc]init];
    [self addChildViewController:home andTitle:@"精华" andImageName:@"tabBar_essence_icon" andSelectedImage:@"tabBar_essence_click_icon"];
    QKNewCardViewController * newCard = [[QKNewCardViewController alloc]init];
    [self addChildViewController:newCard andTitle:@"新帖" andImageName:@"tabBar_new_icon" andSelectedImage:@"tabBar_new_click_icon"];
    QKAttentionViewController * attention = [[QKAttentionViewController alloc]init];
    [self addChildViewController:attention andTitle:@"关注" andImageName:@"tabBar_friendTrends_icon" andSelectedImage:@"tabBar_friendTrends_click_icon"];
    QKProfileViewController * profile = [[QKProfileViewController alloc]init];
    [self addChildViewController:profile andTitle:@"我的" andImageName:@"tabBar_me_icon" andSelectedImage:@"tabBar_me_click_icon"];
    
}

-(void)addChildViewController:(UIViewController *)vc andTitle:(NSString *)title andImageName:(NSString *)imageName andSelectedImage:(NSString *)selectedImage
{
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:vc];
    
    [self addChildViewController:nav];
    
}


@end
