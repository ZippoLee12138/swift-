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
