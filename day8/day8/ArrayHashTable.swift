//
//  ArrayHashTable.swift
//  day8
//
//  Created by Monkey-Sun on 2019/3/7.
//  Copyright © 2019 XLang. All rights reserved.
//

import Cocoa

// 线性探测  h(x)i = (Hash(x) + F(i)) mod tableSize,其中F(i) = i 平方探测 则是 F(i) = i^2

class ArrayHashTable: NSObject {
    fileprivate var array:Array<Int>!;
    override init() {
        self.array = Array(repeating: -1, count: 10);
    }
    
    static func insert(_ key:Int, _ hashTable:inout ArrayHashTable?) -> ArrayHashTable {
        if hashTable == nil{
            hashTable = ArrayHashTable();
        }
        let index = Hash(key, hashTable!.array.count);
        if hashTable!.array[index] != -1 {
            var i = 0;
            var tempIndex = index;
            while hashTable!.array[tempIndex] != -1{
                i += 1;// 一次探测
                tempIndex = Hash((index + i * i), hashTable!.array.count);  //平方探测法
//                tempIndex = Hash((index + i), hashTable!.array.count); //
            }
            hashTable!.array[tempIndex] = key;
        }else{
            hashTable!.array[index] = key;
        }
        return hashTable!;
    }
    
    static func Hash(_ key:Int, _ size:Int)->Int{
        return key % size;
    }
}
