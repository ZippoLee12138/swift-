//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//存储属性

struct FixedLengthRange{
    var firstValue : Int
    let length : Int
}

var fixed = FixedLengthRange( firstValue : 0, length : 3)
print(fixed)
fixed.firstValue = 10
print(fixed)


class DataImporter{
    /*
     DataImporter 是一个负责将外部文件中的数据导入的类。初始化需要消耗时间
    */
    
    var fileName = "data.txt"
}

class DataManager{
    
    lazy var importer = DataImporter()
    
    var data = [String]()
    
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
print(manager.data)
print(manager.importer.fileName)


//计算属性

struct Point{
    var x = 0.0,y = 0.0
}

struct Size{
    var width = 0.0,height = 0.0
}

struct Rect{
    
    var Origin = Point()
    var size = Size()
    
    var center : Point{
    
        get {
            
            let centerX = Origin.x + size.width/2
            let centerY = Origin.y + size.height/2
            
            return Point(x: centerX,y: centerY)
        }
        
        set {
            Origin.x = newValue.x - size.width/2
            Origin.y = newValue.y - size.height/2
        }
    
    }
    
    
}


var myRect = Rect(Origin : Point(x:10,y:10), size : Size(width : 10, height : 10))
myRect.center = Point(x: 10,y: 10)

print(myRect.center)




//只读计算属性
struct Cuboid{
    var width = 0.0,height = 0.0,depth = 0.0
    
    var volume : Double{
     
        return width * height * depth
        
    }
    
    var readOnly : Double{
        return 10
    }
}


var my_Cuboid = Cuboid(width : 10,height : 10,depth : 10)

print(my_Cuboid.volume)
print(my_Cuboid.readOnly)



class StepCounter {
    
    var totalStep : Int = 0{
     
        willSet(stepNum){
            print("About to set totalStep\(stepNum)")
        }
        
        didSet{
            if totalStep >= oldValue {
                print("add \(totalStep - oldValue) to totalStep")
                
            }else{
                totalStep = totalStep + 1
            }
        }
        
    }
    
}

var my_stepCot = StepCounter()

my_stepCot.totalStep = 100

my_stepCot.totalStep = 90

print(my_stepCot.totalStep)


//类型属性

struct SomeStruct{
    
    static var storedTypeProperty = "struct property"
    static var computedTypeProperty : Int{
        return 1
    }
    
}


enum SomeEnum{
    
    static var storedTypeProperty = "enum property"
    static var computedTypeProperty : Int{
        
        set{
                self.computedTypeProperty = newValue
        }
        
        get{
            return self.computedTypeProperty
        }
        
    }
}


class SomeClass {
    static var storedTypeProperty = "class property"
    
    static var computedTypeProperty:Int{
        return 2
    }
}

print(SomeStruct.storedTypeProperty)


//

struct AudioChannel{
    
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    
    var currentLevel : Int = 0{
        
        didSet{
            if currentLevel > AudioChannel.thresholdLevel {
                currentLevel = AudioChannel.thresholdLevel
            }
            
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
        
    }
    
}

var rightChannel = AudioChannel(currentLevel : 5)
print(rightChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannels)

rightChannel.currentLevel = 6
print(rightChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannels)

var leftChannel = AudioChannel(currentLevel : 11)

//leftChannel.currentLevel = 22
print(leftChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannels)


