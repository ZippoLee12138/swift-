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


//无主引用


class Customer {
    
    
    let name : String
    
    var card : CreditCard?
    
    init(name : String) {
        self.name = name
        print("Customer \(self.name) is initialized")
    }
    
    deinit {
        print("\(self.name) is deinitialized")
    }
    
}

class CreditCard {
    
    let number : Int64
    
    unowned let tenant : Customer
    
    init(number : Int64,tenant : Customer) {
        self.number = number
        self.tenant = tenant
        print("CreditCard \(self.number) is initialized")
    }
    
    deinit {
        print("CreditCard \(number) is deinitialized")
    }
    
}

var john : Customer?

john = Customer(name: "John Appleseed")

john?.card = CreditCard(number: 1234567890123456, tenant: john!)

john = nil

//无主引用以及隐式解析可选类型




























































//闭包引起的循环强引用

class HTMLElement {
    
    let name : String
    var text : String?
    
    lazy var asHTML : ((Void) -> String)? = {
        
        [unowned self] in
        
        if let text = self.text {
            
            return "<\(self.name)>\(text)</\(self.name)>"
            
        }else{
            
            return "<\(self.name) />"
            
        }
    }
    
    init(name : String,text : String?) {
        self.name = name
        self.text = text
        print("HTMLElement \(self.name) is initialized")
    }
    
    deinit {
        print("HTMLElement \(self.name) is deinitialized")
    }
}

var heading : HTMLElement? = HTMLElement(name: "h1", text: "这是一个段落")
print(heading!.asHTML!())

let defaultText = "some default text"
heading?.text = nil
heading?.asHTML = {
    return "<\(heading!.name)>\(heading?.text ?? defaultText)</\(heading!.name)>"
}
print(heading!.asHTML!())
//heading?.asHTML = nil
heading = nil

