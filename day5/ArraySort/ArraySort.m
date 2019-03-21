//
//  ArraySort.m
//  ArraySort
//
//  Created by Monkey-Sun on 2018/10/27.
//  Copyright © 2018 XLang. All rights reserved.
//

#import "ArraySort.h"

//NSMutableArray *collections = [NSMutableArray array];

@implementation ArraySort
+(void)mopSort{
    int array[10] = {55, 23, 93, 23, 4, 56, 1, 34, 69, 11};
    
    int count = sizeof(array)/sizeof(int);
    
    for (int t = 0; t < count - 1; t++) {
        for (int i = count - t - 1; i > 0; i--) {
            if (array[i] < array[i-1]) {
                int temp = array[i];
                array[i] = array[i-1];
                array[i-1] = temp;
            }
        }
        [self logArray:array count:count];
    }
}

+(void)selectSort{
    int array[10] = {55, 23, 93, 23, 4, 56, 1, 34, 69, 11};
    int count = sizeof(array)/sizeof(int);
    
    for (int j = 0; j < count -1; j ++) {
        for (int i = 1; i < count; i++) {
            if (array[j] > array[i]) {
                int temp = array[j];
                array[j] = array[i];
                array[i] = temp;
            }
        }
    }
    [self logArray:array count:count];
}

+(void)logArray:(int[])array count:(int) count{
    for (int i = 0; i < count; i++) {
        
        printf("%d", array[i]);
        
        if (i == count - 1) {
            
            printf("\n");
            
        } else {
            
            printf(" ");
        }
    }
}

+(void)quickSort{
    NSMutableArray *arr = [[NSMutableArray alloc] initWithObjects:@(55), @(23),@(93),@(23),@(4),@(56),@(1),@(34),@(69),nil];
    
    [self quickSortArray:arr withLeftIndex:0 andRightIndex:arr.count - 1];
    
    NSLog(@"%@",arr);
}

+ (void)quickSortArray:(NSMutableArray *)array withLeftIndex:(NSInteger)leftIndex andRightIndex:(NSInteger)rightIndex
{
    if (leftIndex >= rightIndex) {//如果数组长度为0或1时返回
        return ;
    }

    NSInteger i = leftIndex;
    NSInteger j = rightIndex;
    //记录比较基准数
    NSInteger key = [array[i] integerValue];

    while (i < j) {
        /**** 首先从右边j开始查找比基准数小的值 ***/
        while (i < j && [array[j] integerValue] >= key) {//如果比基准数大，继续查找
            j--;
        }
        //如果比基准数小，则将查找到的小值调换到i的位置
        array[i] = array[j];

        /**** 当在右边查找到一个比基准数小的值时，就从i开始往后找比基准数大的值 ***/
        while (i < j && [array[i] integerValue] <= key) {//如果比基准数小，继续查找
            i++;
        }
        //如果比基准数大，则将查找到的大值调换到j的位置
        array[j] = array[i];

    }

    //将基准数放到正确位置
    array[i] = @(key);
    NSLog(@"-----%@", array);
    /**** 递归排序 ***/
    //排序基准数左边的
    [self quickSortArray:array withLeftIndex:leftIndex andRightIndex:i - 1];
    //排序基准数右边的
    [self quickSortArray:array withLeftIndex:i + 1 andRightIndex:rightIndex];
}

+(void)optionStr{
    NSMutableString *str = [[NSMutableString alloc] initWithString:@"aabcad"];
    for (int i = 0; i < str.length - 1; i ++) {
        unsigned char a = [str characterAtIndex:i];
        for (int j = i + 2; j < str.length - 1; j++) {
            char b = [str characterAtIndex:j];
            if (a == b) {
                [str deleteCharactersInRange:NSMakeRange(j, 1)];
            }
        }
    }
    NSLog(@"%@", str);
}


+(void)test{
    NSArray *array = @[@"a", @"b", @"c"];
    [self take:3 atArray:array];
//    NSArray *array1 = [array copy];
//    NSArray *array2 = [array copy];
//    NSMutableDictionary *mapDict = [NSMutableDictionary dictionary];
//    NSString *fullStr=@"";
//
//    for (NSString *s in array) {
//        for (NSString *i in array1) {
//            if ([s isEqualToString:i]) {
//                continue;
//            }
//            for (NSString *j in array2) {
//                if ([s isEqualToString:j]) {
//                    continue;
//                }else if ([i isEqualToString:j]){
//                    continue;
//                }
//                fullStr = [NSString stringWithFormat:@"%@%@%@", s, i, j];
//                if (!mapDict[fullStr]) {
//                    mapDict[fullStr] = fullStr;
//                }
//            }
//        }
//    }
//
//    NSLog(@"%@", mapDict.allValues);
}


+(void)take:(NSInteger)m atArray:(NSArray *)array{
    NSMutableArray *totalArray =[NSMutableArray array];
    [totalArray addObject:array];
    for (int i = 0; i < m; i++) {
        [totalArray addObject:[array copy]];
    }
    
    NSMutableArray *collections = [NSMutableArray array];
    
    for (int i = 0; i < 6; i++) {
        NSMutableDictionary *mapDict = [NSMutableDictionary dictionary];
        for (NSInteger j = 0; j < totalArray.count; j++) {
            NSInteger next = (j + 1 < totalArray.count-1? j + 1 :totalArray.count-1);
            [self processArray:totalArray[j] nextArray:totalArray[next] collections:collections map:mapDict];
        }
        
//        NSString *string = [collections componentsJoinedByString:@","];
        NSLog(@"%@", mapDict.allKeys);
    }
}

+(void)processArray:(NSArray<NSString *> *)leftArray nextArray:(NSArray<NSString *> *)array collections:(NSMutableArray *)collections map:(NSMutableDictionary *)map{
    for (NSString *s in leftArray) {
        map[s] = s;
        for (NSString *l in array) {
            map[l] = l;
        }
    }
}

@end
