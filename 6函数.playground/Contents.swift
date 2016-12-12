//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func addTwoInts(_ a : Int, _ b : Int) -> Int{
    
    return a + b
    
}

var mathFunc : (Int,Int) -> Int = addTwoInts
print(mathFunc(3,5))

func stepForward(_ input:Int) -> Int{
    return input + 1
}

func stepBackward(_ input:Int) -> Int{
    return input - 1
}

func chooseStepFunction(backward:Bool) -> (Int) -> Int{
    return backward ? stepBackward : stepForward
}

var currentValue = 3
let moveNearerToZero = chooseStepFunction(backward: currentValue>0)
print(moveNearerToZero)

while currentValue != 0 {
    print("currentValue:\(currentValue)")
    currentValue = moveNearerToZero(currentValue)
}

func chooseStepFunction02(backward:Bool) -> (Int) -> (Int){
    func stepForward(input: Int) -> Int {return input + 1}
    func stepBackward(input: Int) -> Int {return input - 1}
    return backward ? stepBackward : stepForward
}

var currentValue02 = -4
let moveNearerToZero02 = chooseStepFunction02(backward: currentValue02 > 0)
while currentValue02 != 0 {
    print("currentValue02：\(currentValue02)")
    currentValue02 = moveNearerToZero02(currentValue02)
}



