//
//  Character.swift
//  ForTheWin
//
//  Created by C Sinclair on 10/30/15.
//  Copyright © 2015 femtobyte. All rights reserved.
//

import Foundation

class Character{
    private var _hp = 100
    private var _ap = 20
    private var _startinghp = 100   //using this for restarting game
    

    var hp:Int {
        get{return _hp}
    }
    var ap:Int {
        get{return _ap}
    }
    var isAlive:Bool{
        get{
            if hp <= 0{
                return false
            }else{
                return true
            }
        }
    }

    //computed property, initializing the beginning values
    //would reuse this for restarting game but not sure if I can or how to?
    init(startingHP: Int, attackPwr: Int){
        self._hp = startingHP
        self._ap = attackPwr
    }
    //assuming this is passed in from an attacker's class
    func onAttack(attackPwr:Int)->Bool{
        self._hp -= attackPwr
        
        return true
    }
    
    func resetHP(){
        self._hp = _startinghp
    }
}