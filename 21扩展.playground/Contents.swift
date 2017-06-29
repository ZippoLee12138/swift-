//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

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