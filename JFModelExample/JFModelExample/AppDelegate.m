//
//  AppDelegate.m
//  JFModelExample
//
//  Created by linjianfang on 2017/11/16.
//  Copyright © 2017年 linjianfang. All rights reserved.
//

#import "AppDelegate.h"
#import "JFModel.h"
#import "User.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSDictionary *dict = @{
                           @"name" : @"linjianfang",
                           @"icon" : @"jf.png",
                           @"age" : @"20",
                           @"height" : @1.75,
                           @"money" : @"1000009.9999",
                           //                           @"sex" : @(SexFemale),
                           @"gay" : @"true",
                           };
    
    User *user =  [User objectWithKeyValues:dict];
    NSLog(@"name=%@, icon=%@, age=%zd, height=%@, money=%@, sex=%d, gay=%d", user.name, user.icon, user.age, user.height, user.money, user.sex, user.gay);
    
    return YES;
}





@end
