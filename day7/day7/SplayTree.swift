//
//  SplayTree.swift
//  day7
//
//  Created by Monkey-Sun on 2019/3/5.
//  Copyright © 2019 XLang. All rights reserved.
//

import Cocoa

class SplayTree: NSObject {
    var leftNode : SplayTree?
    var rightNode : SplayTree?
    
    var element : Int?
    
    // SplayTree 不需要记录高度和平衡
    static func insert(_ x:Int, _ tree:SplayTree?) -> SplayTree {  //此处插入 均为常数时间
        var tempT = tree
        if tempT == nil{
            tempT = SplayTree();
            tempT!.element = x;
        }else{
            let treeNode = SplayTree();
            treeNode.element = x;
            if x > tempT!.element!{
                treeNode.leftNode = tempT;
                tempT = treeNode;
            }else{
                tempT!.leftNode = treeNode;
            }
        }
        return tempT!;
    }
    
    static func find(_ x:Int, _ tree:inout SplayTree?) -> SplayTree? { //访问节点x 该节点需要返回到根处  因此需要进行一系列的AVL
        return splayNode(x, &tree);
    }
    
    static func splayNode(_ x:Int, _ tree:inout SplayTree?) -> SplayTree? {
        if tree == nil {
            return tree;
        }else{
            if x < tree!.element!{//向左查找
                if tree!.leftNode == nil{
                    return tree;
                }
                if x < tree!.leftNode!.element!{
                    tree!.leftNode!.leftNode = splayNode(x, &tree!.leftNode!.leftNode);
                    tree = singleRotateLeft(tree!);
                }else{
                    tree!.leftNode!.rightNode = splayNode(x, &tree!.leftNode!.rightNode);
                    if tree!.leftNode!.rightNode != nil{
                        tree!.leftNode = singleRotateRight(tree!.leftNode!);
                    }
                }
                return tree!.leftNode == nil ? tree : singleRotateLeft(tree!);
            }else if x > tree!.element!{//向左查找
                if tree!.rightNode == nil{
                    return tree;
                }
                if x < tree!.rightNode!.element!{
                    tree!.rightNode!.leftNode = splayNode(x, &tree!.rightNode!.leftNode);
                    if tree!.rightNode!.leftNode != nil{
                        tree!.rightNode = singleRotateLeft(tree!.rightNode!);
                    }
                }else{
                    tree!.rightNode!.rightNode = splayNode(x, &tree!.rightNode!.rightNode);
                    tree = singleRotateRight(tree!);
                }
                return tree!.rightNode == nil ? tree : singleRotateRight(tree!);
            }else{
                return tree;
            }
        }
    }
    
    static func singleRotateLeft(_ k2:SplayTree) -> SplayTree {
        let k1 = k2.leftNode;
        k2.leftNode = k1?.rightNode;
        k1?.rightNode = k2;
        return k1!;
    }
    
    static func singleRotateRight(_ k1:SplayTree) -> SplayTree {
        let k2 = k1.rightNode!;
        k2.leftNode = k1;
        k1.rightNode = k2.leftNode
        return k2;
    }
    
//    树的遍历                                            // 根-左-右  先序
    static func printTree(_ tree:SplayTree?) -> Void {  // 左-根-左  中序
                                                        // 左-右-根  先序
        if tree != nil {//对一颗查找树  进行中序遍历打印 打印出来的就是排好序的
            printTree(tree?.leftNode);
            print("\(tree!.element ?? -1)");
            printTree(tree?.rightNode);
        }
    }
    
    static func getHeigt(_ tree:SplayTree?) ->Int{
        if tree == nil {
            return -1;
        }else{
            return max(getHeigt(tree!.leftNode), getHeigt(tree!.rightNode)) + 1;
        }
    }
}
