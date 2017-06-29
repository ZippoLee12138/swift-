//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let catCharacters:[Character] = ["C","a","t","!","🐈"]
var catStr = String(catCharacters)

var nullableCharacter:Character?
if nullableCharacter == nil{
    print("null")
}

let exclamationMark:Character = "!"
catStr.append(exclamationMark)
print("123456789012345678901234567890")
print("g\tnn\tnnnnmn\tnn")
print("\"\u{1F496}\u{2665}")
catStr.insert("a", at: catStr.index(catStr.startIndex, offsetBy: 0))