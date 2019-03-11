//
//  PriorityQueue.m
//  Test
//
//  Created by Monkey-Sun on 2019/3/11.
//  Copyright © 2019 XLang. All rights reserved.
//

#import "PriorityQueue.h"

@interface PriorityQueue()
@property (nonatomic, strong) NSMutableArray<NSNumber *> *elements;
@property (nonatomic, assign) NSInteger       capcity;
@property (nonatomic, assign) NSInteger       size;
@end

@implementation PriorityQueue

-(instancetype)initWithCapCity:(NSInteger)capcity{
    if (self = [super init]) {
        self.capcity = capcity;
        self.elements = [[NSMutableArray alloc] initWithCapacity:capcity];
        for (int i = 0; i < capcity; i ++) {
            [self.elements addObject:@(-1)];
        }
        self.size = 0;
    }
    return self;
}

-(void)insert:(NSInteger)num{
    if (self.isFull) {
        return;
    }
    NSInteger i = 0;
    for (i = self.size + 1; self.elements[i / 2] > @(num); i /= 2) {
        self.elements[i] = self.elements[i / 2];
    }
    self.elements[i] = @(num);
}

-(BOOL)isFull{
    return self.size == self.capcity;
}

@end
