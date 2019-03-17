//
//  LeftistHeap.swift
//  day10
//
//  Created by Monkey-Sun on 2019/3/17.
//  Copyright © 2019 XLang. All rights reserved.
//

import Cocoa
// NPL(null path length): 零路径长，对于任意节点X，如果有两个子节点则 npl == 1,只有一个子节点或者没有子节点则npl == 0， null节点npl为-1
// 左式堆(leftist heap):满足npl(leftNode) >= npl(right)的堆为左式堆。

// 左式堆也要满足对于任意节点x，x的所有后裔都大于x
class LeftistHeap: NSObject {
    var element:Int!;
    var leftNode : LeftistHeap?;
    var rightNode : LeftistHeap?;
    var npl = 0;
    
    override init() {
        super.init();
        element = -1;
    }
}

extension LeftistHeap{
    
    /// Merge
    ///
    /// - Parameters:
    ///   - heap1: <#heap1 description#>
    ///   - heap2: <#heap2 description#>
    func merge(_ heap1:LeftistHeap?, _ heap2:LeftistHeap?) -> LeftistHeap? {
        if heap1 == nil{
            return heap2;
        }else if heap2 == nil{
            return heap1;
        }
        
        if heap1!.element < heap2!.element {
            return mergel(heap1!, heap2!);
        }else{
            return mergel(heap2!, heap1!);
        }
    }
    
    func mergel(_ h1:LeftistHeap, _ h2:LeftistHeap) -> LeftistHeap {
        if h1.leftNode == nil { //根据左堆的定义，若leftNode == nil, 则rightNode 一定为空
            h1.leftNode = h2; //所以只需将h2 插入h1的左边
        }else{
//            h1的右子树插入h2，将插入的结果再插回h1的右子树。
            h1.rightNode = mergel(h1.rightNode!, h2);
//            检测一下h1是否满足左堆的定义，不满足则需要交换一下左右子节点的位置
            if h1.leftNode!.npl < h1.rightNode!.npl{
                swapChild(h1);
            }
//            最后是npl的赋值
            h1.npl = h1.rightNode!.npl + 1;
        }
        return h1;
    }
    
    func swapChild(_ heap:LeftistHeap) -> Void {
        let tempNode = heap.leftNode;
        heap.leftNode = heap.rightNode;
        heap.rightNode = tempNode;
    }
}
