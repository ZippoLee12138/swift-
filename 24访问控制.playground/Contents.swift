//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


struct TrackedString{
    private(set) var numberOfEdits = 0
    var value : String = ""{
    
        didSet{
            numberOfEdits += 1
        }
        
    }
}

var stringToEdit = TrackedString()
stringToEdit.value = "This string will be tracked."
stringToEdit.value = "This edit will increment numberOfEdits."
stringToEdit.value += "So will this one."
print(stringToEdit.numberOfEdits)


public struct TrackedString01 {
    public private(set) var numberOfEdit = 0
    public var value : String = ""{
        didSet{
            numberOfEdit += 1
        }
    }
    
    public init(){}
}