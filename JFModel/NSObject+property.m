//
//  NSObject+property.m
//  JFExtension
//
//  Created by linjianfang on 2017/1/16.
//  Copyright © 2017年 linjianfang. All rights reserved.
//

#import "NSObject+property.h"
#import <objc/runtime.h>
#import "JFProperty.h"
#import "JFPropertyType.h"
typedef struct property_t {
    const char *name;
    const char *attributes;
} *propertyStruct;

@implementation NSObject (property)
static NSSet *foundationClasses_;
static NSMutableDictionary *cachedProperties_;

+ (void)load
{
    cachedProperties_ = [NSMutableDictionary dictionary];
}

+ (NSSet *)foundationClasses
{
    if (foundationClasses_ == nil) {
        
        foundationClasses_ = [NSSet setWithObjects:
                              [NSURL class],
                              [NSDate class],
                              [NSValue class],
                              [NSData class],
                              [NSArray class],
                              [NSDictionary class],
                              [NSString class],
                              [NSAttributedString class], nil];
    }
    return foundationClasses_;
}

+ (BOOL)isClassFromFoundation:(Class)c{
    if (c == [NSObject class]) return YES;
    __block BOOL result = NO;
    [[self foundationClasses] enumerateObjectsUsingBlock:^(Class foundationClass, BOOL *stop) {
        if ([c isSubclassOfClass:foundationClass]) {
            result = YES;
            *stop = YES;
        }
    }];
    return result;
}

+ (NSArray *)properties
{
    NSMutableArray *cachedProperties = cachedProperties_[NSStringFromClass(self)];
    
    if (!cachedProperties) {
        
        //        NSLog(@"%@调用了properties方法",[self class]);
        
        cachedProperties = [NSMutableArray array];
        // 1.获得所有的属性
        unsigned int outCount = 0;
        objc_property_t *properties = class_copyPropertyList(self, &outCount);
        
        for (int i = 0; i < outCount; i++) {
            objc_property_t property = properties[i];
            
            JFProperty *propertyObj = [JFProperty propertyWithProperty:property];
            
            [cachedProperties addObject:propertyObj];
        }
        
        free(properties);
        
        cachedProperties_[NSStringFromClass(self)] = cachedProperties;
    }
    
    return cachedProperties;
}


@end
