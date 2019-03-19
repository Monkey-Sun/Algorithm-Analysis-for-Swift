//
//  InsertionSort.swift
//  day11
//
//  Created by Monkey-Sun on 2019/3/19.
//  Copyright © 2019 XLang. All rights reserved.
//

import Cocoa

// 思路:假设第一个已定序，从位置p=1开始，依次取新的元素，和前面定序的元素依次比较，直到找到正确的位置。
class Insertion: NSObject {
    static func sort(_ array:inout [Int]) -> Void {
        for p in 1..<array.count {
            var j = p;
            let temp = array[p];
            while j > 0 && array[j - 1] > temp{ // 依次比较j-1至0所在元素的值与temp的值的大小; 正序或逆序 取决于这里是将较小的往前插还是较大的往前插
                array[j] = array[j - 1]; // 将元素向右移，腾出位置j给temp
                j -= 1;
            }
            array[j] = temp;// 将temp赋值到正确的位置j
        }
    }
}
