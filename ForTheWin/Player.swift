//
//  Player.swift
//  ForTheWin
//
//  Created by C Sinclair on 10/30/15.
//  Copyright © 2015 femtobyte. All rights reserved.
//

import Foundation

class Player: Character{
    private var _name = "Player"
    
    var name:String{
        get{return _name}
    }
    
    convenience init(name: String, hp: Int, ap: Int){
        self.init(startingHP: hp, attackPwr: ap)
        _name = name
    }
    
}