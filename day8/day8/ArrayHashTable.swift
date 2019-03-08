//
//  ArrayHashTable.swift
//  day8
//
//  Created by Monkey-Sun on 2019/3/7.
//  Copyright © 2019 XLang. All rights reserved.
//

import Cocoa

// 线性探测  h(x)i = (Hash(x) + F(i)) mod tableSize,其中F(i) = i; 平方探测 则是 F(i) = i^2

//平方探测定理:
// 如果使用平方探测，且表的大小是素(如果除了1和它本身以外，不能被其他正整数整除)数,那么当表至少有一般是空的时候，总能插入一个新的元素.表的大小需要是素数，因为偶数的备选位置是锐减的。当散列的元素 > tableSize / 2 ,则还是有可能失败。
//开放定址法hash出来的表是不能执行真删除的。

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
//                tempIndex = Hash((index + i), hashTable!.array.count); // 线性探测
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
    
    static func insertWithFind(_ key:Int, _ table:ArrayHashTable) -> ArrayHashTable {
        let index = find(key, table);
        if table.array[index] == -1 {
            table.array[index] = key
        }
        return table;
    }
    
    // 平方探测法的find操作
    static func find(_ key:Int, _ table:ArrayHashTable?) -> Int {
        if table == nil {
            return -1;
        }
        var currentIndex = Hash(key, table!.array.count);
        var collisionNum = 0;
        
        while table!.array[currentIndex] != -1 && table!.array[currentIndex] != key {
            collisionNum += 1;
            currentIndex += 2 * collisionNum - 1;   // 平方解决f函数 F(i) = F(i - 1) + 2*i -1
            if currentIndex >= table!.array.count{
                currentIndex -= table!.array.count;
            }
        }
        return currentIndex;
    }
}
