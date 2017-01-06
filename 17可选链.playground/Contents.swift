//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//可选链式调用代替强制展开

class Person {
    var residence : Residence?
}

class Residence {
    var numberOfRooms = 1
}

var Jhon = Person()
Jhon.residence = Residence()

if let roomCount = Jhon.residence?.numberOfRooms{
    print("Jhon's residence has \(roomCount) room(s).")
}else{
    print("Unable to retrieve the number of rooms.")
}

//为可选链式调用定义模型类

class Person01 {
    var residence : Residence01?
}

class Residence01 {
    
    var rooms = [Room]()
    
    var numberOfRoom : Int {
        return rooms.count
    }
    
    subscript(i : Int) -> Room {
        
        set{
            rooms[i] = newValue
        }
        
        get{
            return rooms[i]
        }
        
    }
    
    func printNumberOfRooms() {
        print("number of rooms is \(self.numberOfRoom)")
    }
    
    var address : Address?
}

class Room {
    
    var name : String
    
    init(name : String) {
        self.name = name
    }
}

class Address {
    
    var bulidingName : String?
    var bulidingNumber : String?
    var street : String?
    
    func buildingIdentifier() -> String? {
        if bulidingName != nil{
            return bulidingName
        }else if bulidingNumber != nil && street != nil{
            return "\(bulidingNumber) \(street)"
        }else{
            return nil
        }
    }
    
}

//通过可选链式调用访问属性

let john = Person01()

if let roomCount = john.residence?.numberOfRoom {
    print("John's residence has \(roomCount) room(s)")
}else{
    print("Unable to retrieve the number of room(s)")
}


let someAddress = Address()
someAddress.bulidingNumber = "29"
someAddress.street = "Acacia Road"
john.residence?.address = someAddress

func creatAddress() -> Address{
    print("Function was called.")
    
    let someAddress = Address()
    someAddress.bulidingNumber = "29"
    someAddress.street = "Acaica Road"
    
    return someAddress
}
john.residence?.address = creatAddress()


if john.residence?.printNumberOfRooms() != nil {
    print("It was possible to print the number of rooms.")
}else{
    print("It was not possible to print the number of rooms.")
}









