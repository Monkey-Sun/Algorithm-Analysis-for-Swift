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
//let astack = Stack();

func getInfixString(_ infixStr:String) -> String {
// => abc*+de*f+g*+
    let mutableStr = NSMutableString(string: infixStr);
    let astack = Stack();
    let res = NSMutableAttributedString();

    for i in 0...(mutableStr.length - 1) {
        let c = mutableStr.character(at: i);
        let s = String(format: "%c", c);
        if !isOperator(c){
            res.append(NSAttributedString(string: s));
        }else{
            if astack.isEmpty(){
                astack.push(any: c);
            }else{
                if isCloseC(c){
                    while astack.isEmpty() == false{
                        let topOP = astack.topElement() as! unichar;
                        let popC = astack.pop() as! unichar;
                        if !isOpenC(topOP){
                            let op = String(format: "%c", popC);
                            res.append(NSAttributedString(string: op));
                        }else{
                            break;
                        }
                    }
                }else{
                    let topOP = astack.topElement() as! unichar;
                    if isOpenC(topOP){
                        astack.push(any: c);
                        continue;
                    }
                    if checkHigherPriority(o1: c, o2: topOP){
                        astack.push(any: c);
                    }else{
                        while astack.isEmpty() == false{
                            let topOP = astack.topElement() as! unichar;
                            if isOpenC(topOP){
                                break;
                            }
                            let popC = astack.pop() as! unichar;
                            if !isOpenC(popC){
                                let op = String(format: "%c", popC);
                                res.append(NSAttributedString(string: op));
                            }else{
                                break;
                            }
                        }
                        astack.push(any: c);
                    }
                }
            }
        }
    }

    while !astack.isEmpty() {
        let popC = astack.pop() as! unichar;
        let op = String(format: "%c", popC);
        res.append(NSAttributedString(string: op));
    }

    return res.string;
}

func isOpenC(_ c:unichar) -> Bool {
    return c == 40;
}

func isCloseC(_ c:unichar) -> Bool {
    return c == 41;
}

func isOperator(_ value:unichar) -> Bool{
    let operatorString = NSMutableString(string: "+-*/()");
    let s = String(format: "%c", value);
    return operatorString.contains(s);
}

func getPrioraty(_ value:unichar)-> Int{
//    +43   -45    *42   /47   (40   )41
    switch(value){
    case 43:
        return 0;
    case 45:
        return 0;
    case 42:
        return 1;
    case 47:
        return 1;
    case 40:
        return 2;
    case 41:
        return 2;
    default:
        return 0;
    }
}

func checkHigherPriority(o1:unichar, o2:unichar)-> Bool{
    return getPrioraty(o1) >= getPrioraty(o2);
}

print(getInfixString("(a+b)*c+(d*e+f)*g+h"));


