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
    
    var apartment : Apartment?
    
    deinit {
        print("\(name) is being deinitialized")
    }
    
}

class Apartment {
    let unit : String
    
    weak var tenant : Person?
    
    init(unit : String) {
        self.unit = unit
        print("Apartment \(self.unit) is initialized")
    }
    
    deinit {
        print("Apartment \(self.unit) is deinitialized")
    }
}

//var p1 : Person? = Person(name: "p1")
//var p2,p3 : Person?
//
//p2 = p1
//p3 = p2
//
//p1 = nil
//p2 = nil
//p3 = nil



//循环引用
var p4 : Person? = Person(name: "John Appleseed")
var unit4A : Apartment? = Apartment(unit: "unit4A")

p4!.apartment = unit4A
unit4A!.tenant = p4

//p4?.apartment = nil
//unit4A?.tenant = nil

unit4A = nil
p4 = nil

