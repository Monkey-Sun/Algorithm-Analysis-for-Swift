//
//  main.swift
//  day9
//
//  Created by Monkey-Sun on 2019/3/11.
//  Copyright © 2019 XLang. All rights reserved.
//

import Foundation


var PQ:Optional = PriorityQueue(100, -1);

for i in (0...100).reversed(){
    PQ!.insert(i);
}

//print(PQ);

for _ in 0...100{
    print(PriorityQueue.deleteMin(&PQ!));
}
