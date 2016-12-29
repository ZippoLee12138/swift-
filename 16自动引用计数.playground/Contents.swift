//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//自动引用计数实践

class Person {
    
    let name : String
    
    init(name : String) {
        self.name = name
        print("\(name) is being initialized")
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
    
}

var p1 : Person? = Person(name: "p1")

var p2,p3 : Person?

p2 = p1
p3 = p2

p1 = nil
p2 = nil
p3 = nil

		