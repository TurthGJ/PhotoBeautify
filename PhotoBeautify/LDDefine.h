
//
//  Header.h
//  LoveDay
//
//  Created by GJ on 16/4/7.
//  Copyright © 2016年 GJ. All rights reserved.
//

#ifndef LDDefine_h
#define LDDefine_h

#ifdef DEBUG
#define DELOG(...) NSLog (__VA_ARGS__)
#define DELOGLINEINFO NSLog(@"%s, At line %d memory=%4f",__FUNCTION__,__LINE__,[[UIDevice currentDevice] availableMemory]);
#else
#define DELOG(...)
#define DELOGLINEINFO
#endif


// 切换(测试/正式)服务器
#define ENABLE_TEST_SERVER  1

#define HASNEWVERSION @"HasNewVersion" //是否有新版本的Key
#define TOKEN_KEY @"deviceTokenKey" //推送的token的缓存Key
#define ISFIRST_KEY @"firstOpen"    //是否第一次打开的缓存key

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
// 获取RGB颜色
#define RGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define RGB(r,g,b) RGBA((r),(g),(b),1.0f)
//定义UIImage对象
#define IMAGE(A) [UIImage imageNamed:A]

#pragma mark app常用的统一的颜色

//清除背景色
#define CLEARCOLOR [UIColor clearColor]

//导航栏的颜色
#define MY_COLOR_NAVIGATION [UIColor colorWithRed:59/255.0 green:203/255.0 blue:251/255.0 alpha:1.0]
//app的主体的颜色
#define MY_COLOR_MAIN [UIColor colorWithRed:24.0/255.0 green:180.0/255.0 blue:237.0/255.0 alpha:1.0]
//app的次主体的颜色，用于菜单栏的字体等
#define MY_COLOR_MENU [UIColor colorWithRed:0.0 green:160.0/255.0 blue:224.0/255.0 alpha:1.0]
//view的背景颜色
#define MY_COLOR_BACKGROUND [UIColor colorWithRed:244.0/255.0 green:244.0/255.0 blue:244.0/255.0 alpha:1.0]
//分隔线的颜色
#define MY_COLOR_LINE [UIColor colorWithRed:221.0/255.0 green:221.0/255.0 blue:221.0/255.0 alpha:1.0]
//蓝色线的颜色
#define MY_COLOR_BLUE_LINE [UIColor colorWithRed:31.0/255.0 green:186.0/255.0 blue:243.0/255.0 alpha:1.0]


//深黑,常用于标题
#define MY_COLOR_DEEP_BLACK [UIColor colorWithRed:65.0/255.0 green:67.0/255.0 blue:69.0/255.0 alpha:1.0]
//灰黑,客户端通用黑色
#define MY_COLOR_GRAY_BLACK [UIColor colorWithRed:64.0/255.0 green:65.0/255.0 blue:65.0/255.0 alpha:1.0]
//灰色,客户端通用灰色
#define MY_COLOR_GRAY [UIColor colorWithRed:137.0/255.0 green:137.0/255.0 blue:137.0/255.0 alpha:1.0]
//红色,用于红色提示，注意等情况
#define MY_COLOR_RED [UIColor colorWithRed:210.0/255.0 green:76.0/255.0 blue:10.0/255.0 alpha:1.0]
//黄色,用于激活后状态颜色
#define MY_COLOR_YELLOW [UIColor colorWithRed:255.0/255.0 green:251.0/255.0 blue:183.0/255.0 alpha:1.0]
//蓝色
#define MY_COLOR_BLUE [UIColor colorWithRed:10.0/255.0 green:109.0/255.0 blue:210.0/255.0 alpha:1.0]
//土色
#define MY_COLOR_TERREOUS [UIColor colorWithRed:174.0/255.0 green:148.0/255.0 blue:111.0/255.0 alpha:1.0]
//白色
#define MY_COLOR_WHITE [UIColor colorWithRed:244.0/255.0 green:244.0/255.0 blue:244.0/255.0 alpha:1.0]
//半透明黑色
#define MY_COLOR_BLACK_ALPHA [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5]

//光标颜色 ios7以上可以直接setTintColor来设置光标颜色，但是ios6代码设置会报错
#define MY_COLOR_CURSOR [UIColor colorWithRed:64.0/255.0 green:65.0/255.0 blue:65.0/255.0 alpha:1.0]

//----------------------颜色类--------------------------


//ios版本判断
#define IS_IOS_7 (([[[[UIDevice currentDevice].systemVersion componentsSeparatedByString:@"."] objectAtIndex:0] intValue] >= 7) ? YES : NO)
#define IS_IOS_8 (([[[[UIDevice currentDevice].systemVersion componentsSeparatedByString:@"."] objectAtIndex:0] intValue] >= 8) ? YES : NO)


//屏幕宽度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
//屏幕高度
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

//----------------------通知Key----------------------------//
#pragma mark - 通知的key

#define NOTI_HIDE_TABBAR @"NotificationHideTabbar"
#define NOTI_SHOW_TABBAR @"NotificationShowTabbar"
#define NOTI_HIDE_DATEPICKERVIEW @"NotificationHideDatePicker"
#define NOTI_SHOW_DATEPICKERVIEW @"NotificationShowDatePicker"
#define NOTI_HIDE_KEYBUTTON @"NotificationHideKeyButton"
#define NOTI_SHOW_KEYBUTTON @"NotificationShowKeyButton"


//----------------------缓存的key----------------------------//
#pragma mark - 缓存的key

#define USER_INFO @"LoginUserKey201"//登录用户的缓存key,有修改相关逻辑时最好修改一下key的值，避免造成旧数据冲突

//----------------------缓存的key----------------------------//

#endif /* Header_h */


