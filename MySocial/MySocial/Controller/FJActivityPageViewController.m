//
//  FJActivityPageViewController.m
//  Mysocial
//
//  Created by yons on 2020/1/10.
//  Copyright © 2020年 FuJia. All rights reserved.
//

#import "RequestData.h"
#import "FJActivityPageViewController.h"

@interface FJActivityPageViewController ()

@property (nonatomic, strong) UIButton *requestButton;

@end

@implementation FJActivityPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.requestButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIButton *)requestButton {
    if (!_requestButton) {
        _requestButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _requestButton.frame = CGRectMake(20, 200, 100, 30);
        [_requestButton setTitle:@"请求数据" forState:UIControlStateNormal];
        [_requestButton addTarget:self action:@selector(requestData) forControlEvents:UIControlEventTouchUpInside];
    }
    return _requestButton;
}

- (void) requestData {
//    NSDictionary *dic = [NSDictionary dictionaryWithDictionary:[RequestData requestDataWithUrlString:@"http://127.0.0.1/demo.json"]];
//    NSLog(@"%@", dic[@"name"]);
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [RequestData requestDataWithUrlString:@"http://127.0.0.1/demo.json" Data:&dic];
    NSLog(@"%@", dic);
}

@end
