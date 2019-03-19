//
//  BubbleSort.swift
//  day11
//
//  Created by Monkey-Sun on 2019/3/19.
//  Copyright © 2019 XLang. All rights reserved.
//

import Cocoa

class Bubble: NSObject {
//    比较n次，每次都是两两比较并换位置，算法复杂度 O(n^2)
    static func sort(_ array:inout [Int]) -> Void {
        for p in 0..<array.count {
            for i in 0..<(array.count - p - 1){
                if(array[i] > array[i + 1]){
                    let temp = array[i];
                    array[i] = array[i + 1];
                    array[i + 1] = temp;
                }
            }
        }
    }
}
