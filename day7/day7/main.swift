//
//  main.swift
//  day7
//
//  Created by Monkey-Sun on 2019/2/27.
//  Copyright © 2019 XLang. All rights reserved.
//

import Foundation

func isOperator(_ value:unichar) -> Bool{
    let operatorString = NSMutableString(string: "+-*/()");
    let s = String(format: "%c", value);
    return operatorString.contains(s);
}


// test str ab+cde+**

func creatExpressionTree(_ postFix:String) -> Void {
    let mutableStr = NSMutableString(string: postFix);
    let treeStack = Stack();
    
    for i in 0...(mutableStr.length - 1) {
        let c = mutableStr.character(at: i);
        if !isOperator(c){ //如果是操作数，则生成一个单节点二叉树，并将其push到stack中
            let operand = BinaryTreeNode();
            operand.element = String(format: "%c", c);
            treeStack.push(any: operand);
        }else{// 如果是操作符 则 从栈中弹出T1 和 T2，该操作符作为 T1, T2的根， 再将 操作符树压入栈中
            var count = 0;
            let operatorNode = BinaryTreeNode();
            operatorNode.element = String(format: "%c", c);
            while !treeStack.isEmpty(){
                count += 1;
                let popTreeNode = treeStack.pop() as! BinaryTreeNode;
                if count == 1{
                    operatorNode.leftNode = popTreeNode;
                }else{
                    operatorNode.rightNode = popTreeNode;
                    break;
                }
            }
            treeStack.push(any: operatorNode);
        }
    }
    let n = treeStack.topElement() as! BinaryTreeNode;
    print(n);
}

let st = SearchTree.insert(5, nil);
let s1t = SearchTree.insert(4, st);
var s2t:Optional = SearchTree.insert(6, s1t);//s2t转换成 可变可选 否则无法使用inout 关键字 inout 关键字：函数的参数可变

//print(SearchTree.findMax(s2t));
//print(SearchTree.findMin(s2t));

SearchTree.delete(6, &s2t); //inout 关键字的使用 参数必须可变可选

print(1);

creatExpressionTree("ab+cde+**");
