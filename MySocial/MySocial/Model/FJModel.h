//
//  FJModel.h
//  Mysocial
//
//  Created by yons on 2020/1/13.
//  Copyright © 2020年 FuJia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FJModel : NSObject

@property (nonatomic, strong) NSDictionary *dataDic;

+ (instancetype)modelWithdic:(NSDictionary *)dic;

@end
