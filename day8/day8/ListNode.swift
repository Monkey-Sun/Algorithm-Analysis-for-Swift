//
//  ListNode.swift
//  day8
//
//  Created by Monkey-Sun on 2019/3/6.
//  Copyright © 2019 XLang. All rights reserved.
//

import Cocoa

class ListNode: NSObject {
    var next : ListNode?;
    var element : Int?
    
    static func MakeEmpty() -> ListNode{
        return ListNode();
    }
}
