//
//  BinaryTreeNode.swift
//  day7
//
//  Created by Monkey-Sun on 2019/2/27.
//  Copyright © 2019 XLang. All rights reserved.
//

import Cocoa

class BinaryTreeNode: NSObject {
    var element:Any?;
    var num:Int = -1; // -1 代表空节点
    var leftNode:BinaryTreeNode?;
    var rightNode:BinaryTreeNode?;
}
