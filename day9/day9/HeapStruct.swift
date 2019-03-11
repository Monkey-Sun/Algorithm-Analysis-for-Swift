//
//  HeapStruct.swift
//  day9
//
//  Created by Monkey-Sun on 2019/3/11.
//  Copyright © 2019 XLang. All rights reserved.
//

import Cocoa

// 二叉堆的性质
// 高度为h的二叉堆，其节点数 在 2^h和2^(h+1) -1之间
// 对于最后一层，叶子节点是从左到右排的
// 二叉堆可以用数组来表示。对于任意节点i ，其做左子节点d在2*i处，右子节点在2*i + 1,其父节点在 ceil(i / 2)向下取整 处。

//堆序性质: 对于二叉堆中的任意节点，其值小于所有后裔节点。
class HeapStruct: NSObject {
    var capcity :Int!;
    var elements:[Int]!;
    init(_ capcity:Int!) {
        super.init();
        self.capcity = capcity;
    }
}


class PriorityQueue: NSObject {
    let minElements = 10;
    var capcity :Int!;
    var elements:Array<Int>!;
    var size = 0;
//    var sentinel:Int; //标记
    
    
    init(_ maxElements:Int) {
        super.init();
        assert(maxElements >= self.minElements, "maxElements must greater than \(self.minElements)");
        self.capcity = maxElements;
        self.elements = Array(repeating: -1, count: maxElements + 1);
    }
    
    func insert(_ num:Int) -> Void {
        if isFull {
            print("队列满了");
            return;
        }
        size = size + 1;
        var i:Int = size;
        while self.elements[i / 2] > num {
            self.elements[i] = self.elements[ i / 2];
            i /= 2;
        }
        self.elements[i] = num;
    }
    
    var isFull: Bool{
        return size >= self.capcity;
    }
}
