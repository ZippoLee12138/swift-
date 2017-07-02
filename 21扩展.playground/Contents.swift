//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//计算型属性
extension Double{
    var km : Double{ return self * 1000.0 }
    var m : Double{ return self }
    var cm : Double{ return self / 100.0 }
    var mm : Double{ return self / 1000.0 }
    
}

let oneInch = 25.4.mm
print("One inch is \(oneInch) meters.")

let threeKm = 3.km
print("Three km is \(threeKm) meters.")

let aMarathon = 42.km + 195.m
print("A marathon is \(aMarathon) meters long")

//构造器

struct Size {
    var width = 0.0,height = 0.0
}

struct Point {
    var x = 0.0,y = 0.0
}

struct Rect {
    var size = Size()
    var orgin = Point()
}

let defaultRect = Rect()
let memberwiseRect = Rect(size: Size(width: 5.0, height: 5.0) , orgin: Point(x: 2.0, y: 2.0))


extension Rect {
    init(center:Point,size:Size) {
        let orginX = center.x - size.width/2
        let orginY = center.y - size.height/2
        self.init(size:size, orgin: Point(x: orginX, y: orginY))
    }
}

let newRect = Rect(center: Point(x:4.0,y:4.0), size: Size(width: 3.0, height: 3.0))
print("x:\(newRect.orgin.x),y:\(newRect.orgin.y)")



//方法

extension Int {
    func repetitions(task:() -> Void) {
        for _ in 0..<self{
            task()
        }
    }
}

3.repetitions{
    print("hello")
}


//可变实例方法

extension Int {
    mutating func square() {
        self = self * self
    }
}

var someInt = 2
someInt.square()
print(someInt)

//下标

extension Int{
    subscript(digitIndex:Int) -> Int{
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}

print(76543210[3])
print(76543210[18])


//嵌套类型

extension Int {
    enum Kind {
        case Negative,Zero,Postive
    }
    
    var kind : Kind{
        switch self {
        case 0:
            return .Zero
        case let x where x > 0:
            return .Postive
        default:
            return .Negative
        }
    }
    
}

print(1.kind)


func printIntegerKinds(_ numbers : [Int]){
    for number in numbers{
        switch number.kind {
        case .Negative:
            print("-", separator: " ", terminator: "")
        case .Zero:
            print("0", separator: " ", terminator: "")
        case .Postive:
            print("+", separator: " ", terminator: "")
        }
    }
    print(" ")
}



printIntegerKinds([3,19,-27,0,-6,0,7])
