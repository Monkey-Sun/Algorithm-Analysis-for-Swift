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
    
    static func delete(_ x:Int, _ tree: inout SearchTree?) -> Void {
        if tree == nil {
            return;
        }else{
            if x > tree!.num{ //向右查找
                delete(x,  &tree!.rightNode);
            }else if x < tree!.num{//向左查找
                delete(x, &tree!.leftNode);
            }else{ //执行真正的删除
                if tree!.leftNode == nil && tree!.rightNode == nil{ // 说明是叶子节点，直接删除即可
                    tree = nil;
                }else if tree!.leftNode != nil && tree!.rightNode != nil{ //左右节点都有
                    let minNode = findMin(tree!.rightNode);
                    minNode!.rightNode = tree!.rightNode;
                    tree = minNode;
                }else{
                    if tree!.leftNode != nil{
                        delete(x, &tree!.leftNode);
                    }else{
                        delete(x, &tree!.rightNode);
                    }
                }
            }
        }
    }
}
