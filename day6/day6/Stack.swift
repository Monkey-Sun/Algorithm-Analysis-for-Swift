//
//  Stack.swift
//  day6
//
//  Created by Monkey-Sun on 2019/2/26.
//  Copyright © 2019 XLang. All rights reserved.
//

import Cocoa

class Stack: NSObject {
    fileprivate var topStack = -1;
    fileprivate let arrray = NSMutableArray();
    fileprivate let maxCapcity = 10000;
    
    func pop() -> Any {
        assert(self.topStack != -1, "can not pop null stack");
        let tempObj = self.arrray[self.topStack];
        self.arrray.removeObject(at: self.topStack);
        self.topStack -= 1;
        return tempObj;
    }
    
    func push(any obj:Any) -> Void {
        assert(self.maxCapcity > self.arrray.count, "stack overflow!");// assert 条件满足则报错
        self.arrray.add(obj);
        self.topStack += 1;
    }
    
    func isEmpty() -> Bool {
        return self.topStack == -1;
    }
    
    func topElement() -> Any {
        return self.arrray[self.topStack];
    }
}
