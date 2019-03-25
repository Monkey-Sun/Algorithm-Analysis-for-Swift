//
//  Heap.swift
//  day11
//
//  Created by Monkey-Sun on 2019/3/20.
//  Copyright © 2019 XLang. All rights reserved.
//

import Cocoa
// 使用最大堆来实现堆排序。
class Heap: NSObject {
    static func sort(_ array:inout [Int]) -> Void {
        let n = array.count;
        var i = n / 2;
//        build heap
        while i >= 0 {
            percDown(&array, &i, n);
            i -= 1;
        }
//        delete max
        for j in (0..<n).reversed() {
            let temp = array[0];
            array[0] = array[j];
            array[j] = temp;
            var start:Optional = 0;
            percDown(&array, &start!, j);
        }
    }
    
    fileprivate static func percDown(_ array:inout [Int], _ i:inout Int, _ n : Int) -> Void {
        var child:Int;
        
        let temp:Int = array[i];
        
        while leftChild(i) < n {
            
            child = leftChild(i);
            
            if child != n - 1 && array[child + 1] > array[child]{
                child += 1;
            }
            
            if temp < array[child]{
                array[i] = array[child];
            }else{
                break;
            }
            
            i = child;
        }
        array[i] = temp;
    }
    
   fileprivate static func leftChild(_ i:Int) -> Int {
        return 2 * i + 1;
    }
}
