//
//  Merge.swift
//  day11
//
//  Created by Monkey-Sun on 2019/3/27.
//  Copyright © 2019 XLang. All rights reserved.
//

import Foundation

class Merge: NSObject {
    static func sort(_ array:inout [Int]) -> Void {
        var temp = [Int]();
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
            merge(&array, &temp, &low, &center!, &high);
        }
    }
    
    static func merge(_ array:inout [Int], _ temp:inout [Int], _ low:inout Int, _ center:inout Int, _ high:inout Int) -> Void {
        var i :Int = 0;
        
        //申请空间，使其大小为两个
        var left_low = low;
        let left_high = center;
        var right_low = center + 1;
        let right_high = high;
        
        while left_low <= left_high && right_low <= right_high {
            if(array[left_low] <= array[right_low]){
                temp.append(array[left_low]);
                left_low += 1;
            }else{
                temp.append(array[right_low]);
                right_low += 1;
            }
        }
        
        if left_low <= left_high{
            i = left_low;
            while i <= left_high{
                temp.append(array[i]);
                i += 1;
            }
        }
        
        if right_low <= right_high {
            i = right_low;
            while i <= right_high{
                temp.append(array[i]);
                i += 1;
            }
        }
        
        for j in 0..<(high - low) {
            array[low + j] = temp[j];
        }
    }
}
