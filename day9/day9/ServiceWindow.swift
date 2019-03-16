//
//  ServiceWindow.swift
//  day9
//
//  Created by Monkey-Sun on 2019/3/16.
//  Copyright © 2019 XLang. All rights reserved.
//

import Cocoa

class ServiceWindow: NSObject {
    var busy = false;
    var current_cus : Customer?;
    var start_time = 0;
    
    func serve_customer(_ cus:Customer) -> Void {
        // 窗口开始服务
        current_cus = cus;
    }
    
    func set_service_start_time(_ cureent_time:Int) -> Void {
        start_time = cureent_time;
    }
    
    func get_customer_duration() -> Int {
        if current_cus != nil{
            return current_cus!.duration;
        }else{
            return 0;
        }
    }
}
