//
//  AVLTreeNode.swift
//  day7
//
//  Created by Monkey-Sun on 2019/3/2.
//  Copyright © 2019 XLang. All rights reserved.
//

import Cocoa

class AVLTreeNode: NSObject {
    var element:Int?;
    var leftNode : AVLTreeNode?;
    var rightNode : AVLTreeNode?
    var height:Int = -1;
    
    static func find(_ x:Int, _ tree:AVLTreeNode?) -> AVLTreeNode? {
        if tree == nil {
            return nil;
        }else{
            if x > tree!.element!{
                return find(x, tree?.rightNode);
            }else if x < tree!.element!{
                return find(x, tree?.leftNode);
            }
        }
        
        return tree;
    }
    
    static func insert(_ x:Int, _ tree:inout AVLTreeNode?) -> AVLTreeNode {
        if tree == nil {
            let t = AVLTreeNode();
            t.element = x;
            t.height = t.height + 1;
            return t;
        }else{
            if x < tree!.element!{
                tree!.leftNode = insert(x, &tree!.leftNode); // 向左儿子插入
                if tree!.leftNode!.height - tree!.rightNode!.height == 2{
                    if x < tree!.leftNode!.element!{ // 向左儿子的左子树插入
                        //单旋
                        tree = singleRotateLeft(tree!);
                    }else{
                        //双旋
                        tree = doubleRotateLeft(tree!);
                    }
                }
            }else{// 向右儿子插入
                tree!.rightNode = insert(x, &tree!.rightNode);
                if tree!.rightNode!.height - tree!.leftNode!.height == 2{ //如果不平衡
                    if x > tree!.rightNode!.element!{ //向右儿子的右子树插入节点
                        //单旋
                        tree = singleRotateRight(tree!);
                    }else{
                        //双旋
                        tree = doubleRotateRight(tree!);
                    }
                }
            }
        }
        tree!.height = max(tree!.leftNode!.height, tree!.rightNode!.height) + 1;
        return tree!;
    }
    
    static func singleRotateLeft(_ k2:AVLTreeNode) -> AVLTreeNode {
        let k1 = k2.leftNode!;
        k2.leftNode = k1.rightNode;
        k1.rightNode = k2;
        k2.height = max(k2.leftNode!.height, k2.rightNode!.height) + 1;
        k1.height = max(k1.leftNode!.height, k1.rightNode!.height) + 1;
        return k1;
    }
    
    static func singleRotateRight(_ k1:AVLTreeNode) -> AVLTreeNode {
        let k2 = k1.rightNode!;
        k1.rightNode = k2.leftNode;
        k2.leftNode = k1;
        k2.height = max(k2.leftNode!.height, k2.rightNode!.height) + 1;
        k1.height = max(k1.leftNode!.height, k1.rightNode!.height) + 1;
        return k2;
    }
    
    static func doubleRotateLeft(_ k3:AVLTreeNode) -> AVLTreeNode {
        k3.leftNode = singleRotateRight(k3.leftNode!);
        return singleRotateLeft(k3);
    }

    static func doubleRotateRight(_ k1:AVLTreeNode) -> AVLTreeNode {
        //左旋k2 k3
        k1.rightNode = singleRotateLeft(k1.rightNode!);
        return singleRotateRight(k1);
    }
}
