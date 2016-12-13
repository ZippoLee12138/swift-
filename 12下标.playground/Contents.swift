//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//下标语法

struct TimeTable{
    
    let multiplier : Int
    
    subscript (index : Int) -> Int{
    
        return multiplier * index
    
    }
    
    
}

var threeTimeTable = TimeTable(multiplier: 3)
threeTimeTable[3]
threeTimeTable[6]



//下标用法
var numberOfLegs = ["spider" : 8,"ant" : 6,"cat" : 4]
numberOfLegs["bird"] = 2
print(numberOfLegs)
numberOfLegs["spider"] = nil
print(numberOfLegs)


//下标选项

struct Matrix {
    
    var  rows : Int,columns : Int
    var  grid : [Double]
    
    init(rows : Int,columns : Int) {
        
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    
    subscript (row : Int,column : Int) -> Double{
    
        
        get{
            assert(self.isValidIndex(row: row, column: column),"out of range")
            
            return grid[row * self.columns + column]
        }
      
        set(newInt){
           assert(self.isValidIndex(row: row, column: column), "out of range")
            
            grid[row * self.columns + column] = newInt
        }
    
    
    }
    
    func isValidIndex(row : Int,column : Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    
}

var my_Matrix = Matrix(rows: 2, columns: 3)
my_Matrix[1,2] = 1.4
print(my_Matrix.grid)





		