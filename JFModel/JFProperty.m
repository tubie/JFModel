//
//  JFProperty.m
//  JFExtension
//
//  Created by linjianfang on 2017/1/17.
//  Copyright © 2017年 linjianfang. All rights reserved.
//

#import "JFProperty.h"
#import "JFPropertyType.h"
@implementation JFProperty
+ (instancetype)propertyWithProperty:(objc_property_t)property{
    return  [[JFProperty alloc] initWithProperty:property];
}


- (instancetype)initWithProperty:(objc_property_t)property{
    if (self = [super init]) {
        _name = @(property_getName(property));
        
        _type = [JFPropertyType propertyTypeWithAttributeString:@(property_getAttributes(property))];;
    }
    return self;
}


@end
