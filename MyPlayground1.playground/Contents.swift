//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

print("Hello,world!")
print(str)

let myConstant = 2
str = "aa"
var explicitDouble:Double = 70

explicitDouble = 2


let a:Float = 4
let label = "The width is"
let width:Float = 94
var widthLabel = label + String(width)
widthLabel = "label :\(widthLabel) \(a + width)"


var shoppingList = ["catfish","water","tulips","blue paint"]
shoppingList[0] = "dogFood"
print(shoppingList)

var occupations = ["Malcolm":"Captain","Kaylee":"Mechanic"]
occupations["Malcolm"]="Caption"
print(occupations)

let x=0.0,y=0.0,z=0.0
var welcomeMessage:String = "初始化"

let 你好 = "你好"
let  🐶 = "dogcow"
🐶
let `let` = "保留字"
`let`
var hello = "Bonjour!"
hello = "Salut!~";print(hello)

print(welcomeMessage,hello,你好,🐶, separator: "++++", terminator: "****")
print("welcomeMessage is \(welcomeMessage)")

//注释
/*
 多行注释
 /*内嵌多行注释*/
 */

var one:UInt8 = 3
one + UInt8(3.14)

3 + 3.14

typealias my_Int = UInt16
var firstInt = my_Int.min
firstInt

let http404Error = (404,"Not Found")
print(http404Error)

let (statusCode,statusMessage) = http404Error
print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")

let (justTheStatusCode,_) = http404Error
print("The justTheStatusCode is \(justTheStatusCode)")

print("The status code is \(http404Error.0)")

let http200Status = (statusCode:200,description:"OK")
print("The http200StatusCode is \(http200Status.statusCode)")
print("The http200Description is \(http200Status.description)")

let possibleNumber = "12hj34"
let convertedNumber:Int? = Int(possibleNumber)

var serverResponseCode:Int? = 404
serverResponseCode = nil

var surveyAnswer:String? = "aa"

if (surveyAnswer != nil){
    print("convertedNumber has an integer value of \(surveyAnswer!)")
}

if let temStr = surveyAnswer{
    print("存在：\(temStr)")
}else{
    print("不存在")
}

if let firstNum = Int("4"),secondNum = Int("42") where firstNum < secondNum{
    print("\(firstNum)<\(secondNum)")
}


let assumedString:String!
//    = "An implicitly unwrapped option string."
let implicitlyString


