//
//  FJActivityPageViewController.m
//  Mysocial
//
//  Created by yons on 2020/1/10.
//  Copyright © 2020年 FuJia. All rights reserved.
//

#import "FJModel.h"
#import "RequestData.h"
#import "FJActivityPageViewController.h"

@interface FJActivityPageViewController ()

@property (nonatomic, strong) FJModel *model;

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
    [RequestData requestDataWithUrlString:@"http://127.0.0.1/demo.json" success:^(NSDictionary *dic) {
        self.model = [FJModel modelWithdic:[NSDictionary dictionaryWithDictionary:dic]];
        NSLog(@"请求到的数据: %@", self.model.dataDic);
    } error:^{
        NSLog(@"请求出错");
    }];
}

@end
