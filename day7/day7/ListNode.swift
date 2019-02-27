//
//  ListNode.swift
//  day7
//
//  Created by Monkey-Sun on 2019/2/27.
//  Copyright © 2019 XLang. All rights reserved.
//

import Cocoa

class ListNode: NSObject {
    var element:Any?;
    var next : ListNode?;
    var previous : ListNode?;// 有previous 双链表  没有则h为单链表
}
