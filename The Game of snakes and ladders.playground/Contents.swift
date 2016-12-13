//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let numOfGate = 25
var board = [Int](repeating:0,count:numOfGate+1)
board[03] = +08
board[06] = +09
board[09] = +09
board[10] = +02
board[14] = -10
board[19] = -11
board[22] = -02
board[24] = -08

var currentGate = 1

let max:UInt32 = 7
let min:UInt32 = 1
while currentGate < numOfGate {
    let random = (Int)(arc4random_uniform(max - min) + min)
    print("currentGate:\(currentGate) random:\(random)")
    currentGate += random
    if currentGate <= numOfGate {
        print("board:\(board[currentGate])")
        currentGate += board[currentGate]
    }
    print(currentGate)
}

print("方法二：")
currentGate = 1
repeat{
    let random = (Int)(arc4random_uniform(max - min) + min)
    print("currentGate:\(currentGate) random:\(random)")
    currentGate += random
    if currentGate < numOfGate {
        print("board:\(board[currentGate])")
        currentGate += board[currentGate]
    }
    print(currentGate)

}while currentGate < numOfGate

print("必须刚好落在第25个方块中：")
currentGate = 1

gameLoop: repeat{
    
    let random = (Int)(arc4random_uniform(max - min) + min)
    
    let tem = currentGate + random
    if  tem > numOfGate{
        
        var tem02 = currentGate
        while tem02 != numOfGate {
            tem02 = currentGate
            let random02 = (Int)(arc4random_uniform(max - min) + min)
            tem02 = currentGate + random02
            print("currentGate:\(currentGate) random02:\(random02)")
            if tem02 == numOfGate{
                currentGate += random02
                break gameLoop
            }
        }
        
    }
    
    currentGate += random
    if currentGate < numOfGate {
        currentGate += board[currentGate]
    }
    
}while currentGate != numOfGate

print("Game over!\(currentGate)")


print("必须刚好落在第25个方块中：方法2:")
currentGate = 1

gameLoop2 : while currentGate != numOfGate {

    let random03 = (Int)(arc4random_uniform(max - min) + min)
    switch currentGate + random03 {
    case numOfGate:
        currentGate += random03
        break gameLoop2
    case let newSquare where newSquare > numOfGate:
        print("2:currentGate: \(currentGate) random03: \(random03)")
        continue gameLoop2
    default:
        currentGate += random03
        currentGate += board[currentGate]
 }

}
print(currentGate)


func greet(){
    guard currentGate == 25 else {
        print("no")
        return
    }
    print("yes")
    
    guard #available(iOS 8,macOS 10.10, *) else {
        print("under")
        return
    }
    print("on")
}

greet()


