//
//  TXMNetPort.h
//  Networking
//
//  Created by tianxiaomeng on 16/4/14.
//  Copyright © 2016年 tianxiaomeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TXMNetProtocol.h"
@interface TXMNetworkerFactory : NSObject
+(id<TXMNetProtocol>)creatNetworker;
@end
