//
//  JFPropertyType.m
//  JFExtension
//
//  Created by linjianfang on 2017/1/17.
//  Copyright © 2017年 linjianfang. All rights reserved.
//

#import "JFPropertyType.h"
#import "JFExtensionConst.h"
#import "NSObject+property.h"
#import "JFProperty.h"
@implementation JFPropertyType
static NSMutableDictionary *cachedTypes_;

+ (void)load
{
    cachedTypes_ = [NSMutableDictionary dictionary];
}

+ (instancetype)propertyTypeWithAttributeString:(NSString *)string{
    return [[JFPropertyType alloc] initWithTypeString:string];
}

- (instancetype)initWithTypeString:(NSString *)string
{
    if (self = [super init])
    {
        NSUInteger loc = 1;
        NSUInteger len = [string rangeOfString:@","].location - loc;
        NSString *typeCode = [string substringWithRange:NSMakeRange(loc, len)];
        
//        [self getTypeCode:typeCode];
        if (!cachedTypes_[typeCode])
        {
            self = [super init];
            [self getTypeCode:typeCode];
            cachedTypes_[typeCode] = self;
        }
    }
    return self;
}

- (void)getTypeCode:(NSString *)code
{
    if ([code isEqualToString:JFPropertyTypeId]) {
        _idType = YES;
    } else if (code.length > 3 && [code hasPrefix:@"@\""]) {
        // 去掉@"和"，截取中间的类型名称
        _code = [code substringWithRange:NSMakeRange(2, code.length - 3)];
        _typeClass = NSClassFromString(_code);
        _numberType = (_typeClass == [NSNumber class] || [_typeClass isSubclassOfClass:[NSNumber class]]);
        // 判断是否是模型类
        _fromFoundation = [NSObject isClassFromFoundation:_typeClass];
    }
    
    // 是否为数字类型
    NSString *lowerCode = code.lowercaseString;
    NSArray *numberTypes = @[JFPropertyTypeInt, JFPropertyTypeShort, JFPropertyTypeBOOL1, JFPropertyTypeBOOL2, JFPropertyTypeFloat, JFPropertyTypeDouble, JFPropertyTypeLong, JFPropertyTypeChar];
    if ([numberTypes containsObject:lowerCode]) {
        _numberType = YES;
        
        if ([lowerCode isEqualToString:JFPropertyTypeBOOL1]
            || [lowerCode isEqualToString:JFPropertyTypeBOOL2]) {
            _boolType = YES;
        }
    }
}



@end
