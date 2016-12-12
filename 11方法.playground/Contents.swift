//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//类型方法

class SomeClass{
    
    class func SomeTypeMethod(){
        print("some type method")
    }
    
}

SomeClass.SomeTypeMethod()

struct LevelTracker{
    
    static var hightestUnlockedLevel = 1
    var currentLevel = 1
    
    static func isUnlocked(level : Int) -> Bool{
        return level < hightestUnlockedLevel
    }
    
    static func Unlocked(level : Int){
        if level > hightestUnlockedLevel{
            hightestUnlockedLevel = level
        }
    }
    
    
    mutating func advance(to level : Int) -> Bool {
        
        if LevelTracker.isUnlocked(level: level) {
            currentLevel = level
            return true
        }else{
            return false
        }
        
    }
    
}


class Player{
    
    var tracker = LevelTracker()
    let playerName : String
    
    
    func complete(level : Int) {
        
        LevelTracker.Unlocked(level: level + 1)
        tracker.advance(to: level)
    }
    
    init(name  : String) {
        
        playerName = name
        
    }
    
    
}


var player01 = Player(name: "p1")
player01.complete(level: 2)
print(LevelTracker.hightestUnlockedLevel)



