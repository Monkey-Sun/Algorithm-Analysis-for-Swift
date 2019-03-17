//
//  BinomialTree.swift
//  day10
//
//  Created by Monkey-Sun on 2019/3/17.
//  Copyright © 2019 XLang. All rights reserved.
//

import Cocoa
// 这里需要
class BinomialTree: NSObject,ElementProtocol {
    var element : Any?;
    var leftNode : BinomialTree?;
    var nextSibling : BinomialTree?;//下个兄弟节点
    fileprivate var index = -1;
    init(_ key:Int) {
        super.init();
        index = key;
    }
    var key: Int{
        return index;
    }
}
