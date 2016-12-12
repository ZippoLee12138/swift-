//: Playground - noun: a place where people can play

import UIKit

var aWin = false
var bWin = false
var aWinCount = 0
var bWinCount = 0

while !aWin && !bWin{
   let a = arc4random_uniform(6) + 1
   let b = arc4random_uniform(6) + 1
    if a > b{
        print("A win")
        bWinCount = 0
        aWinCount+=1
    }else if a < b {
        print("B win")
        aWinCount = 0
        bWinCount+=1
    }else{
        continue
    }
    
    if aWinCount == 3{
        aWin = true
    }else if bWinCount == 3{
        bWin = true
    }

}

let assumedString:String! = "assumed"
if let temStr = assumedString{
    print(temStr)
}
assert(assumedString == "assumed","不等于")

"hello,"+"world"
