//
//  SearchTree.swift
//  day7
//
//  Created by Monkey-Sun on 2019/2/27.
//  Copyright © 2019 XLang. All rights reserved.
//

import Cocoa

class SearchTree: BinaryTreeNode {
    static func makeEmpty(_ Tree:SearchTree?) -> Void {
        if Tree != nil {
            SearchTree.makeEmpty(Tree!.leftNode as? SearchTree);
            SearchTree.makeEmpty(Tree!.rightNode as? SearchTree);
        }
    }
    
    static func find(_ targetNum:Int, _ Tree:SearchTree?) -> SearchTree {
        if Tree == nil {
            return SearchTree();
        }else if targetNum < Tree!.num {
            return find(targetNum, Tree?.leftNode as? SearchTree);
        }else if targetNum > Tree!.num {
            return find(targetNum, Tree?.rightNode as? SearchTree)
        }else{
            return Tree!;
        }
    }
    
    static func findMin(_ Tree:SearchTree) -> SearchTree {
        if Tree.leftNode != nil {
            return findMin(Tree);
        }else{
            return Tree;
        }
    }
    
    static func findMax(_ Tree:SearchTree) -> SearchTree {
//        if Tree.rightNode != nil {
//            return findMax(Tree);
//        }else{
//            return Tree;
//        }
        var tempT = Tree;
        while Tree.rightNode != nil {
            tempT = Tree.rightNode! as! SearchTree;
        }
        return tempT;
    }
}
