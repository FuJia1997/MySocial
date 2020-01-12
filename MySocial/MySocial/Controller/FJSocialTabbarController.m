//
//  FJSocialTabbarController.m
//  Mysocial
//
//  Created by yons on 2020/1/9.
//  Copyright © 2020年 FuJia. All rights reserved.
//

#import "FJSocialTabbarController.h"
#import "FJPersonalPageViewController.h"
#import "FJContactPageViewController.h"
#import "FJMessagePageViewController.h"
#import "FJActivityPageViewController.h"

@interface FJSocialTabbarController ()

@end

@implementation FJSocialTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
}

- (void) createUI {
    //消息
    FJMessagePageViewController *messageController = [FJMessagePageViewController new];
    
    UINavigationController *messageNVC = [[UINavigationController alloc] initWithRootViewController:messageController];
    messageController.navigationItem.title = @"消息";
    messageNVC.tabBarItem.image = [UIImage imageNamed:@"消息.png"];
    messageNVC.tabBarItem.title = @"消息";
    
    [self addChildViewController:messageNVC];
    
    //联系人
    FJContactPageViewController *contactController = [FJContactPageViewController new];
    
    UINavigationController *contactNVC = [[UINavigationController alloc] initWithRootViewController:contactController];
    contactController.navigationItem.title = @"联系人";
    contactNVC.tabBarItem.image = [UIImage imageNamed:@"联系人.png"];
    contactNVC.tabBarItem.title = @"联系人";
    
    [self addChildViewController:contactNVC];
    
    //活动
    FJActivityPageViewController *activityController = [FJActivityPageViewController new];
    
    UINavigationController *activityNVC = [[UINavigationController alloc] initWithRootViewController:activityController];
    activityController.navigationItem.title = @"活动";
    activityNVC.tabBarItem.image = [UIImage imageNamed:@"活动.png"];
    activityNVC.tabBarItem.title = @"活动";
    
    [self addChildViewController:activityNVC];
    
    //个人中心
    FJPersonalPageViewController *personalController = [FJPersonalPageViewController new];
    
    UINavigationController *personalNVC = [[UINavigationController alloc] initWithRootViewController:personalController];
    personalController.navigationItem.title = @"个人中心";
    personalNVC.tabBarItem.image = [UIImage imageNamed:@"个人中心.png"];
    personalNVC.tabBarItem.title = @"个人中心";
    
    [self addChildViewController:personalNVC];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

@end
