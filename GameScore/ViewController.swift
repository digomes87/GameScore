//
//  ViewController.swift
//  GameScore
//
//  Created by Diego Gomes on 12/11/2015.
//  Copyright © 2015 Nylon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var player: UILabel!
    @IBOutlet var score: UILabel!
    @IBOutlet var highScore: UILabel!
    @IBOutlet var leader: UILabel!
    @IBOutlet var textField: UITextField!
    
    let userDefault = NSUserDefaults.standardUserDefaults()
    var user = [String]()
    var currentPlayer = ""
    var scoreTotal = 0
    var highScoreTotal = 0
    var leaderName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if userDefault.valueForKey("highScore") != nil && userDefault.valueForKey("leader") != nil && userDefault.valueForKey("username") != nil{
        
            highScoreTotal = userDefault.valueForKey("highScore") as! Int
            leaderName = userDefault.valueForKey("leader") as! String
            user = userDefault.valueForKey("username") as! Array
            
            
            highScore.text = "\(highScoreTotal)"
            leader.text = leaderName
            
            print("High Score: \(highScoreTotal) Leader: \(leaderName) User: \(user) ")
            
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addPlayer(sender: AnyObject) {
        
        currentPlayer = textField.text!
        
       // let currentPlayer = textField.text
        player.text = currentPlayer
        
        user.append(currentPlayer)
        userDefault.setObject(user, forKey: "usernames")
        
        print(user)
        
    }

    
    @IBAction func addToScore(sender: AnyObject) {
        
        scoreTotal = scoreTotal + 10
        score.text = "\(scoreTotal)"
        
        if scoreTotal > highScoreTotal{
        
            highScoreTotal = scoreTotal
            highScore.text = "\(highScoreTotal)"
            leader.text = currentPlayer
            leaderName = currentPlayer
            
            userDefault.setValue(highScoreTotal, forKey: "highScore")
            userDefault.setValue(leaderName, forKey: "leader")
            
            
        }
        
        
    }
    
    @IBAction func resetPlayerAndScore(sender: AnyObject) {
        
        scoreTotal = 0
        score.text = "0"
        player.text = "Enter Your Name"
        textField.text = ""
    }
    
}

