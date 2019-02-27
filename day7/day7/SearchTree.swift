//
//  SearchTree.swift
//  day7
//
//  Created by Monkey-Sun on 2019/2/27.
//  Copyright © 2019 XLang. All rights reserved.
//

import Cocoa

class SearchTree: BinaryTreeNode {
    static func find(_ targetNum:Int, _ Tree:SearchTree?) -> SearchTree? {
        if Tree == nil {
            return nil;
        }else if targetNum < Tree!.num {
            return find(targetNum, Tree?.leftNode as? SearchTree);
        }else if targetNum > Tree!.num {
            return find(targetNum, Tree?.rightNode as? SearchTree)
        }else{
            return Tree;
        }
    }
    
    static func findMin(_ Tree:SearchTree?) -> Int {
        if Tree?.leftNode != nil {
            return findMin(Tree!.leftNode as? SearchTree);
        }else{
            return Tree!.num;
        }
    }
    
    static func findMax(_ Tree:SearchTree) -> Int {
        var tempT = Tree;
        while tempT.rightNode != nil {
            tempT = Tree.rightNode! as! SearchTree;
        }
        return tempT.num;
    }
    
    static func insert(_ num:Int, _ Tree:SearchTree?) -> SearchTree { // 为了简化 如果 num 在树中 e则啥也不干
        var tempT = Tree;
        if tempT == nil {
            tempT = SearchTree();
            tempT!.num = num;
        }else{
            if num < tempT!.num{
                tempT!.leftNode = insert(num, tempT!.leftNode as? SearchTree);
            }else if num > tempT!.num{
                tempT!.rightNode = insert(num, tempT!.rightNode as? SearchTree);
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
    
    
}
