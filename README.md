# JFModel

## how  to use JFModel【怎么使用】

## <a id="Installation"></a> Installation【安装】

### From CocoaPods【使用CocoaPods】

```ruby
pod 'JFModel'
```

## Manually【手动】
- Drag all source files under floder JFModel to your project.【将JFModel文件夹中的所有源代码拽入项目中】
- Import the main header file：#import "JFModel"
【导入主头文件：#import "JFModel"】



# Examples【示例】

### Easy Dictionary to Model 【简单的字典转模型】
```
 NSDictionary *dict = @{
                           @"name" : @"linjianfang",
                           @"icon" : @"jf.png",
                           @"age" : @"20",
                           @"height" : @1.75,
                           @"money" : @"1000009.9999",
                           @"sex" : @(SexFemale),
                           @"gay" : @"true",
                           };
    
    User *user =  [User objectWithKeyValues:dict];
    NSLog(@"name=%@, icon=%@, age=%zd, height=%@, money=%@, sex=%d, gay=%d", user.name, user.icon, user.age, user.height, user.money, user.sex, user.gay);

```

### Easy Json to Model 【Json转模型】
```
 
    NSString *jsonString = @"{\"name\":\"Jack\", \"icon\":\"lufy.png\", \"age\":20}";
    User *user = [User objectWithKeyValues:jsonString];
    NSLog(@"name=%@, icon=%@, age=%d", user.name, user.icon, user.age);
```

### Complex Dictionary to Model   【复杂的字典转模型转模型 】 
```
    NSDictionary *dict = @{
                           @"text" : @"是啊，今天天气确实不错！",
                           
                           @"user" : @{
                                   @"name" : @"Jack",
                                   @"icon" : @"lufy.png"
                                   },
                           
                           @"retweetedStatus" : @{
                                   @"text" : @"今天天气真不错！",
                                   
                                   @"user" : @{
                                           @"name" : @"Rose",
                                           @"icon" : @"nami.png"
                                           }
                                   }
                           };
    
   
    Status *status = [Status objectWithKeyValues:dict];
    

    NSString *text = status.text;
    NSString *name = status.user.name;
    NSString *icon = status.user.icon;
    NSLog(@"text=%@, name=%@, icon=%@", text, name, icon);
    
    
    NSString *text2 = status.retweetedStatus.text;
    NSString *name2 = status.retweetedStatus.user.name;
    NSString *icon2 = status.retweetedStatus.user.icon;
    NSLog(@"text2=%@, name2=%@, icon2=%@", text2, name2, icon2);
    
    
```
### Dictionary Array to Model Array 【字典数组转模型】 
 ```
  
    NSDictionary *dict = @{
                           @"statuses" : @[
                                   @{
                                       @"text" : @"今天天气真不错！",
                                       
                                       @"user" : @{
                                               @"name" : @"Rose",
                                               @"icon" : @"nami.png"
                                               }
                                       },
                                   
                                   @{
                                       @"text" : @"明天去旅游了",
                                       
                                       @"user" : @{
                                               @"name" : @"Jack",
                                               @"icon" : @"lufy.png"
                                               }
                                       }
                                   
                                   ],
                           
                           @"ads" : @[
                                   @{
                                       @"image" : @"ad01.png",
                                       @"url" : @"http://www.baidu.com"
                                       },
                                   @{
                                       @"image" : @"ad02.png",
                                       @"url" : @"http://www.maidanxia.com"
                                       }
                                   ],
                           
                           @"totalNumber" : @"2014",
                           @"previousCursor" : @"13476589",
                           @"nextCursor" : @"13476599"
                           };
    
    
    
    
    StatusResult *result = [StatusResult objectWithKeyValues:dict];
    
    
    
   
    NSLog(@"totalNumber=%@, previousCursor=%lld, nextCursor=%lld", result.totalNumber, result.previousCursor, result.nextCursor);
    
   
    for (Status *status in result.statuses) {
        NSString *text = status.text;
        NSString *name = status.user.name;
        NSString *icon = status.user.icon;
        NSLog(@"text=%@, name=%@, icon=%@", text, name, icon);
    }
    
    
    for (Ad *ad in result.ads) {
        NSLog(@"image=%@, url=%@", ad.image, ad.url);
    }
 ```
 
 
# 未完待续 。。。
