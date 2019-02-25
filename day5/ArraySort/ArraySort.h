//
//  ArraySort.h
//  ArraySort
//
//  Created by Monkey-Sun on 2018/10/27.
//  Copyright © 2018 XLang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ArraySort : NSObject
//冒泡排序
+(void)mopSort;
//选择排序
+(void)selectSort;
//快排
+(void)quickSort;

+(void)optionStr;

+(void)test;

@end

NS_ASSUME_NONNULL_END
