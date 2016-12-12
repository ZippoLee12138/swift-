//: Playground - noun: a place where people can play

import UIKit

/*
var str = "Hello, playground"

let names = ["Chris","Dlex","Ewa","Barry","Daniella"]
func backward(_ s1:String,_ s2:String) -> Bool{
    return s1 < s2
}
var reversedNames = names.sorted(by: backward)
print(reversedNames)

///闭包表达式
let newNames = names.sorted(by:{ (s1:String,s2:String) -> Bool in return s1 > s2 })
print(newNames)

///根据上下文推断类型
reversedNames = names.sorted(by: {  s1,s2 in return s1 > s2 })
print(reversedNames)

///隐式返回
reversedNames = names.sorted(by: { s1, s2 in s1 < s2 } )
print(reversedNames)

///参数名称缩写
reversedNames = names.sorted(by: { $0 > $1 } )
print(reversedNames)

///运算符方法
reversedNames = names.sorted(by: < )
print(reversedNames)

///尾随闭包
func someFunctionThatTakesAClosure(closure: ()->Void ){
    print("someFuntion")
}

someFunctionThatTakesAClosure(closure: {})

someFunctionThatTakesAClosure() {
    
}

reversedNames = names.sorted{ $1 > $0 }

let digiNames = [0:"Zero",1:"One",2:"Two",3:"Three",4:"Four",5:"Five",6:"Six",7:"Seven",8:"Eight",9:"Nine"]

let targetNames = [16,58,510]

let resultNames = targetNames.map {
    (number) -> String in
    var number = number
    var resultStr = ""
    repeat{
        let num = number%10
        if number / 10 == 0{
            resultStr = digiNames[num]! + resultStr
        }else{
        resultStr = " " + digiNames[num]! + resultStr
        }
        number /= 10
    }while number > 0
    return resultStr
}
print(resultNames)

withUnsafePointer(to: &reversedNames) { print($0)}


var test_str = "str"
withUnsafePointer(to: &test_str) { print("test_str has address       \($0)")}

*/

///值捕获

func makeIncrementer(forIncrement amount:Int) -> () -> Int{
    
    var total = 0
    
    func incrementer() -> Int{
        total += amount
        withUnsafePointer(to: &total) { print("amount:\(amount) total has address:\($0)") }
        return total
    }
    return incrementer
}


var incrementByTen = makeIncrementer(forIncrement: 10)

incrementByTen()

withUnsafePointer(to: &incrementByTen, { print("incrementByTen has address \($0)") })

var incrementBySix = makeIncrementer(forIncrement: 6)
incrementBySix()

withUnsafePointer(to: &incrementBySix) { print("incrementBySix has address \($0)")}

var incrementBySix02 = makeIncrementer(forIncrement: 6)
incrementBySix02()
withUnsafePointer(to: &incrementBySix02) { print("incrementBySix02 has address \($0)")}
