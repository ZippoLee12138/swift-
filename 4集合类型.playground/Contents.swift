//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//数组

var someInts = Array<Int>()
print(someInts)

var  someInts1 = [Int]()
print("someInts1 is type of [Int] with \(someInts1.count) items")
someInts1 = []

var threeDoubles = Array(repeating: 0.0, count: 3)
print("threeDoubles is \(threeDoubles)")



var nameOfInters = [Int:String] ()
nameOfInters[1] = "frist"
nameOfInters
nameOfInters = [:]

var airports:[String:String] = ["YYZ":"Toronto Pearson","DUB":"Dublin"]
print("The dictionary of airports contains \(airports.count) items")

if airports.isEmpty{
    print("The airports dictionary is empty.")
}else{
    print("The airports dictionary is not empty.")
}

airports["LHR"] = "London"

airports["LHR"] = "London Heathrow"

print(airports)

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB"){
    print("The old value fot DUB was \(oldValue)")
}
print(airports)

if let airportName = airports["DUB"]{
    print("The name of aitport is \(airportName)")
}else{
    print("That airport is nor in the airports dictionary.")
}

airports["APL"] = "Apple Internation"
print(airports)
airports["APL"] = nil
print(airports)

airports["aa"] = nil
print(airports)

for (airportCode,airportName) in airports{
    print("\(airportCode):\(airportName)")
}

print(">>>>>>>>>>>\n")

//print(airports.sort(<#T##isOrderedBefore: ((String, String), (String, String)) -> Bool##((String, String), (String, String)) -> Bool#>))
