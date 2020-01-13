//
//  RequestData.m
//  Mysocial
//
//  Created by yons on 2020/1/11.
//  Copyright © 2020年 FuJia. All rights reserved.
//

#import "RequestData.h"

@interface RequestData()

@end

@implementation RequestData

+ (void)requestDataWithUrlString:(NSString *)urlString success:(void (^)(NSDictionary *))success error:(void (^)())error {
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (connectionError) {
            NSLog(@"连接错误 %@", connectionError);
        }
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        if (httpResponse.statusCode == 200
            || httpResponse.statusCode == 304) {
            //解析数据 data存储的是json形式的字符串
            
            //json序列化：把对象转换成json形式的字符串
            //json逆序列化：把json形式的字符串转换成oc对象
            NSError *error;
            //解析的json字符串，返回的oc对象可能是数组或字典
            //otions取值 0                              容器不可变
            //          NSJSONReadingMutableContainers 容器可变
            //          NSJSONReadingMutableLeaves     ios7以后失效
            //          NSJSONReadingAllowFragments    允许不是json形式的字符串
            id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            if (error) {
                NSLog(@"解析json出错 %@", error);
                return;
            }
            NSDictionary *dic = (NSDictionary *)json;
            //调用成功的回调
            if (success) {
                success(dic);
            }
        } else {
            NSLog(@"服务器内部错误");
            //调用失败的回调
            if (error) {
                error();
            }
        }
    }];
}

- (NSDictionary *)requestDataWithUrlString:(NSString *)urlString{
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (connectionError) {
            NSLog(@"连接错误 %@", connectionError);
        }
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        if (httpResponse.statusCode == 200
            || httpResponse.statusCode == 304) {
            //解析数据 data存储的是json形式的字符串
            
            //json序列化：把对象转换成json形式的字符串
            //json逆序列化：把json形式的字符串转换成oc对象
            NSError *error;
            //解析的json字符串，返回的oc对象可能是数组或字典
            //otions取值 0                              容器不可变
            //          NSJSONReadingMutableContainers 容器可变
            //          NSJSONReadingMutableLeaves     ios7以后失效
            //          NSJSONReadingAllowFragments    允许不是json形式的字符串
            id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            if (error) {
                NSLog(@"解析json出错 %@", error);
                return;
            }
            NSDictionary *dic = (NSDictionary *)json;
            self.modelDic = dic.copy;
        } else {
            NSLog(@"服务器内部错误");
        }
    }];
    return self.modelDic;
}

@end
