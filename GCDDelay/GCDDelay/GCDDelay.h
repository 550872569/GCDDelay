//
//  GCDDelay.h
//  OperationCode
//
//  Created by Yan on 17/4/25.
//  Copyright © 2017年 YY. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^GCDTask)(BOOL cancel);
typedef void(^gcdBlock)();

@interface GCDDelay : NSObject

+ (GCDTask)gcdDelay:(NSTimeInterval)time task:(gcdBlock)block;

+ (void)gcdCancel:(GCDTask)task;

+ (void)gcdTest;

- (GCDTask)gcdDelay:(NSTimeInterval)time task:(gcdBlock)block;
- (void)gcdCancel:(GCDTask)task;

@end
