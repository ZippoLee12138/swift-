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

//通过可选链式调用调用方法

if john.residence?.printNumberOfRooms() != nil {
    print("It was possible to print the number of rooms.")
}else{
    print("It was not possible to print the number of rooms.")
}

//通过可选链式调用访问下标

if let firstRoomName = john.residence?[0].name {
    print("The first room name is \(firstRoomName).")
}else{
    print("Unable to retrieve the first room name.)")
}

john.residence?[0] = Room(name: "Bathroom")//赋值失败，因为residence是nil

let johnHouse = Residence01()
johnHouse.rooms.append(Room(name: "Living Room"))
johnHouse.rooms.append(Room(name: "Kitchen"))

john.residence = johnHouse

if let room = john.residence?[1] {
    print("The first room is \(room.name)")
}else{
    print("Unable to retrieve the first room name.")
}

//访问可选类型的下标

var testScores = [ "Dave" : [82,71,66] , "Bav" : [10,33,55]]
testScores["Dave"]?[0] = 89
testScores["Bav"]?[0] += 1

if (testScores["Brian"]?[1] = 00) != nil {
    print("set value success")
}else{
    print("set value failed")
}

//连续多层可选链式调用

if let johnStreet = john.residence?.address?.street{
    print("John's street name is \(johnStreet)")
}else{
    print("Unable to retrieve the address.")
}


let johnsAddress = Address()
johnsAddress.bulidingName = "The Larches"
johnsAddress.street = "Laurel Street"

john.residence?.address = johnsAddress

if let johnStreet = john.residence?.address?.street {
    print("John's street name is \(johnStreet)")
}else{
    print("Unable to retrieve the address.")
}

//在方法的可选返回值上进行可选链式调用


if let buildingIdentifier = john.residence?.address?.buildingIdentifier() {
    print("John's building identifier is \(buildingIdentifier)")
}

if let beginsWithThe = john.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
    print("John's building identifier begins with \"The\".")
}else{
    print("John's building identifier does not begin with \"The\".")
}


