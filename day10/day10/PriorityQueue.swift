//
//  PriorityQueue.swift
//  day10
//
//  Created by Monkey-Sun on 2019/3/17.
//  Copyright © 2019 XLang. All rights reserved.
//

import Cocoa

fileprivate class QueueObj: NSObject, ElementProtocol {
    var key: Int{
        return -1;
    }
}

class PriorityQueue: NSObject {
    let minElements = 10;
    var capcity :Int!;
    var elements:Array<ElementProtocol>!;
    var size = 0;
    
    
    init(_ maxElements:Int) {
        super.init();
        assert(maxElements >= self.minElements, "maxElements must greater than \(self.minElements)");
        self.capcity = maxElements;
        self.elements = Array(repeating: QueueObj(), count: maxElements + 1);
    }
    
    // 入队列
    func enqueue(_ obj:ElementProtocol) -> Void {
        if isFull {
            print("队列满了");
            return;
        }
        size = size + 1;
        var i:Int = size;
        while self.elements[i / 2].key > obj.key {
            self.elements[i] = self.elements[ i / 2];
            i /= 2;
        }
        self.elements[i] = obj;
    }
    
    var isFull: Bool{
        return size >= self.capcity;
    }
    
    var isEmpty:Bool{
        return size == 0;
    }
    
    var front : ElementProtocol{
        return elements[1];
    }
    
    var tail : ElementProtocol{
        return elements[size - 1];
    }
    
    //    相当于出队列 是O(logN)
    static func dequeue(_ priorityQueue:inout PriorityQueue) -> ElementProtocol {
        if priorityQueue.isEmpty {
            return priorityQueue.elements[0];
        }
        let minData = priorityQueue.elements[1];
        let lastData = priorityQueue.elements[priorityQueue.size];
        priorityQueue.size -= 1;
        var i = 1;
        var child : Int;
        while i * 2 <= priorityQueue.size {
            child = i * 2;// 左儿子
            if child != priorityQueue.size && priorityQueue.elements[child + 1].key < priorityQueue.elements[child].key{
                child += 1;
            }
            
            if lastData.key > priorityQueue.elements[child].key{
                priorityQueue.elements[i] = priorityQueue.elements[child];
                i = child;
            }else{
                break;
            }
        }
        priorityQueue.elements[i] = lastData;
        return minData;
    }
    
    
    func insertWithoutSort(_ obj:ElementProtocol) -> Void {
        if isFull {
            print("队列满了");
            return;
        }
        size += 1;
        elements[size] = obj;
    }
    
    //    乱序插入元素，最后排序
    func heapSort() -> Void {
        var i = (size - 1) / 2 + 1;
        while  i > 0{
            percolateDown(i);
            i -= 1;
        }
    }
    //    percolateDown 执行效率，取决于虚线的条数N. 对于高度为h的理想二叉树，虚线条数的和为 2^(h + 1) -1 - （h + 1）
    func percolateDown(_ index:Int) -> Void {
        if 2 * index > size {
            return;
        }
        let leftNode = elements[2 * index];
        var smallIndex : Int;
        var smallNode : ElementProtocol;
        
        if 2 * index + 1 > size {
            smallIndex = 2 * index;
            smallNode = elements[2 * index];
        }else{
            let rightNode = elements[2 * index + 1];
            smallIndex = leftNode.key < rightNode.key ? 2 * index : 2 * index + 1;
            smallNode = elements[smallIndex];
        }
        
        if smallNode.key > elements[index].key {
            return;
        }else{
            elements[smallIndex] = elements[index];
            elements[index] = smallNode;
            percolateDown(smallIndex);
        }
    }
}

