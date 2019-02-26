//
//  main.swift
//  day6
//
//  Created by Monkey-Sun on 2019/2/26.
//  Copyright © 2019 XLang. All rights reserved.
//

import Foundation
// 将一个中缀(infix)表达式 转换成 后缀(postfix)表达式
//let infixStr = "a+b*c+(d*e+f)*g"; // => abc*+de*f+g*+
//
//let operationStack = Stack();

func infixStringToPostfixString(_ infixStr:String) -> String {
    let mutableStr = NSMutableString(string: infixStr);
    let operationStack = Stack();
    let res = NSMutableAttributedString();

    for i in 0...(mutableStr.length - 1) {
        let c = mutableStr.character(at: i);
        let s = String(format: "%c", c);
        if !isOperator(c){
            res.append(NSAttributedString(string: s));
        }else{
            if operationStack.isEmpty(){
                operationStack.push(any: c);
            }else{
                if isCloseSymbol(c){
                    while operationStack.isEmpty() == false{
                        let loopTopOP = operationStack.topElement() as! unichar;
                        let popC = operationStack.pop() as! unichar;
                        if !isOpenSymbol(loopTopOP){
                            let op = String(format: "%c", popC);
                            res.append(NSAttributedString(string: op));
                        }else{
                            break;
                        }
                    }
                }else{
                    let topOP = operationStack.topElement() as! unichar;
                    if isOpenSymbol(topOP){
                        operationStack.push(any: c);
                        continue;
                    }
                    if checkHigherPriority(op1: c, op2: topOP){
                        operationStack.push(any: c);
                    }else{
                        while operationStack.isEmpty() == false{
                            let loopTopOP = operationStack.topElement() as! unichar;
                            if isOpenSymbol(loopTopOP){
                                break;
                            }
                            let popC = operationStack.pop() as! unichar;
                            if !isOpenSymbol(popC){
                                let op = String(format: "%c", popC);
                                res.append(NSAttributedString(string: op));
                            }else{
                                break;
                            }
                        }
                        operationStack.push(any: c);
                    }
                }
            }
        }
    }

    while !operationStack.isEmpty() {
        let popC = operationStack.pop() as! unichar;
        let op = String(format: "%c", popC);
        res.append(NSAttributedString(string: op));
    }

    return res.string;
}

func isOpenSymbol(_ c:unichar) -> Bool {
    return c == 40;
}

func isCloseSymbol(_ c:unichar) -> Bool {
    return c == 41;
}

func isOperator(_ value:unichar) -> Bool{
    let operatorString = NSMutableString(string: "+-*/()");
    let s = String(format: "%c", value);
    return operatorString.contains(s);
}

func getPrioraty(_ value:unichar)-> Int{
    let levelLow = NSMutableString(string: "+-");
    let levelMedium = NSMutableString(string: "*/%");
    let levelHigh = NSMutableString(string: "()")
    let c = String(format: "%c", value);
    if levelLow.contains(c) {
        return 0;
    }else if levelMedium.contains(c){
        return 1;
    }else if levelHigh.contains(c){
        return 2;
    }else{
        return -1;
    }
}

func checkHigherPriority(op1:unichar, op2:unichar)-> Bool{
    return getPrioraty(op1) >= getPrioraty(op2);
}

print(infixStringToPostfixString("a+b*c+(d*e+f)*g"));


