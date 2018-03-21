//
//  ViewController.m
//  EasyNetworking
//
//  Created by 田晓梦 on 2018/3/21.
//  Copyright © 2018年 田晓梦. All rights reserved.
//

#import "ViewController.h"
#import "DirectorClass.h"
#import "ChackNet.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDictionary * dic = @{
                           @"timestamp" : @"1990.11.01",
                           @"version" : @"1.4",
                           @"srq":@"1",
                           @"channel":@"dev",
                           @"code":@"1001",
                           @"data" : @""
                           };
    if ([ChackNet connectedToNetWork])
    {
        [DirectorClass postWithUrl:@"你的url" theParmeters:dic sucess:^(id object)
         {
             NSLog(@"%@",object);
             NSLog(@"成功");
         } error:^(NSError *error) {
             NSLog(@"失败");
         }];
    }else
    {
        NSLog(@"网络连接失败");
    }
    
    //    //get方法
    //    [DirectorClass getWithUrl:nil theParmeters:nil sucess:^(id object) {
    //
    //    } error:^(NSError *error) {
    //
    //    }];
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
