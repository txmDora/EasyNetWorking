//
//  DirectorClass.h
//  Networking
//
//  Created by tianxiaomeng on 16/4/18.
//  Copyright © 2016年 tianxiaomeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TXMNetProtocol.h"
#import "TXMNetworkerFactory.h"
#import "ChackNet.h"

typedef  void (^SucessBlock)(id object);

typedef  void (^ErrorBlock)( NSError *error);
@interface DirectorClass : NSObject

+ (void)postWithUrl:(NSString *)url
       theParmeters:(id )parmertes
             sucess:(SucessBlock)sucessBlock
              error:(ErrorBlock)errorBlock;
+ (void)getWithUrl:(NSString *)url
      theParmeters:(id)parmertes
            sucess:(SucessBlock)sucessBlock
             error:(ErrorBlock)errorBlock;
@end
