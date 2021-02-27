//
//  gameLogic.swift
//  BrainGame
//
//  Created by alex on 2/24/21.
//

import UIKit

class GameViewController: UIViewController {

    
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var NoButton: UIButton!
    @IBOutlet weak var yesButton: UIButton!
    
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var colorWord: UILabel!
    
    @IBOutlet weak var ScoreLabel: UILabel!
    
    
    var score = 0
    var isPlaying = false
    var gameOver = false
    var timeLeft = 60
    var timer: Timer?
    
    
    func gameTimer() {
        Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(UIMenuController.update), userInfo: nil, repeats: true)
    }
    
    func updateCounter() {
        timerLabel.text = "Time Left: \(timeLeft)"
        if timeLeft > 0 {
            timeLeft -= 1
        }
        
        if timeLeft <= 0 {
            gameOver = true
            timer?.invalidate()
            timer = nil
        }
    }
    
