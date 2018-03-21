//
//  TXMNetPort.m
//  Networking
//
//  Created by tianxiaomeng on 16/4/14.
//  Copyright © 2016年 tianxiaomeng. All rights reserved.
//

#import "TXMNetworkerFactory.h"
#import "TXMNetworker.h"
@implementation TXMNetworkerFactory
+(id<TXMNetProtocol>)creatNetworker
{
    id<TXMNetProtocol> worker = [[TXMNetworker alloc] init];
    return worker;
}
@end
