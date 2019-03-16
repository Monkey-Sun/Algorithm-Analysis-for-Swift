//
//  Event.swift
//  day9
//
//  Created by Monkey-Sun on 2019/3/16.
//  Copyright © 2019 XLang. All rights reserved.
//

import Cocoa

enum EventType {
    case arrive;
    case departrue;
}

class Event:NSObject, ElementProtocol{
    var occur_time = 0;
    var event_type = EventType.arrive;
    var service_index = -1;
    
    /// init
    /// 到达是没窗口的
    /// - Parameter time: 顾客到达时间
    init(_ time:Int) {
        super.init();
        occur_time = time;
    }
    
    var key:Int{
        return occur_time;
    }
    
    
    /// 离开事件
    ///
    /// - Parameters:
    ///   - time: 离开时刻
    ///   - type: 类型
    ///   - serviceIndex: 从哪个服务窗口离开
    convenience init(_ time:Int, _ type:EventType, _ serviceIndex:Int) {
        self.init(time);
        event_type = type;
        service_index = serviceIndex;
    }
}
