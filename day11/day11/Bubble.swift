//
//  BubbleSort.swift
//  day11
//
//  Created by Monkey-Sun on 2019/3/19.
//  Copyright © 2019 XLang. All rights reserved.
//

import Cocoa

class Bubble: NSObject {
    
    static func sort(_ array:inout [Int]) -> Void {
        for i in 0..<array.count {// 比较n次
            for j in 0..<(array.count - i - 1){
                if(array[j] > array[j + 1]){ // 外层循环i次 说明有i个数字定序，内层减去这个定序则可以减少比较次数
                    let temp = array[j];
                    array[j] = array[j + 1];
                    array[j + 1] = temp;
                }
            }
        }
    }
    
   static func sort_2(_ array:inout [Int]) -> Void {
        for i in 0..<array.count {
            var j = 0;
            while j < (array.count - 1 - i) { // 外层循环i次 说明有i个数字定序，内层减去这个定序则可以减少比较次数
                if array[j + 1] < array[j]{
                    let temp = array[j];
                    array[j] = array[j + 1];
                    array[j + 1] = temp;
                }
                j += 1;
            }
        }
    }
}
