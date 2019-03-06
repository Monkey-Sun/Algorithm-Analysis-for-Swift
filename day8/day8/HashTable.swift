//
//  HashTable.swift
//  day8
//
//  Created by Monkey-Sun on 2019/3/6.
//  Copyright © 2019 XLang. All rights reserved.
//

import Cocoa

//分离链接法  插入，删除，和查询 都是链表的操作
class HashTable: NSObject {
    var tableSize = 1000;
    var theList : Array<ListNode>?;
    
    static func initialTable(_ tableSize:Int?) -> HashTable {
        let table = HashTable();
        if tableSize != nil{
            table.tableSize = tableSize!;
        }
        table.theList = Array(repeating: ListNode.MakeEmpty(), count: table.tableSize);
        return table;
    }
    
    static func find(_ key:Int,_ H:HashTable) -> ListNode? {
        let listNode = H.theList![Hash(key, H.tableSize)];
        var p = listNode.next; //链表的遍历啦。因为ListNode使用了哑结点,所以真实的链表要从listNode.next开始。
        while p != nil && p!.element != key{
            p = p!.next;
        }
        return p;
    }
    
    static func insert(_ key:Int,_ H:inout HashTable?) -> HashTable {
        if H == nil {
            H = HashTable.initialTable(100);
        }
        let index = Hash(key, 100);
        let listNode = H!.theList![index];
        let head = listNode.next;
        let newNode = ListNode();
        newNode.element = key;
        listNode.next = newNode;
        newNode.next = head;
        return H!;
    }
    
    //   散列函数，将key  hash 到数组的特定位置。  一个哈希函数的好坏 是hash后的结果，尽可能的均匀分散到size空间
    static func Hash(_ key:Int, _ size:Int)->Int{
        return key % size;
    }
}


