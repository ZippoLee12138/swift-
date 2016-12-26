//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//构造器

struct Fahrenheit {
    
    var temperature : Double
    
    init() {
        temperature = 32.0
    }
    
}

var my_fahrenheit = Fahrenheit()

print(my_fahrenheit.temperature)


//构造参数

struct Celsuis {
    
    var temperatureForCelsuis : Double
    
    init(FromFahrenheit fahrenheit : Double) {
        temperatureForCelsuis = (fahrenheit - 32.0)/1.8
    }
    
    init(FromKelvin kelvin : Double) {
        temperatureForCelsuis = kelvin - 273.15
    }
    
    init(_ temperetureForCelsuis : Double) {
        self.temperatureForCelsuis = temperetureForCelsuis
    }
    
}


var my_celsuis = Celsuis(FromFahrenheit: 212)
print(my_celsuis.temperatureForCelsuis)

let my_celsuisFromKelvin = Celsuis(FromKelvin: 273.15)
print(my_celsuisFromKelvin.temperatureForCelsuis)

//参数的内部名称和外部名称

struct Color {
    
    var  red : Double,green : Double,blue : Double
    
    init(red : Double,green : Double,blue : Double) {
        
        self.red = red
        self.green = green
        self.blue = blue
        
    }
    
    
    init(white : Double) {
        
        red = white
        green = white
        blue = white
        
    }
    
}


var my_color = Color(red: 0, green: 0, blue: 0)

var my_colorWithWhite = Color(white: 255)


//不带参数名的构造器

var my_celsuisWithOutParameterName = Celsuis(100)

//可选属性类型

struct SurveyQuestion {
    
    /*var*/ let text : String//常量设值
    var response : String?
    
    init(text : String) {
        self.text = text
    }
    
    func ask() {
        print(text)
    }
    
}

var my_surveyQuestion = SurveyQuestion(text: "Do you like me?")
my_surveyQuestion.ask()
my_surveyQuestion.response = "Yes!"



//默认构造器

struct ShoppingListItem{
    
    var name : String?
    var quantity = 1
    var purchased = false
    
}

var my_shoppingListItem = ShoppingListItem()
print(my_shoppingListItem)

//结构体的逐一成员构造器

struct Size {
    var width = 0.0,height = 0.0
    
}

var my_size = Size(width: 2.1, height: 3.5)

//值类型的构造器代理

struct Point {
    
    var x = 0.0,y = 0.0
    
}


struct Rect {
    
    var size = Size()
    var origin = Point()
    
    
    init() {
        
    }
    
    init(size : Size,origin : Point) {
        self.size = size
        self.origin = origin
    }
    
    init(center : Point, size : Size) {
        
        let originX = center.x - size.width/2
        let originY = center.y - size.height/2
        
        self.init(size : size,origin : Point(x: originX, y: originY))
        
    }
    
}

var rect01 = Rect()
print(rect01)
var rect02 = Rect(center: Point(x : 5,y : 5), size: Size(width: 10, height: 10))
print(rect02)

var rect03 = Rect(size: Size(width : 10,height : 10), origin: Point(x : 0,y : 0))
print(rect03)



//类的构造器的继承


class Vehicle {
    
    var numOfWheels = 0
    
    var description : String{
        return "\(numOfWheels) wheels"
    }
    
    
}

class Bicycle : Vehicle{
    
    override init() {
        super.init()
        numOfWheels = 2
    }
}

var my_bicycle = Bicycle()
print("Bicycle : \(my_bicycle.description)")




//指定构造器和便利构造器 构造器的继承


class Food {
    
    var name : String
    
    convenience init(){
        self.init(name : "[Unnamed]")
    }
    
    init(name : String) {
        self.name = name
    }
    
}


class RecipeIngredient : Food{
    
    var quantity : Int
    
    init(name : String,quantity : Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    
    override convenience init(name : String){
        self.init(name : name,quantity : 1)
    }
    
}

var my_recipe01 = RecipeIngredient()
print(my_recipe01)
var my_recipe02 = RecipeIngredient(name: "11")
print(my_recipe02)
var my_recipe03 = RecipeIngredient(name: "22", quantity: 2)
print(my_recipe03)


class ShoppingListItemClass : RecipeIngredient {
    
    var purchased = false
    var description : String {
        var output = ("\(self.name) * \(self.quantity) ")
        output += purchased ?"✅":"❌"
        return output
    }
    
}

var shoppingItem01 = ShoppingListItemClass(name:"🐶", quantity: 1)
shoppingItem01.purchased = true

print(shoppingItem01.description)

var breakfastList = [
    ShoppingListItemClass(),
    ShoppingListItemClass(name: "🐼"),
    ShoppingListItemClass(name: "❄️", quantity: 1)
]

breakfastList[2].purchased = true

for item in breakfastList {
    
   print(item.description)
    
}



//可失败构造器


struct Animal {
    
    var Species : String
    
    init?(species : String){
        
        if species.isEmpty  {
            return nil
        }
        self.Species = species
    }
    
}

let animal01 = Animal(species: "")

if animal01 == nil {
    print("animal01 is nil")
}

let animal02 =  Animal(species: "Giraffe")

if let giraffe = animal02 {
    print("giraffe was initalized with a species of \(giraffe.Species)")
}


//重写一个可失败构造器

class Document {
    
    var name : String?
    
    
    init() {}
    
    init?(name : String) {
        self.name = name
        if name.isEmpty {
            return nil
        }
    }
    
}

class AutomaticallyNameDocument : Document {
    
    override init() {
        super.init(name : "[Unnamed]")!
//        self.name = "[Unnamed]"
    }
    
    override init(name : String){
        super.init()
        if name.isEmpty {
            self.name = "[Unnamed]"
        }else{
            self.name = name
        }
    }
    
}



var my_Document = Document(name:"")


//必要构造器

class SomeClass {
    var name : String
    
    required init(name : String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name : "[Unnamed]")
    }
}

class SomeSubClass : SomeClass {
    
//    override convenience init(){
//        super.init(name: "[Unnamed]")
//    }
    
    required init(name: String) {
        super.init(name: name)
    }
    
}

//通过闭包或者函数设置属性的默认值


struct Checkerboard {
    
    let boardColors : [Bool] = {
        var temporaryBoard = [Bool]()
        var color = false
        
        
        for i in 1...8{
            for j in 1...8{
                temporaryBoard.append(color)
                color = !color
            }
            color = !color
        }

        
        return temporaryBoard
    }()
    
    func squateIsBlackAtRow(row : Int,column : Int) -> Bool {
    
        return boardColors[row * 8 + column]
        
        
    }
    
}


var my_checkerboard = Checkerboard()
my_checkerboard.squateIsBlackAtRow(row: 0, column: 0)
print(my_checkerboard.squateIsBlackAtRow(row: 7, column: 7))

