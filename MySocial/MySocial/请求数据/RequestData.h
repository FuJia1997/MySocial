//
//  RequestData.h
//  Mysocial
//
//  Created by yons on 2020/1/11.
//  Copyright © 2020年 FuJia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestData : NSObject

@property (nonatomic, strong)NSDictionary *modelDic;

+ (void)requestDataWithUrlString:(NSString *)urlString success:(void (^)(NSDictionary *))success error:(void (^)())error;

@end
