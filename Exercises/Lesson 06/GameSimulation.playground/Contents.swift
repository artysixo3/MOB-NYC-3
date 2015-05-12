//: Playground - noun: a place where people can play

import Foundation

class Player{
    var health:Int
    
    init(health:Int){
        self.health = 100
    }
    
    func attack() -> Int{
        return 0
    }
    
    func isAlive() -> Bool{
        if(self.health > 0){
           return true
        }
        else {
        return false
        }
    }
    
}


class GoodPlayer:Player{
    
}

class BadPlayer:Player{
    
}

class Match{
    
}

