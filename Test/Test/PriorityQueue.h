//
//  PriorityQueue.h
//  Test
//
//  Created by Monkey-Sun on 2019/3/11.
//  Copyright © 2019 XLang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PriorityQueue : NSObject

-(instancetype)initWithCapCity:(NSInteger)capcity;

-(void)insert:(NSInteger)num;
@end

NS_ASSUME_NONNULL_END
