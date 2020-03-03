//
//  ViewController.swift
//  WarCardGame
//
//  Created by student on 2/21/20.
//  Copyright © 2020 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBOutlet weak var restartButton: UIButton!
    
    @IBOutlet weak var leftCard: UIImageView!
    
    @IBOutlet weak var rightCard: UIImageView!
    
    @IBOutlet weak var playerScore: UILabel!
    
    @IBOutlet weak var cpuScore: UILabel!
    
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var labelWinner: UILabel!
       
    @IBOutlet weak var maxScore: UILabel!
    
    var pScore = 0
    var cScore = 0
    var gScore = 0
    var mScore = 20
    
    let playerWin = ["Amazing, you won!", "Fantastic, another win!", "OMG, you won again!"]
    let cpuWin = ["What a shame!", "Sorry, you lost", "LOOSER"]
    
    @IBAction func dealButton(_ sender: UIButton) {
            let leftNumber = Int.random(in: 2...14)
            let rightNumber = Int.random(in: 2...14)
        
        maxScore.text = "Max score: \(mScore)"
            
            leftCard.image = UIImage(named: "card\(leftNumber)")
            rightCard.image = UIImage(named: "card\(rightNumber)")
            
            if(leftNumber > rightNumber){
                pScore += 1
                playerScore.text = String(pScore)
            } else if(rightNumber > leftNumber){
                cScore += 1
                cpuScore.text = String(cScore)
            }
            
            gScore = pScore > cScore ? pScore : cScore
        
        if(gScore == mScore){
            if(pScore == mScore){
                let x = playerWin.randomElement()
                labelWinner.text = x
                labelWinner.textColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            }else if(cScore == mScore){
                let x = cpuWin.randomElement()
                labelWinner.text = x
                labelWinner.textColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
            }
 
            button.isHidden = true
            restartButton.isHidden = false
            maxScore.isHidden = true
        }
    }
    
    
    @IBAction func restartGame(_ sender: UIButton) {
        pScore = 0
        cScore = 0
        gScore = 0
        playerScore.text = String(pScore)
        cpuScore.text = String(cScore)
        labelWinner.text = ""
        button.isHidden = false
        restartButton.isHidden = true
        maxScore.isHidden = false
        leftCard.image = UIImage(named: "back")
        rightCard.image = UIImage(named: "back")
    }
    
    
    
    @IBAction func close(_ sender: UIButton) {
        exit(0)
    }
    
}

