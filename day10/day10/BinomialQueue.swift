//
//  BinomialQueue.swift
//  day10
//
//  Created by Monkey-Sun on 2019/3/17.
//  Copyright © 2019 XLang. All rights reserved.
//

import Cocoa
// 二项队列，是有序树的集合，也成为森林。它的每一个元素是二项树，二项树的特点，对于一棵高度为k二项树B(k), B(0) 为一个单独节点，B(k)由 一棵B(k-1)插入另一棵B(k-1)的根处形成B(k)

let maxCapcity = 10000;


class BinomialQueue: NSObject {
    var currentSize = 0;
    var trees : Array<BinomialTree>!;
    var size = 0;
    
    override init() {
        super.init();
        trees = Array(repeating: BinomialTree(-1), count: maxCapcity);
    }
}


extension BinomialQueue{
    // 合并两个相同高度的二项树
    func combineTrees(_ t1:BinomialTree, _ t2:BinomialTree) -> BinomialTree {
        if t1.key > t2.key {
            return combineTrees(t2, t1);
        }
        t2.nextSibling = t1.leftNode;
        t1.leftNode = t2
        return t1;
    }
}

extension BinomialQueue{
    func merge(_ q1:BinomialQueue, _ q2:BinomialQueue) -> BinomialQueue {
        var t1 : BinomialTree;
        var t2 : BinomialTree;
        var carray:BinomialTree?;
        var i : Int = 0;
        var j:Int = 1;
        assert(q1.currentSize + q2.currentSize <= maxCapcity, "error, out of length");
        q1.currentSize += q2.currentSize;
        
        while j <= q1.currentSize {
            t1 = q1.trees![i];
            t2 = q2.trees![i];
            
            switch(isExsist(t1) + 2 * isExsist(t2) + 4 * isExsist(carray)){
            case 0: break;
            case 1: break;
            case 2:
                q1.trees![i] = t2;
                q2.trees?.remove(at: i);
                break;
            case 3:
                carray = combineTrees(t1, t2);
                q1.trees?.remove(at: i);
                q2.trees?.remove(at: i);
                break;
            case 4:
                q1.trees?[i] = carray!;
                carray = nil;
                break;
            case 5:
                carray = combineTrees(t1, carray!);
                q1.trees?.remove(at: i);
                break;
            case 6:
                carray = combineTrees(t2, carray!);
                q2.trees?.remove(at: i);
                break;
            default:
                q1.trees?[i] = carray!;
                carray = combineTrees(t1, t2);
                q2.trees?.remove(at: i);
                break;
            }
            
            i += 1;
            j *= 2;
        }
        
        return q1;
    }
    
    fileprivate func isExsist(_ p:Any?) -> Int {
        if p == nil {
            return 0;
        }
        return 1;
    }
}

extension BinomialQueue{
    func dequeue() -> BinomialTree? {
        var deletedTree : BinomialTree;
        var oldRoot : BinomialTree;
        var minItem :BinomialTree?; //最小的key 对应的Element
        var minKey = -1;
        
        assert(size != 0, "队列是空的，无法删除");
        
        for i in 0..<size {
            if trees[i].key < minKey{
                minItem = trees[i];
                minKey = i;
            }
        }
        
        deletedTree = trees[minKey];
        oldRoot = deletedTree;
        deletedTree = deletedTree.leftNode!;
        
        let deletedQueue = BinomialQueue();
        deletedQueue.size = (1 << minKey) - 1;
        for j in (0...(minKey - 1)).reversed() {
            deletedQueue.trees[j] = deletedTree;
            deletedTree = deletedTree.nextSibling!;
            deletedQueue.trees[j].nextSibling = nil;
        }
        trees.remove(at: minKey);
        currentSize -= deletedQueue.size + 1;
        merge(self, deletedQueue);
        return minItem;
    }
}
