//
//  ChackNet.m
//  Networking
//
//  Created by tianxiaomeng on 16/4/18.
//  Copyright © 2016年 tianxiaomeng. All rights reserved.
//

#import "ChackNet.h"
static ChackNet  *NetState = nil;
@implementation ChackNet
@synthesize networkState;
+(ChackNet *)sharedChackNet
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NetState = [[ChackNet alloc] init];
    });
    return NetState;
}

-(void)reachabilityChanged:(NSNotification *)note
{
    if ([NetState getNetworkStatus])
    {
        Reachability* curReach = [note object];
        [self updateInterfaceWithReachability:curReach];
    }
    else
    {
        [NetState setNetworkState:HelpNotReachable];
    }
}


- (void)updateInterfaceWithReachability:(Reachability *)reachability
{
    NetworkStatus netStatus = [reachability currentReachabilityStatus];
    switch (netStatus)
    {
        case NotReachable:
        {
            [NetState setNetworkState:HelpNotReachable];
        }
            break;
        case ReachableViaWWAN:
        {
            [NetState setNetworkState:HelpReachableViaWWAN];
        }
            break;
        case ReachableViaWiFi:
        {
            [NetState setNetworkState:HelpReachableViaWiFi];
        }
            break;
    }
    
}

+(BOOL)connectedToNetWork
{
    struct sockaddr_in zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;
    
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;
    
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    
    if (!didRetrieveFlags)
    {
        NSLog(@"无法连接到网络");
        return NO;
    }
    
    BOOL isReachable = flags & kSCNetworkFlagsReachable;
    BOOL needsConnection = flags & kSCNetworkFlagsConnectionRequired;
    return (isReachable && ! needsConnection) ? YES : NO;
}

#pragma mark - 获取网络状态wifi、3G、4G,还是无网络状态
/***
 获取网络状态wifi、3G、4G,还是无网络状态
 */
-(HelpNetworkStatus)getNetworkStatus
{
    return networkState;
}



@end
