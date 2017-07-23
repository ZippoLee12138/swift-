//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//  位取反运算符 ~

let initialBits : UInt8 = 0b00001111
let invertedBits : UInt8 = ~initialBits
print(String(invertedBits,radix : 2))

//位与运算符 &

let firstSixBits : UInt8 = 0b11111100
let lastSixBits : UInt8 = 0b00111111
let middleFourBits = firstSixBits & lastSixBits
print(String(middleFourBits,radix : 2))

//位或运算符 |

let someBits : UInt8 = 0b10110010
let moreBits : UInt8 = 0b01011110
let combinedbits = someBits | moreBits
print(String(combinedbits,radix : 2))

//位异或运算符 ^

let firstBits : UInt8 = 0b00010100
let otherBits : UInt8 = 0b00000101
let outputBits = firstBits ^ otherBits
print(String(outputBits,radix : 2))


//无符号整数的移位操作
let shiftBits : UInt8 = 0b00000100
shiftBits << 1
shiftBits << 2
shiftBits << 5
shiftBits << 6
shiftBits >> 2

let pink : UInt32 = 0xcc6699
let redComponent = (pink & 0xFF0000) >> 16
let greenComponent = (pink & 0x00FF00) >> 8
let blueComponent = (pink & 0x0000FF)


//溢出运算符
//溢出加法 （ &+ ）
//溢出减法 （ &- ）
//溢出乘法 （ &* ）

var unsignedOverflow = UInt8.max
unsignedOverflow = unsignedOverflow &+ 1
print(unsignedOverflow)

unsignedOverflow = UInt8.min
unsignedOverflow = unsignedOverflow &- 1
print(unsignedOverflow)

var signedOverflow = Int8.min
signedOverflow = signedOverflow &- 1
print(signedOverflow)

//运算符重载
// 中缀运算符

struct Vector2D{
    var x = 0.0,y = 0.0
}

extension Vector2D{
    static func + (left : Vector2D,right : Vector2D) -> Vector2D{
        return Vector2D(x: left.x + right.x,y: left.y + right.y)
    }
}

let vector = Vector2D(x : 3.0,y : 1.0)
let anotherVector = Vector2D(x : 2.0,y : 4.0)
let combinedVector = vector + anotherVector
print(combinedVector)

//前缀和后缀运算符

extension Vector2D{
    static prefix func - (vector : Vector2D) -> Vector2D{
        return Vector2D(x : -vector.x,y : -vector.y)
    }
}


//组合赋值运算符

extension Vector2D{
    static func += (left : inout Vector2D,right : Vector2D){
        left = left + right
    }
}

var original = Vector2D(x : 1.0,y : 2.0)
let vectorToAdd = Vector2D(x : 3.0,y : 4.0)
original += vectorToAdd


//等价运算符

extension Vector2D{
    static func == (left : Vector2D,right : Vector2D) -> Bool{
        return (left.x == right.x) && (left.y == right.y)
    }
    
    static func != (left : Vector2D,right : Vector2D) -> Bool{
        return !(left == right)
    }
}

//自定义运算符

//声明
prefix operator +++

extension Vector2D{
    static prefix func +++ (vector : inout Vector2D) -> Vector2D{
        vector += vector
        return vector
    }
}


//自定义中缀运算符的优先级和结合性
//swift4

//infix oprator +- {associatedtype left precedence 140}
//
//extension Vector2D {
//    
//    static func +- (left : Vector2D,right : Vector2D) -> Vector2D{
//        return Vector2D(x : left.x + right.x,y: left.y - right.y)
//    }
//}
//
//let firstVector = Vector2D(x: 1.0, y: 2.0)
//let secondVector = Vector2D(x: 3.0, y: 4.0)
//let plusMinusVector = firstVector +- secondVector
