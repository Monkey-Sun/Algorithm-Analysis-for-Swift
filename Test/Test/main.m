//
//  main.m
//  Test
//
//  Created by Monkey-Sun on 2019/3/11.
//  Copyright © 2019 XLang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PriorityQueue.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        NSLog(@"Hello, World!");
        PriorityQueue *queue = [[PriorityQueue alloc] initWithCapCity:10];
        for (int i = 0; i < 10; i++) {
            [queue insert:i];
        }
        
    }
    return 0;
}
