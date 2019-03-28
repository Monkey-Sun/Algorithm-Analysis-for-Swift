//
//  ShellSort.swift
//  day11
//
//  Created by Monkey-Sun on 2019/3/19.
//  Copyright © 2019 XLang. All rights reserved.
//

import Foundation
// 希尔排序的核心思路是，局部有序到整体有序，希尔排序的时间复杂度为O(n^(3/2)) < O(n^2)
class Shell: NSObject {
    static func sort(_ array:inout [Int]) -> Void {
        let n = array.count;
        var increment = n / 2;
        var j : Int;
        // 增量 h1 , h2, h3, h4...hn, 其中h1 >= 1, 排序n趟
        while increment > 0 {
            for i in increment..<n{ // 这里就是一个增量increment..<n的直接插入排序
                let temp = array[i];
                j = i;
                while j >= increment &&  temp < array[j - increment]{
                    array[j] = array[j - increment];
                    j -= increment;
                }
                array[j] = temp;
            }
            increment /= 2;
        }
    }
}
