//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//属性要求


protocol SomeProtocol {
    var mustBeSettable :  Int { get set }
    var doesNotNeedToBeSettable : Int { get }
}

protocol AnotherProtocol {
    static var someTypeProperty : Int { get set }
}

protocol FullNamed {
    var fullName : String { get }
}

struct Person : FullNamed {
    var fullName: String
}

let john = Person(fullName: "John Appleseed")

class Starship : FullNamed {
    var prefix : String?
    var name : String
    init(name : String,prefix : String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    
    var fullName: String{
        return (prefix != nil ? prefix! + " ":"") + name
    }
    
}

var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
print(ncc1701.fullName)



// 方法要求

protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator : RandomNumberGenerator {
    
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy: m))
        return lastRandom / m
    }
}

let generator = LinearCongruentialGenerator()
print("Here's a random number:\(generator.random())")

//Mutating 方法要求

protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch : Togglable {
    case off,on
    mutating func toggle() {
        switch self {
        case .on:
            self = .off
        case .off:
            self = .on
        }
    }
}

var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()



//构造器要求

protocol SomeProtocol01 {
    init(someParameter : Int)
}


//构造器要求在类中的实现

protocol SomeProtocol02 {
    init()
}


class SomeSuperClass{
    init() {
        
    }
}

class SomeSubClass : SomeSuperClass,SomeProtocol02{
    
    required override init() {
        
    }
    
}

//可失败构造器要求


//协议作为类型

class Dice {
    let sides : Int
    let generator : RandomNumberGenerator
    init(sides : Int,generator : RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(self.generator.random() * Double(sides)) + 1
    }
}

var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())

for _ in 1...5 {
    print("Random dice roll is \(d6.roll())")
}


//委托（代理）模式

protocol DiceGame{
    var dice : Dice { get }
    func play()
}

protocol DiceGameDelegate{
    func gameDidStart(_ game : DiceGame )
    func game(_ game : DiceGame,didStartNewTurnWithDiceRoll diceRoll :Int)
    func gameDidEnd(_ game : DiceGame)
}

class SnackAndLadders : DiceGame{
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board : [Int]
    
    init() {
        board = [Int](repeating : 0,count : finalSquare + 1)
        board[03] = +08;board[06] = +11;board[09] = +09;board[10] = +02
        board[14] = -10;board[19] = -11;board[22] = -02;board[24] = -08
    }
    
    var delegate : DiceGameDelegate?
    func play() {
        square = 0
        delegate?.gameDidStart(self)
        gameLoop : while square != finalSquare{
            let diceRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
            switch square + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }

        }
        delegate?.gameDidEnd(self)
    }

}



class DiceGameTracker : DiceGameDelegate{
    var numberOfTurns = 0
    func gameDidStart(_ game: DiceGame) {
        numberOfTurns = 0
        if game is SnackAndLadders {
            print("Started a new game of Snakes and Ladders.")
        }
        print("The game is using a \(game.dice.sides)-sided dice.")
    }
    
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        numberOfTurns += 1
        print("Rolled a \(diceRoll)")
    }
    
    func gameDidEnd(_ game: DiceGame) {
            print("The game lasted for \(numberOfTurns) turns.")
    }
}


let tracker = DiceGameTracker()
let game  = SnackAndLadders()
game.delegate = tracker
game.play()


//通过扩展添加协议一致性

protocol TextRepresentable {
    var textualDescription : String { get }
    
}


extension Dice : TextRepresentable{
    var textualDescription: String {
        return "A \(sides)-side dice."
    }
}

print(d6.textualDescription)

extension SnackAndLadders : TextRepresentable{
    var textualDescription: String{
        return "A game of Snack and Ladders with \(finalSquare) squares."
    }
}

print(game.textualDescription)

//通过扩展遵循协议
//注意
//即使满足了协议的所有要求，类型也不会自动遵循协议，必须显式地遵循协议。


struct Hamster{
    var name : String
    var textualDescription : String {
        return "A hamster named \(name)"
    }
}

extension Hamster : TextRepresentable{}

let simonTheHamster = Hamster(name: "simon")
let somethingTextRespresentable : TextRepresentable = simonTheHamster
print(somethingTextRespresentable.textualDescription)


//协议类型的集合
print("for loop:")
let things : [TextRepresentable] = [game,d6,simonTheHamster]
for thing in things {
    print(thing.textualDescription)
}


//协议的继承

