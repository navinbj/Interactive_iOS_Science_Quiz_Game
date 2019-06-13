//
//  Player.swift
//  Assignment1_IOS_NBajgai
//
//  Created by Bajgai Navin on 5/10/19.
//  Copyright © 2019 Bajgai Navin. All rights reserved.
//
import Foundation

class Player
{
    var playerName : String
    var score : Int
    var streak : Int
    
    //constructor for the objects of a class Player
    init(playerName: String, score:Int, streak:Int)
    {
        self.playerName = playerName
        self.score = score
        self.streak = streak
    }
    
    //returns the player's name
    public func getplayerName() -> String {
        return playerName
    }
    
    //returns the player's game score
    public func getScore() -> Int {
        return score
    }
    
    //returns the player's game streak
    public func getStreak() -> Int {
        return streak
    }
}
