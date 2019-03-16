//
//  Customer.swift
//  day9
//
//  Created by Monkey-Sun on 2019/3/16.
//  Copyright © 2019 XLang. All rights reserved.
//

import Cocoa

class Customer: NSObject, ElementProtocol{
    var status = -1; //0 等待; 1 离开
    var arrive_time = 0;
    
    var key: Int{
        return arrive_time;
    }
    
    init(_ arrivet:Int) {
        super.init();
        arrive_time = arrivet;
    }
}
