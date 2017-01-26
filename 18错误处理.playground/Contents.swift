//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//表示并抛出错误
enum VendingMachineError : Error {
    ///选择无效
    case invalidSelection
    ///金额不足
    case insufficientFunds(coinsNeeded : Int)
    ///缺货
    case outOfStock
}

throw VendingMachineError.insufficientFunds(coinsNeeded: 5)

//处理错误

//用throwing函数传递错误

struct Item {
    var price : Int
    var count : Int
}

class VendingMachine {
    
    var inventory  = [
        "Candy Bar" : Item(price: 12, count: 10),
        "Chips" : Item(price: 10, count: 2),
        "Pretzels" : Item(price: 7, count: 1)
    ]
    
    func vend(ItemName name : String,money : Int) throws -> Int{
        
        guard let selectedItem = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard  selectedItem.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard selectedItem.price <= money else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: selectedItem.price - money)
        }
        
        let newMoney = money - selectedItem.price
        
        var item = selectedItem
        item.count -= 1
        inventory[name] = item
        
        return newMoney
    }
    
}










