//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//表示并抛出错误
enum VendingMachineError : Error {
    
    case invalidSelection                       //选择无效
    case insufficientFunds(coinsNeeded : Int)   //金额不足
    case outOfStock                             //缺货
}

throw VendingMachineError.insufficientFunds(coinsNeeded: 5)

//处理错误

//用throwing函数传递错误

struct Item {
    var price : Int
    var count : Int
}

class VendingMachine {
    
    
    
}









