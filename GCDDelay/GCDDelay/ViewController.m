//
//  ViewController.m
//  GCDDelay
//
//  Created by sogou-Yan on 17/4/26.
//  Copyright © 2017年 sogou. All rights reserved.
//

#import "ViewController.h"
#import "GCDDelay.h"

@interface ViewController () {
    GCDDelay *_gcdDelay;
    BOOL _singleClickEnable;
    BOOL _doubleClickSelectable;
    GCDTask _task;
    BOOL _isFirst;
}
typedef void (^task)();
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _gcdDelay = [[GCDDelay alloc]init];
    _singleClickEnable = NO;
    _isFirst = NO;
}

/**
 _singleClickEnable
 _doubleClickSelectable
 单击：
 1. 如果0.5s之内点击没有再来 0.5s afterDelay执行operation
 
 2. 如果0.5s之内再次点击 cancel opertion
 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _singleClickEnable = !_singleClickEnable;
    
    if (!_task && _singleClickEnable) {
        _isFirst = YES;
        _task = [_gcdDelay gcdDelay:0.5 task:^{
            _singleClickEnable = !_singleClickEnable;
            NSLog(@"output after 1 seconds单击");
        }];
    } else {
        _isFirst = NO;
    }
    NSLog(@"_singleClickEnable:%d",_singleClickEnable);
    NSLog(@"!_task:%d",!_task);

    if (!_singleClickEnable) {
        [_gcdDelay gcdCancel:_task];
        NSLog(@"gcdCancel双击");
    } else {
        if (_task && _singleClickEnable && !_isFirst) {
            _task = [_gcdDelay gcdDelay:0.5 task:^{
                _singleClickEnable = !_singleClickEnable;
                NSLog(@"output after 1 seconds单击");
            }];
        }
    }


//    void (^task)() = ^{
//        
//    };
//    dispatch_block_create(DISPATCH_BLOCK_BARRIER, task);
//    dispatch_block_cancel(^{
//        
//    });
}

@end
