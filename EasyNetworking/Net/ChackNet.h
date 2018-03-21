//
//  ChackNet.h
//  Networking
//
//  Created by tianxiaomeng on 16/4/18.
//  Copyright © 2016年 tianxiaomeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <netinet/in.h>
#import "Reachability.h"

typedef enum : NSInteger
{
    HelpNotReachable = 0,   //没网络
    HelpReachableViaWiFi,   //wifi
    HelpReachableViaWWAN    //3G、4G
}HelpNetworkStatus;

@interface ChackNet : NSObject
@property (nonatomic) HelpNetworkStatus networkState;           //网络状态


#pragma mark - 初始化Help中的一些内容
/**
 初始化Help中的一些内容
 */
+(ChackNet*)sharedChackNet;

#pragma mark - ----------- 其他帮助方法 -----------
/**
 检查是否网络状态
 */
+(BOOL)connectedToNetWork;

#pragma mark - 网络连接异常，请检查网络
/**
 网络连接异常，请检查网络
 */
+(void)faileNetWorkStatusBarOverlay;

#pragma mark - 获取网络状态wifi、3G、4G,还是无网络状态
/***
 获取网络状态wifi、3G、4G,还是无网络状态
 */
-(HelpNetworkStatus)getNetworkStatus;

@end
