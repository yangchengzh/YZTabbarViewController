//
//  YZTabBarViewController.m
//  YZTabbarViewController
//
//  Created by 蓝云 on 2017/5/24.
//  Copyright © 2017年 yangzhi. All rights reserved.
//

#import "YZTabBarViewController.h"
#import "InformationViewController.h"
#import "LinkmanViewController.h"
#import "DynamicViewController.h"
#import "HomeViewController.h"
#import "YZTabBar.h"

@interface YZTabBarViewController ()<UIActionSheetDelegate>

@end

@implementation YZTabBarViewController

- (void)viewWillAppear:(BOOL)animated
{
    //tabbar背景色
    [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]];
    //    [UITabBar appearance].translucent = YES;//半透明效果
    //字体设置
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       [UIColor lightGrayColor], NSForegroundColorAttributeName,
                                                       nil] forState:UIControlStateNormal];
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       [UIColor blueColor], NSForegroundColorAttributeName,
                                                       nil] forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    [self addChildViewController:[[InformationViewController alloc] init] title:@"消息" image:@"5-1" selectedImage:@"5-2"];
    [self addChildViewController:[[LinkmanViewController alloc] init] title:@"联系人" image:@"6-1" selectedImage:@"6-2"];
    [self addChildViewController:[[DynamicViewController alloc] init] title:@"动态" image:@"7-1" selectedImage:@"7-2"];
    [self addChildViewController:[[HomeViewController alloc] init] title:@"我的" image:@"8-1" selectedImage:@"8-2"];
    
    [self setTabBar];
    
    
    
}

- (void)setTabBar {
    YZTabBar *tabBar = [[YZTabBar alloc] init];
    tabBar.block = ^{
        UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                      initWithTitle:@"title"
                                      delegate:self
                                      cancelButtonTitle:@"取消"
                                      destructiveButtonTitle:@"确定"
                                      otherButtonTitles:nil];
        actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
        [actionSheet showInView:self.view];
    };
    
    [self setValue:tabBar forKeyPath:@"tabBar"];
}


- (void)addChildViewController:(UIViewController *)childController title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    UINavigationController *navC = [[UINavigationController alloc] initWithRootViewController:childController];
    navC.tabBarItem.title = title;
    UIImage *timage = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navC.tabBarItem.image = timage;
    navC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:navC];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
