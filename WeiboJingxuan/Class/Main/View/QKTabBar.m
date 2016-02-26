//
//  QKTabBar.m
//  WeiboJingxuan
//
//  Created by dc-macbook on 16/2/26.
//  Copyright © 2016年 乾坤翰林. All rights reserved.
//

#import "QKTabBar.h"
@interface QKTabBar()
@property(nonatomic,weak)UIButton * plusBtn;
@end

@implementation QKTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIButton * plusBtn = [[UIButton alloc]init];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [self addSubview:plusBtn];
        [plusBtn sizeToFit];
        self.plusBtn = plusBtn;
        [plusBtn addTarget:self action:@selector(tapPlusBtn) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}

-(void)tapPlusBtn
{
    NSLog(@"点击了plusbutton");
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat width = self.xmg_width / 5;
    
    self.plusBtn.xmg_centerX = self.xmg_centerX;
    
    int index = 0;
    
    for (UIControl * control in self.subviews) {
        if ([control isKindOfClass:[UIButton class]]||![control isKindOfClass:[UIControl class]]) {
            continue;
        }
        control.xmg_x = index > 1 ? width * (index + 1) : width * index;
        control.xmg_width = width;
        
        index++;
    }
    
}



@end
