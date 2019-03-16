//
//  NumberKey.swift
//  day9
//
//  Created by Monkey-Sun on 2019/3/16.
//  Copyright © 2019 XLang. All rights reserved.
//

import Cocoa

class NumberKey: NSObject , ElementProtocol{
    var num : Int!
    init(_ n:Int) {
        super.init();
        num = n;
    }
    
    var key: Int {
        return num;
    }
    
}
