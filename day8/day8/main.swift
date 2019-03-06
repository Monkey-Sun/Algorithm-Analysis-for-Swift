//
//  main.swift
//  day8
//
//  Created by Monkey-Sun on 2019/3/6.
//  Copyright © 2019 XLang. All rights reserved.
//

import Foundation

//let hashT = HashTable.initialTable(10);
//
//print(hashT);

var hashT:HashTable?;

for i in 0...1000{
    hashT = HashTable.insert(i, &hashT);
}

let node = HashTable.find(999, hashT!);


print(hashT);



