//
//  DirectorClass.m
//  Networking
//
//  Created by tianxiaomeng on 16/4/18.
//  Copyright © 2016年 tianxiaomeng. All rights reserved.
//

#import "DirectorClass.h"
@implementation DirectorClass
//post请求
+ (void)postWithUrl:(NSString *)url
       theParmeters:(id )parmertes
             sucess:(SucessBlock)sucessBlock
              error:(ErrorBlock)errorBlock
{
    //其实就是找干活的人
    id<TXMNetProtocol> networker = [TXMNetworkerFactory creatNetworker];
    [networker postWithUrl:url theParmeters:parmertes sucess:^(id object) {
        sucessBlock(object);
    } error:^(NSError *error) {
        errorBlock(error);
    }];
}

//get请求
+ (void)getWithUrl:(NSString *)url
      theParmeters:(id)parmertes
            sucess:(SucessBlock)sucessBlock error:(ErrorBlock)errorBlock
{
    id<TXMNetProtocol> networker = [TXMNetworkerFactory creatNetworker];

    [networker getWithUrl:url theParmeters:parmertes sucess:^(id object) {
        sucessBlock(object);
    } error:^(NSError *error) {
        errorBlock(error);
    }];
}


@end
