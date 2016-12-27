//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//析构过程

class Bank {
    
    static var allCoins = 10_000
    
    static func distribute(numOfCoins : Int) -> Int {
        
        let numOfCoinsToVend = min(numOfCoins, allCoins)
        
        allCoins -= numOfCoinsToVend
        
        return numOfCoinsToVend
    }
    
    
    static func revice(numOfCoins : Int) {
        allCoins += numOfCoins
    }
    
    
}



class Player {
    
    var coins : Int
    
    init(coins : Int) {
        self.coins = Bank.distribute(numOfCoins: coins)
    }
    
    func win(coins : Int) {
       self.coins += Bank.distribute(numOfCoins: coins)
    }
    
    
    deinit {
        Bank.revice(numOfCoins: self.coins)
    }
    
}

var my_player : Player? = Player(coins: 100)
print(Bank.allCoins)
my_player?.win(coins: 10000)
print(my_player!.coins)
my_player = nil
print(Bank.allCoins)


