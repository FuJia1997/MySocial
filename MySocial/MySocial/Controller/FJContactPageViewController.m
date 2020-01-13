//
//  FJContactPageViewController.m
//  Mysocial
//
//  Created by yons on 2020/1/9.
//  Copyright © 2020年 FuJia. All rights reserved.
//

#import "Masonry.h"
#import "FJModel.h"
#import "RequestData.h"
#import "FJContactPageViewController.h"

@interface FJContactPageViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) FJModel *model;

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation FJContactPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置tableview
    [self.view addSubview:self.tableView];
    
    //请求数据
    [self requestData];
}

- (void)setModel:(FJModel *)model {
    _model = model;
    
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *array = self.model.dataDic[@"friends"];
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"ContactCell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    NSArray *array = self.model.dataDic[@"friends"];
    cell.textLabel.text = array[indexPath.row][@"name"];
    
    return cell;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (void)requestData {
    [RequestData requestDataWithUrlString:@"http://127.0.0.1/contact.json" success:^(NSDictionary *dic) {
        self.model = [FJModel modelWithdic:dic];
        NSLog(@"联系人数据：%@", self.model.dataDic[@"friends"]);
        
        //[self.tableView reloadData];
    } error:^{
        NSLog(@"请求数据出错");
    }];
}



@end
