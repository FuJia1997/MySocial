//
//  RequestData.h
//  Mysocial
//
//  Created by yons on 2020/1/11.
//  Copyright © 2020年 FuJia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestData : NSObject

+ (void)requestDataWithUrlString:(NSString *)urlString Data:(NSMutableDictionary **)dic;

@end
