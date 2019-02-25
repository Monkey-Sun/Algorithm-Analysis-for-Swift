//
//  main.m
//  ArraySort
//
//  Created by Monkey-Sun on 2018/10/27.
//  Copyright © 2018 XLang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ArraySort.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        [ArraySort optionStr];
//        dispatch_queue_t serial = dispatch_queue_create("com.xlamy.demo", NULL);
//        NSLog(@"1");
//        dispatch_sync(serial, ^{
//            [NSThread sleepUntilDate:[NSDate dateWithTimeIntervalSinceNow:1]];
//            NSLog(@"2   %@", [NSThread currentThread]);
//        });
//        NSLog(@"3");
        [ArraySort test];
//        NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
//        NSLog(@"syncMain---begin");
//
//        dispatch_queue_t queue = dispatch_get_main_queue();
//
//        dispatch_sync(queue, ^{
//            // 追加任务1
//            for (int i = 0; i < 2; ++i) {
//                [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
//                NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
//            }
//        });
//
//        dispatch_sync(queue, ^{
//            // 追加任务2
//            for (int i = 0; i < 2; ++i) {
//                [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
//                NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
//            }
//        });
//
//        dispatch_sync(queue, ^{
//            // 追加任务3
//            for (int i = 0; i < 2; ++i) {
//                [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
//                NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
//            }
//        });
//
//        NSLog(@"syncMain---end");
    }
    return 0;
}


