//
//  YZTabBar.h
//  YZTabbarViewController
//
//  Created by 蓝云 on 2017/5/24.
//  Copyright © 2017年 yangzhi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^YZTabBarBlock)();

@interface YZTabBar : UITabBar

@property (nonatomic, copy) YZTabBarBlock block;


@end
