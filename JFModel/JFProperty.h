//
//  JFProperty.h
//  JFExtension
//
//  Created by linjianfang on 2017/1/17.
//  Copyright © 2017年 linjianfang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@class JFPropertyType;
@interface JFProperty : NSObject

/** 成员属性的名字 */
@property (nonatomic, readonly) NSString *name;
/** 成员属性的类型 */
@property (nonatomic, readonly) JFPropertyType *type;

+ (instancetype)propertyWithProperty:(objc_property_t)property;

@end