protocol PrettyTextRepresentable : TextRepresentable{
    var prettyTextualDescription : String { get }
}

extension SnackAndLadders : PrettyTextRepresentable{
    
    var prettyTextualDescription: String{
        var output = textualDescription + ":\n"
        for index  in 1...finalSquare {
            switch board[index] {
            case let ladder where ladder < 0:
                output += "▲ "
            case let snake where snake < 0:
                output += "▼ "
            default:
                output += "○ "
            }
        }
        return output
    }
}

print(game.prettyTextualDescription)

//类类型专属协议
//你可以在协议的继承列表中，通过添加 class 关键字来限制协议只能被类类型遵循，而结构体或枚举不能遵循该协议。class 关键字必须第一个出现在协议的继承列表中，在其他继承的协议之前：
protocol SomeClassOnlyProtocol : class{
    
}

extension SnackAndLadders : SomeClassOnlyProtocol{
    
}

// 错误的：
//extension Hamster : SomeClassOnlyProtocol{
//    
//}


//协议合成

protocol Named {
    var name : String { get }
}

protocol Aged {
    var age : Int { get }
}

struct Person01 : Named,Aged{
    var name: String
    var age: Int
}

var person001 = Person01(name: "Malcolm", age: 21)
func wishHappyBirthday(to celebrator : Named & Aged){
    print("Happy birthday \(celebrator.name) - you're \(celebrator.age)")
}

wishHappyBirthday(to: person001)

//检查协议一致性

protocol HasArea{
    var area : Double { get }
}

class Circle : HasArea{
    var area: Double{
        return pi * radius * radius
    }
    
    let pi = 3.1415927
    var radius : Double
    
    init(radius : Double) {
        self.radius = radius
    }
}


class Country : HasArea{
    var area: Double
    
    init(area : Double) {
        self.area = area
    }
}


class Animal {
    var legs : Int
    init(legs : Int) {
        self.legs = legs
    }
}

let objects : [AnyObject] = [
  Circle(radius: 2.0),
  Country(area: 243610),
  Animal(legs: 4)
]

for object in objects {
    if let obj = object as? HasArea {
        print("Area is \(obj.area)")
    }else{
        print("Something that doesn't hava an area.")
    }
}


//可选的协议要求

@objc protocol CounterDataSource{
    @objc optional func increment(forCount count: Int) -> Int
    @objc optional var fixedIncrement:Int{ get }
}

class Counter {
    var count = 0
    var dataSource : CounterDataSource?
    func increment() {
        if let amount = dataSource?.increment?(forCount: count) {
            count += amount
        }else if let amount = dataSource?.fixedIncrement{
            count += amount
        }
    }
}


class ThreeSource : NSObject , CounterDataSource{
    let fixedIncrement: Int = 3
}

var counter = Counter()
counter.dataSource = ThreeSource()
for _ in 1...4 {
    counter.increment()
    print(counter.count)
}

@objc class TowardsZeroSource : NSObject,CounterDataSource{
    func increment(forCount count: Int) -> Int {
        if count == 0 {
            return 0
        }else if count < 0{
            return 1
        }else{
            return -1
        }
    }
}

counter.count = -4
counter.dataSource = TowardsZeroSource()
for _ in 1...5 {
    counter.increment()
    print(counter.count)
}


//协议扩展

extension RandomNumberGenerator{
    func randomBool() -> Bool {
        print("默认实现")
        return random() > 0.5
    }
}

//extension LinearCongruentialGenerator{
//    func randomBool() -> Bool {
//        print("自己实现")
//        return  random() > 0.8
//    }
//}

let genetor = LinearCongruentialGenerator()

print("Here's a random number : \(genetor.random())")
print("And here's a random Boolean : \(genetor.randomBool())")


//提供默认实现
extension PrettyTextRepresentable {
    var prettyTextualDescription : String{
        return textualDescription
    }
}

//给协议扩展添加限制

extension Collection where Iterator.Element : TextRepresentable{
    
    var textualDescription : String{
        let itemsAsText = self.map{($0.textualDescription)}
        return "[" + itemsAsText.joined(separator: ",") + "]"
    }
    
}

let murryTheHamster = Hamster(name: "Murray")
let morganTheHamster = Hamster(name: "Morgan")
let mauriceTheHamster = Hamster(name: "Maurice")
let hamsters = [murryTheHamster,morganTheHamster,mauriceTheHamster]
print(hamsters.textualDescription)

