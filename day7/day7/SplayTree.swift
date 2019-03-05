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
    
    //TODO: zig-zig:一字型旋转  zig-zag:之字形旋转
    static func splayNode(_ x:Int, _ tree:inout SplayTree?) -> SplayTree?{
        if tree == nil{
            return tree;
        }else{
            if x < tree!.element!{
                if tree!.leftNode == nil{
                    return tree;
                }else if x < tree!.leftNode!.element!{ //Zig-Zig 旋转
                    tree!.leftNode!.leftNode = splayNode(x, &tree!.leftNode!.leftNode);
                    tree = singleRotateLeft(tree!);
                }else{// Zig-zag 旋转
                    tree!.leftNode!.rightNode = splayNode(x, &tree!.leftNode!.rightNode);
                    if tree?.leftNode!.rightNode != nil{
                        tree!.leftNode = singleRotateRight(tree!.leftNode!);
                    }
                }
                
                return tree!.leftNode == nil ? tree : singleRotateLeft(tree!);
            }else if x > tree!.element!{
                if tree!.rightNode == nil{
                    return tree;
                }
                
                if x < tree!.rightNode!.element!{
                    tree!.rightNode!.leftNode = splayNode(x, &tree!.rightNode!.leftNode);
                    if tree!.rightNode!.leftNode != nil{
                        tree!.rightNode = singleRotateRight(tree!.rightNode!);
                    }
                }else{
                    tree!.rightNode!.rightNode = splayNode(x, &tree!.rightNode!.rightNode);
                    tree = singleRotateLeft(tree!);
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
}
