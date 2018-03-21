//
//  TXMNetworker.m
//  Networking
//
//  Created by tianxiaomeng on 16/4/14.
//  Copyright © 2016年 tianxiaomeng. All rights reserved.
//

#import "TXMNetworker.h"
#import "AFHTTPSessionManager.h"
//#define THIRDPERSON [AFHTTPSessionManager manager]

@interface TXMNetworker  ()
@property(nonatomic, strong)AFHTTPSessionManager *manager;
@end

@implementation TXMNetworker
- (instancetype)init {
    if (self  =  [super init]) {
//        NSLog(@"%@",THIRDPERSON);
        _manager = [AFHTTPSessionManager manager];
        _manager.requestSerializer = [AFJSONRequestSerializer serializer]; // 请求
        
        [_manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];

//
//        _manager.responseSerializer.acceptableContentTypes = \
//        [_manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
//        [_manager.requestSerializer setValue:@"application/json; charset=utf-8"forHTTPHeaderField:@"Content-Type"];
//        _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", nil];
    }
    return self;
}

-(void)postWithUrl:(NSString *)url theParmeters:(id)parmertes sucess:(SucessBlock)sucessBlock error:(ErrorBlock)errorBlock
{
    
    [self.manager POST:[url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]] parameters:parmertes progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //成功
        sucessBlock(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
}

-(void)getWithUrl:(NSString *)url theParmeters:(id)parmertes sucess:(SucessBlock)sucessBlock error:(ErrorBlock)errorBlock
{
    [self.manager GET:[url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]] parameters:parmertes progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        sucessBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
}
@end
