//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//实例方法

class Counter{
    
    var count = 0
    
    func increment(){
        count += 1
    }
    
    func increment(by num : Int){
        count += num
    }
    
    func clear() {
        count = 0
    }
    
}

var my_counter = Counter()
my_counter.increment()
my_counter.count
my_counter.increment(by: 10)
my_counter.count
my_counter.clear()
my_counter.count


//self关键字

struct Point{
    
    var x = 0.0,y = 0.0
    
    func isRightFrom(from x : Double) -> Bool {
        return self.x > x
    }
    
}

var my_point = Point(x: 1.2, y: 2.4)

if my_point.isRightFrom(from: 1) {
    print("the point is right ")
}

/*实例方法中修改值类型
 *struct、enum是值类型，值类型的属性不能在他的实例方法中修改
 */

struct mutatePoint{
    
    var x = 0.0,y = 0.0
    
    mutating func moveToPoint(movedX : Double,movedY : Double){
        x += movedX
        y += movedY
    }
    
    
}

var my_mutatePoint = mutatePoint(x : 2,y : 2)
print(my_mutatePoint)

my_mutatePoint.moveToPoint(movedX: 3, movedY: 3)

print(my_mutatePoint)

//可变方法中给self赋值

struct mutateSelfPoint{
    
    var x = 0.0,y = 0.0
    
    mutating func newPointBy(x newX : Double,y newY : Double = 10){
        
        self = mutateSelfPoint(x: x + newX, y: y + newY)
        
    }
    
    
    
}


var my_mutateSelfPoint = mutateSelfPoint(x: 1, y: 2)

my_mutateSelfPoint.newPointBy(x: 9)
print(my_mutateSelfPoint)


enum TriStatueEnum{
    
    case off,low,high
    
    mutating func next(){
        
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
            
        }
        
    }
    
}


var my_TriStatue = TriStatueEnum.off

my_TriStatue.next()
my_TriStatue



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



