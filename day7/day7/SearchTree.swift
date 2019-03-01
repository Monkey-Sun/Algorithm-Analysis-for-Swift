//
//  SearchTree.swift
//  day7
//
//  Created by Monkey-Sun on 2019/2/27.
//  Copyright © 2019 XLang. All rights reserved.
//

import Cocoa

class SearchTree: NSObject {
    var num:Int = -1; // -1 代表空节点
    var leftNode:SearchTree?;
    var rightNode:SearchTree?;
    
    static func find(_ targetNum:Int, _ Tree:SearchTree?) -> SearchTree? {
        if Tree == nil {
            return nil;
        }else if targetNum < Tree!.num {
            return find(targetNum, Tree?.leftNode);
        }else if targetNum > Tree!.num {
            return find(targetNum, Tree?.rightNode)
        }else{
            return Tree;
        }
    }
    
    static func findMin(_ Tree:SearchTree?) -> SearchTree? {
        if Tree?.leftNode != nil {
            return findMin(Tree!.leftNode);
        }else{
            return Tree;
        }
    }
    
    static func findMax(_ Tree:SearchTree) -> Int {
        var tempT = Tree;
        while tempT.rightNode != nil {
            tempT = Tree.rightNode!;
        }
        return tempT.num;
    }
    
    static func insert(_ num:Int, _ Tree:SearchTree?) -> SearchTree{ // 为了简化 如果 num 在树中 e则啥也不干
        var tempT = Tree;
        if tempT == nil {
            tempT = SearchTree();
            tempT!.num = num;
        }else{
            if num < tempT!.num{
                tempT!.leftNode = insert(num, tempT!.leftNode);
            }else if num > tempT!.num{
                tempT!.rightNode = insert(num, tempT!.rightNode);
            }
        }
        
        return tempT!;
    }
    
//    func insert(_ num:Int, _ Tree:SearchTree) -> Void { // 为了简化 如果 num 在树种 e则啥也不干
//        if num < Tree.num {
//            if Tree.leftNode != nil{
//                insert(num, Tree.leftNode as! SearchTree);
//            }else{
//                let node = SearchTree();
//                node.num = num;
//                Tree.leftNode = node;
//            }
//        }else if num == Tree.num{
//            let node = SearchTree();
//            node.num = num;
//            node.rightNode = Tree.rightNode;
//            Tree.rightNode = node;
//        }else{
//            if Tree.rightNode != nil{
//                insert(num, Tree.rightNode as! SearchTree);
//            }else{
//                let node = SearchTree();
//                node.num = num;
//                Tree.rightNode = node;
//            }
//        }
//    }
    
    static func delete(_ x:Int, _ tree: inout SearchTree?) -> SearchTree? {
        
        if tree == nil {
            return nil;
        }else{
            if x > tree!.num{ //向右查找
                tree?.rightNode = delete(x,  &tree!.rightNode);
            }else if x < tree!.num{//向左查找
                tree?.leftNode = delete(x, &tree!.leftNode);
            }else{ //若相等 执行真正的删除
                if tree!.leftNode == nil && tree!.rightNode == nil{ // 说明是叶子节点，直接删除即可
                    tree = nil;
                }else if tree!.leftNode != nil && tree!.rightNode != nil{ //左右节点都有 规则是 用右子树最小节点顶替要删除的节点，再递归的去删除右子树中的那个最小节点。question 为啥是处理右子树？因为二叉树的定义，对于任意节点x，其左子树的所有节点j均小于x,右子树所有节点均大于x。因此z删除原节点，左子树没有满足条件的节点带顶替.
                    let minNode = findMin(tree!.rightNode);
                    tree?.num = (minNode?.num)!;
                    tree?.rightNode = delete(minNode!.num, &tree!.rightNode);
                }else{
                    if tree!.leftNode == nil{
                        tree = tree?.rightNode;
                    }else{
                        tree = tree?.leftNode;
                    }
                }
            }
        }
        return tree;
    }
}
