//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//泛型解决的问题

//泛型函数

func swapTwoValues<T>(_ a : inout T,_ b : inout T){
    let temporaryA = a
    a = b
    b = temporaryA
}

var a = 1,b = 3
swapTwoValues(&a, &b)
print("a:\(a),b:\(b)")

var str1 = "aaa"
var str2 = "bbb"
swapTwoValues(&str1, &str2)
print("str1:\(str1),str2:\(str2)")

//泛型类型 实现Stack的泛型集合类型

struct Stack<Element>{
    var items = [Element]()
    
    mutating func push(_ item : Element){
        items.append(item)
    }
    
    mutating func pop() -> Element{
       return items.removeLast()
    }
    
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")
print(stackOfStrings.pop())


//扩展一个泛型类型

extension Stack{
    var topItem : Element?{
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

if let topItem = stackOfStrings.topItem {
    print("topItem of stackOfStrings is \(topItem)")
}


// 类型约束语法
//func someFunction<T : SomeClass,U : SomeProtocol>(someT : T,someU : U){
//    
//}

//类型约束的应用

func findIndex<T : Equatable>(of valueToFind : T,in array : [T]) -> Int?{
    
    for (index,value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}


let doubleIndex = findIndex(of: 9.3, in: [3.1415927,0.1,0.25])

let stringIndex = findIndex(of: "Andrea", in: ["Andrea","Mike","Machael"])



//关联类型应用 协议

protocol Container {
    associatedtype ItemType
    mutating func append(_ item : ItemType)
    var count : Int { get }
    subscript(i : Int) -> ItemType { get }
}

extension Stack : Container{
    mutating func append(_ item: Element) {
        self.push(item)
    }
    
    var count: Int{
        return items.count
    }
    
    subscript(i : Int) -> Element{
        return items[i]
    }
    
}

print(stackOfStrings[2])
print(stackOfStrings.count)



//泛型Where 语句

func allIteamsMatch<C1 : Container,C2 : Container> (_ someContainer : C1,_ anotherContainer : C2) -> Bool where C1.ItemType == C2.ItemType,C1.ItemType : Equatable{
    
    if someContainer.count != anotherContainer.count {
        return false
    }
    
    for i in 0..<someContainer.count{
        if someContainer[i] != anotherContainer[i] {
            return false
        }
    }
    
    return true
}

var stackStrings01 = Stack<String>()
stackStrings01.push("uno")
stackStrings01.push("dos")
stackStrings01.push("tres")

var arrayOfStrings = ["uno","dos","tres"]

extension Array : Container{  }

if allIteamsMatch(stackStrings01,arrayOfStrings) {
    print("All items match.")
}else{
    print("Not all items match.")
}

//带有泛型 Where 分句的扩展

extension Stack where Element : Equatable{
    func isTop(_ item : Element) -> Bool {
        guard let topItem = items.last else{
            return false
        }
        
        return topItem == item
    }
}

if stackStrings01.isTop("tres") {
    print("Top element is tres.")
}else{
    print("Top element is something else.")
}

//使用where 分句扩展到一个协议

extension Container where ItemType : Equatable{
    func startsWith01(_ item : ItemType) -> Bool {
        return count >= 1 && self[0] == item
    }
}

if [9,9,9].startsWith01(9){
    print("Starts with 9.")
}else{
    print("Starts with something else.")
}

extension Container where ItemType == Double{
    func average() -> Double {
        var sum = 0.0
        for index in 0..<count {
            sum += self[index]
        }
        return sum / Double(count)
    }
}

print([126.0,1200.0,98.6,37.0].average())

// swift4

//关联类型的泛型 Where 分句


protocol Container001 {
    associatedtype Item
    mutating func append(_ item : Item)
    var count : Int{ get }
    subscript (i : Int) -> Item { get }
    
    associatedtype Iterator : IteratorProtocol where Iterator.Element == Item
    func makeIterator() -> Iterator
    
    
}

//泛型下标

extension Container001{
    subscript<Indices : Sequence>(indices : Indices) -> [Item] where Indices.Iterator.Element == Item{
    
    var result = [Item]()
    for index in indices {
        result.append(self[index])
    }
    
    return result
    
    }
}


