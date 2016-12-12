//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

struct Resolution{
    var width = 0
    var height = 0
}

class VideoModel{
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name:String?
}

let someResolution = Resolution()
let someVideoModel = VideoModel()

print(someResolution.height)

someVideoModel.resolution.width = 1288
print("The width of someVideoMode is now \(someVideoModel.resolution.width)")

var vga = Resolution(width: 10, height: 40)
var copuVga = vga
withUnsafePointer(to: &vga) { (print("vga has address \($0)"))}
withUnsafePointer(to: &copuVga) { (print("copuVga has address \($0)"))}







