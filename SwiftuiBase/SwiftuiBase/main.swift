//
//  main.swift
//  SwiftuiBase
//
//  Created by ldd on 2022/2/10.
//  guard 语句

import Foundation

func test1(params: Int) {
    /// 当不满足表达式的时候,进入该语句
    guard params < 10 else {
        print("进入guard语句里面")
        print()
        return
    }
    print("hello world ")
}

test1(params: 15)

var a: String?

func test2(param: String?) {
    guard let value = param else {
        print("进入guard语句里")
        return
    }
    print(value)
}

test2(param: a)

/// inout 关键字
/// 值传递->地址引入

func test3(param: inout Int) {
    param = param * 20
    print(param)
}

var b = 10

// 传入前
print(b)
test3(param: &b)
print(b)



print("-------------")
/// 定义函数类型
var funA: () -> Void
var funB: (Int, String) -> String
let funC: ([Int]) -> (Int, String)

func f1() -> Void {
    print("void")
}

var funA1: ()-> Void = f1
funA1()

var funA2: ()-> Void = {()->Void in
    print("匿名函数")
}
funA2()

func f2(p1: Int,p2: String) -> String {
    return String(p1) + p2;
}

var funB1: (Int,String) -> String = f2
print(funB1(10,"哈哈"))
