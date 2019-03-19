//
//  ShellSort.swift
//  day11
//
//  Created by Monkey-Sun on 2019/3/19.
//  Copyright © 2019 XLang. All rights reserved.
//

import Cocoa

class Shell: NSObject {
    static func sort(_ array:inout [Int]) -> Void {
        let n = array.count;
        var j : Int;
        var increment : Int = n / 2;
        while increment > 0 {
            for i in increment..<n{
                let temp = array[i];
                j = i;
                while j >= increment{
                    if temp < array[j - increment]{
                        array[j] = array[j - increment];
                    }else{
                        break;
                    }
                    j -= increment;
                }
                array[j] = temp;
            }
            increment /= 2;
        }
        
        
    }
}
