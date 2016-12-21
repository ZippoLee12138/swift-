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
    
    var text : String
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









