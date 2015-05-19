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

class goodPlayer:Player{
    
    override func attack() -> Int{
        return 50
    }
    
}

class badPlayer:Player{
    override func attack() -> Int{
        return 25
        
    }
    
}

class Match{
    var player1:goodPlayer
    var player2:badPlayer
    
    init (player1:goodPlayer, player2:badPlayer){
        self.player1=player1
        self.player2=player2
    }
    func playGame(player1:goodPlayer, player2:badPlayer){
    while(player1.isAlive() == true || player2.isAlive() == true)
    {
        player2.health - player1.attack()
        player1.health - player2.attack()
    }
        if player2.health == 0{
            println("player 1 wins")
        }
        else if player1.health == 0{
            println("player 2 wins")
        }
    }
}


