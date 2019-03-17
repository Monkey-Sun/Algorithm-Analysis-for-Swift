//
//  ElementProtocol.swift
//  day10
//
//  Created by Monkey-Sun on 2019/3/17.
//  Copyright © 2019 XLang. All rights reserved.
//

import Foundation

/// 这个协议，主要是为了使树的节点拥有根据key排序的d能力。 接口继承本类，并实现key的get方法即可。
protocol ElementProtocol {
    var key:Int{get};
}
