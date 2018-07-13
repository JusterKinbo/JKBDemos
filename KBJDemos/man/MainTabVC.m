//
//  MainTabVC.m
//  KBJDemos
//
//  Created by Juster on 2018/6/30.
//  Copyright © 2018年 Juster. All rights reserved.
//

#import "MainTabVC.h"
#import "HomeNavVC.h"
#import "HomeRootViewController.h"
#import "ContactNavVC.h"
#import "ContactRootViewController.h"
#import "DiscoverNavVC.h"
#import "DiscoverRootViewController.h"
#import "MineNavVC.h"
#import "MineRootViewController.h"

@interface MainTabVC ()

@end

@implementation MainTabVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // home
    HomeRootViewController * homeVC = [[HomeRootViewController alloc]init];
    HomeNavVC * homeNav = [[HomeNavVC alloc]initWithRootViewController:homeVC];
    UITabBarItem * homeTabBarItem = [[UITabBarItem alloc]initWithTitle:@"首页" image:[UIImage imageNamed:@"home_un_selected"] tag:0];
    homeTabBarItem.selectedImage = [UIImage imageNamed:@"home_selected"];
    homeNav.tabBarItem = homeTabBarItem;
    
    // contacts
    ContactRootViewController * contactVC = [[ContactRootViewController alloc]init];
    ContactNavVC * contactNav = [[ContactNavVC alloc]initWithRootViewController:contactVC];
    UITabBarItem * contactTabBarItem = [[UITabBarItem alloc]initWithTitle:@"联系人" image:[UIImage imageNamed:@"contacts_un_selected"] tag:1];
    contactTabBarItem.selectedImage = [UIImage imageNamed:@"contacts_selected"];
    contactNav.tabBarItem = contactTabBarItem;
    
    // discover
    DiscoverRootViewController * discoverVC = [[DiscoverRootViewController alloc]init];
    DiscoverNavVC * discoverNav = [[DiscoverNavVC alloc]initWithRootViewController:discoverVC];
    UITabBarItem * discoverTabBarItem = [[UITabBarItem alloc]initWithTitle:@"发现" image:[UIImage imageNamed:@"discover_un_selected"] tag:2];
    discoverTabBarItem.selectedImage = [UIImage imageNamed:@"discover_selected"];
    discoverNav.tabBarItem = discoverTabBarItem;
    
    // mine
    MineRootViewController * mineVC = [[MineRootViewController alloc]init];
    MineNavVC * mineNav = [[MineNavVC alloc]initWithRootViewController:mineVC];
    UITabBarItem * mineTabBarItem = [[UITabBarItem alloc]initWithTitle:@"我" image:[UIImage imageNamed:@"mine_un_selected"] tag:3];
    mineTabBarItem.selectedImage = [UIImage imageNamed:@"mine_selected"];
    mineNav.tabBarItem = mineTabBarItem;
    
    // main tab vc
    
    NSArray *array = @[homeNav,contactNav,discoverNav,mineNav];
    self.viewControllers = array;
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
