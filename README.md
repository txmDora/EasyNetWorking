# EasyNetWorking

导入方法:
1、将Net 和 ThirdLibrary两个文件夹copy到新项目中

2、在需要的.m文件内
     #import "DirectorClass.h"
     #import "ChackNet.h"
     
3、详细代码：

    //post方法
    if ([ChackNet connectedToNetWork])
     {
         [DirectorClass postWithUrl:@"你的url" theParmeters:‘你的dic，如果不需要就传nil’ sucess:^(id object)
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
