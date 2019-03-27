//
//  Merge.swift
//  day11
//
//  Created by Monkey-Sun on 2019/3/27.
//  Copyright © 2019 XLang. All rights reserved.
//

import Foundation

//这种归并排序 会产生巨量的临时数组，其实是不必要的
//class Merge: NSObject {
//    static func sort(_ array:inout [Int]) -> Void {
//        var low:Optional = 0;
//        var high:Optional = array.count - 1;
//        msort(&array, &low!, &high!);
//    }
//
//    static func msort(_ array:inout [Int], _ low:inout Int, _ high:inout Int) -> Void {
//        if low < high {
//            var center:Optional = (low + high) / 2;
//            var biggerCenter:Optional = center! + 1;
//
//            msort(&array, &low, &center!);
//            msort(&array, &biggerCenter!, &high);
//            merge(&array, &low, &center!, &high);
//        }
//    }
//
//    static func merge(_ array:inout [Int], _ low:inout Int, _ center:inout Int, _ high:inout Int) -> Void {
//        var temp = Array(repeating: -1, count: array.count);
//
//        var indexTemp:Int = 0;
//
//        var left_low = low;
//        let left_high = center;
//
//        var right_low = center + 1;
//        let right_high = high;
//
//        while left_low <= left_high && right_low <= right_high {
//            if(array[left_low] < array[right_low]){
//                temp[indexTemp] = array[left_low];
//                left_low += 1;
//            }else{
//                temp[indexTemp] = array[right_low];
//                right_low += 1;
//            }
//            indexTemp += 1;
//        }
//
//        while left_low <= left_high{
//            temp[indexTemp] = array[left_low];
//            indexTemp += 1;
//            left_low += 1;
//        }
//
//        while right_low <= right_high{
//            temp[indexTemp] = array[indexTemp];
//            indexTemp += 1;
//            right_low += 1;
//        }
//
//        for j in 0...(high - low) {
//            array[low + j] = temp[j];
//        }
//    }
//}

class Merge: NSObject {
    static func sort(_ array:inout [Int]) -> Void {
        var temp = Array(repeating: -1, count: array.count);
        var low:Optional = 0;
        var high:Optional = array.count - 1;
        msort(&array, &temp, &low!, &high!);
    }
    
    static func msort(_ array:inout [Int], _ temp:inout [Int], _ low:inout Int, _ high:inout Int) -> Void {
        if low < high {
            var center:Optional = (low + high) / 2;
            var biggerCenter:Optional = center! + 1;
            
            msort(&array, &temp, &low, &center!);
            msort(&array, &temp, &biggerCenter!, &high);
            merge(&array, &temp, &low, &biggerCenter!, &high);
        }
    }
    
    static func merge(_ array:inout [Int], _ temp:inout [Int], _ low:inout Int, _ center:inout Int, _ high:inout Int) -> Void {
        var indexTemp:Int = low;
        
        var left_low = low;
        let left_high = center - 1;
        
        var right_low = center;
        let right_high = high;
        
        while left_low <= left_high && right_low <= right_high {
            if(array[left_low] > array[right_low]){
                temp[indexTemp] = array[left_low];
                left_low += 1;
            }else{
                temp[indexTemp] = array[right_low];
                right_low += 1;
            }
            indexTemp += 1;
        }
        
        while left_low <= left_high{
            temp[indexTemp] = array[left_low];
            indexTemp += 1;
            left_low += 1;
        }
        
        while right_low <= right_high{
            temp[indexTemp] = array[indexTemp];
            indexTemp += 1;
            right_low += 1;
        }
        
        for j in low...high {
            array[j] = temp[j];
        }
    }
}
