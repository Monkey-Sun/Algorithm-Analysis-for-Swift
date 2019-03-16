//
//  RandomManager.swift
//  day9
//
//  Created by Monkey-Sun on 2019/3/16.
//  Copyright © 2019 XLang. All rights reserved.
//

import Cocoa

// 加入
class RandomManager: NSObject {
    
    // 每分钟来的客户是随机的
    static func arriveCustomers() -> Int {
        return getRandomNumber(1, 10); // 假设是每分钟1-10个
    }
    
    // 顾客的到达时间是随机的
    static func arrivedTime() -> Int {
        return 1000;
    }
    
    //每个客户需要的服务时间是随机的
    static func customer_seviceTime() -> Int {
        return 1000;
    }
    
    fileprivate static func getRandomNumber(_ from:Int, _ to:Int) -> Int{
        return Int(arc4random_uniform(UInt32(to)))+from;
    }
}
