//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

if (1,"zebra") < (2,"apple"){
    print("true")
}

if (4,"dog") == (4,"dog"){
    print("equal")
}

//合并空值运算符
let defaultColorName = "red"
var userDefinedColorName:String? = "green"
var colorNameToUse = userDefinedColorName ?? defaultColorName

//闭区间运算符
for index in 1...5{
    print("\(index) times 5 is \(index*5)")
}

let names = ["Anna","Alex","Brian","Jack"]
for index in 0..<names.count{
    print("Person \(index+1) is \(names[index])")
}


        