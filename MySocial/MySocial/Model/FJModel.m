//
//  FJModel.m
//  Mysocial
//
//  Created by yons on 2020/1/13.
//  Copyright © 2020年 FuJia. All rights reserved.
//

#import "FJModel.h"

@implementation FJModel

+ (instancetype)modelWithdic:(NSDictionary *)dic {
    FJModel *model = [[[self class] alloc] init];
    model.dataDic = dic;
    
    return model;
}

@end
