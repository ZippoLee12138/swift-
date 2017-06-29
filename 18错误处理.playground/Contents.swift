//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
print(str)

//表示并抛出错误
enum VendingMachineError : Error {
    ///选择无效
    case invalidSelection
    ///金额不足
    case insufficientFunds(coinsNeeded : Int)
    ///缺货
    case outOfStock
}

//throw VendingMachineError.insufficientFunds(coinsNeeded: 5)

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
    
    var coinsDeposited = 0
    func dispenseSnack(snack:String) {
        print("Dispending\(snack)")
    }
    
    func vend(ItemName name : String) throws {
        
        print("aa")
        guard let selectedItem = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard  selectedItem.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard selectedItem.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: selectedItem.price - coinsDeposited)
        }
        
        coinsDeposited -= selectedItem.price
        
        var item = selectedItem
        item.count -= 1
        inventory[name] = item
        
        print("Dispending \(name)")
    }
    
}


let favoriteSnacks = [
    "Alice" : "Chips",
    "Bob":"Licorice",
    "Eve":"Pretzels",
]


func buyFavoriteSnack(person:String,vendingMachine:VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(ItemName: snackName)
}

var myVendingMachine = VendingMachine()

do {
    try buyFavoriteSnack(person: "B", vendingMachine: myVendingMachine)
} catch VendingMachineError.invalidSelection {
    print("Invalid Selection.")
} catch VendingMachineError.outOfStock{
    print("Out of Stock.")
} catch VendingMachineError.insufficientFunds(let coinsNeeded){
    print("Insufficient funds.Please insert an additional \(coinsNeeded) coins.")
}
print("bb")

func processFile(filename:String) throws {
    if exists(filename){
        let file = open(filename)
        defer {
            close(file)
        }
        while let line = try file.readline(){
            // 处理文件。
        }
        // close(file) 会在这里被调用，即作用域的最后。
    }
}


