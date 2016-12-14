//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Vehicle{
    
    var currentSpeed = 0.0
    
    var description : String{
        return "traveling at \(currentSpeed) miles per hour"
    }
    
    var name : String{
        set{
            
            self.name = newValue
        }
        
        get{
            return self.name
        }
    }
    
    
    func makeNoise()  {
        
    }
    
}

var my_Vehicle = Vehicle()
my_Vehicle.name
print(my_Vehicle.description)


class Bicycle : Vehicle{
    
    var hasBasket = false
    
    override func makeNoise() {
        print("Bicycle make noise")
    }
}

var my_bicycle = Bicycle()
my_bicycle.currentSpeed = 15
print(my_bicycle.description)
my_bicycle.makeNoise()


class Tandem : Bicycle{
    
    var numberOfCurrentPassengrs = 0
    
    
    
    
    override func makeNoise() {
        super.makeNoise()
        print("Tandem make noise")
    }
}


var my_Tandem = Tandem()
//my_Tandem.name
my_Tandem.numberOfCurrentPassengrs = 2
my_Tandem.makeNoise()

//重写属性

class Car : Vehicle{
    
    var  gear = 1
    
    override var description: String{
        
        
        set{
            self.description = newValue
        }
        
        get{
            
            return super.description + "gear in \(gear)"

        }
        
        
    }
    
    override var name: String{
        set{
            self.name =  "car" + newValue
        }
        
        get{
            return self.name
        }
    }
    
    
}

var my_car = Car()
//my_car.name = "Porsche"
//my_car.description
//print(my_car.name)


