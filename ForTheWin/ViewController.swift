//
//  ViewController.swift
//  ForTheWin
//
//  Created by C Sinclair on 10/30/15.
//  Copyright © 2015 femtobyte. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var player1Btn: UIButton!
    @IBOutlet weak var player2Btn: UIButton!
    @IBOutlet weak var ReadOutLbl: UILabel!
    @IBOutlet weak var player1HPLbl: UILabel!
    @IBOutlet weak var player2HPLbl: UILabel!
    @IBOutlet weak var playerTwoImg: UIImageView!
    @IBOutlet weak var playerOneImg: UIImageView!
    
    @IBOutlet weak var restartBtn: UIButton!
    @IBOutlet weak var restartLbl: UILabel!
    
    var playerOne: Player!
    var playerTwo: Player!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerOne = Player(name: "PlayerOne", hp: 100, ap: 20)
        playerTwo = Player(name: "PlayerTwo", hp: 100, ap: 20)
        
        player1HPLbl.text = "\(playerOne.hp) HP"
        player2HPLbl.text = "\(playerTwo.hp) HP"
        
    }
    
    func enableAttackBtns(){
        player1Btn.enabled = true
        player2Btn.enabled = true
    }
    
    func restartChoice(){
        ReadOutLbl.text = "Would you like to play again?"
        restartBtn.hidden = false
        restartLbl.hidden = false
    }
    
    func timer(myFunction: String){
        NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: Selector(myFunction), userInfo: nil, repeats: false)
    }
    func endGame(player: Player){
        ReadOutLbl.text = "\(player.name) wins"
        // would like to disable player image here, and reset the player initialization.
        
        timer("restartChoice")
    }
    
    @IBAction func onPlayer1BtnPressed(sender: AnyObject) {
        
        if playerTwo.onAttack(playerOne.ap){
            player2HPLbl.text = "\(playerTwo.hp) HP"
            ReadOutLbl.text = "\(playerOne.name) hit \(playerTwo.name) for \(playerOne.ap)"

        }
        self.player2Btn.enabled = false
        timer("enableAttackBtns")
        if !playerTwo.isAlive{
            player2HPLbl.text = ""
            endGame(playerOne)
        }
    }
    
    @IBAction func onPlayer2BtnPressed(sender: AnyObject) {
        
        if playerOne.onAttack(playerTwo.ap){
            player1HPLbl.text = "\(playerOne.hp) HP"
            ReadOutLbl.text = "\(playerTwo.name) hit \(playerOne.name) for \(playerTwo.ap)"
        }
        self.player1Btn.enabled = false
        timer("enableAttackBtns")
        if !playerOne.isAlive{
            player1HPLbl.text = "0 HP"
            endGame(playerTwo)
        }
    }
    
    @IBAction func onRestartBtnPressed(sender: AnyObject) {
        ReadOutLbl.text = "Press Attack to Attack"
        playerOne.resetHP()
        playerTwo.resetHP()
        player1HPLbl.text = "\(playerOne.hp) HP"
        player2HPLbl.text = "\(playerTwo.hp) HP"
    }
}

