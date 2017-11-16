//
//  NSObject+keyValue2object.h
//  JFExtension
//
//  Created by linjianfang on 2017/1/17.
//  Copyright © 2017年 linjianfang. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JFKeyValue <NSObject>

@optional
+ (NSDictionary *) objectClassInArray;
+ (NSDictionary *)replacedKeyFromPropertyName;

@end

@interface NSObject (keyValue2object)<JFKeyValue>
+ (instancetype)objectWithKeyValues:(id)keyValues;


@end
