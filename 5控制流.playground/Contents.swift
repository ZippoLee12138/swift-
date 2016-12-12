//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let stillAnotherPoint = (9,0)

switch stillAnotherPoint {
case (let distance,0),(0,let distance):
        print("On an axis,\(distance) from the origin")
default:
    print("Not on an axis")
}

let puzzleInput = "great minds think alike"

var puzzleOutput = ""
for character in puzzleInput.characters{
    switch character {
    case "a","e","i","o","u"," ":
        continue
    default:
        puzzleOutput.append(character)
    }
}

print(puzzleOutput)
