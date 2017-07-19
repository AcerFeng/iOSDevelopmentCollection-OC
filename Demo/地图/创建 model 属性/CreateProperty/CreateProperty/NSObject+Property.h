//
//  NSObject+Property.h
//  CreateProperty
//
//  Created by lanfeng on 17/2/3.
//  Copyright © 2017年 lanfeng. All rights reserved.
//  通过解析字典自动生成属性代码

#import <Foundation/Foundation.h>

@interface NSObject (Property)
+ (void)createPropertyCodeWithDict:(NSDictionary *)dict;
@end
