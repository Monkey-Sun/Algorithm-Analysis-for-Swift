//
//  main.swift
//  day9
//
//  Created by Monkey-Sun on 2019/3/11.
//  Copyright © 2019 XLang. All rights reserved.
//

import Foundation


let PQ = PriorityQueue(100);

for i in (0..<100).reversed(){
    PQ.insert(i);
}

print(PQ);
