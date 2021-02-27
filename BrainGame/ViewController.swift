//
//  ViewController.swift
//  BrainGame
//
//  Created by alex on 2/22/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var colorWord: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var isPlaying = false
    var timeLeft = 60
    var timer: Timer?
    var score = 0
    
    enum Color: String, CaseIterable {
        case blue
        case purple
        case red
        case black
        case green
        case orange
    }
    
    func UIColorToString(color: UIColor) -> String {
        switch color {
            case UIColor.blue: return "blue"
            case UIColor.purple: return "purple"
            case UIColor.red: return "red"
            case UIColor.black: return "black"
            case UIColor.green: return "green"
            case UIColor.orange: return "orange"
        default:
            return "error"
        }
    }
    
    func colorToString(color: Color) -> String {
        switch color {
            case .blue: return "blue"
            case .purple: return "purple"
            case .red: return "red"
            case .black: return "black"
            case .green: return "green"
            case .orange: return "orange"
        }
    }
    
    func colorToUIColor(color: Color) -> UIColor {
        switch color {
            case .blue: return UIColor.blue
            case .purple: return UIColor.purple
            case .red: return UIColor.red
            case .black: return UIColor.black
            case .green: return UIColor.green
            case .orange: return UIColor.orange
        }
    }
    
    func randomColor() -> ViewController.Color {
        return Color.allCases.randomElement()!
    }
    
    func finalScore() {
        colorWord.isHidden = true
        colorLabel.isHidden = true
        scoreLabel.text = "Your Score: \(score)"
        isPlaying = false
        playButton.isHidden = false
    }
    
    @IBAction func startGameButton(_ sender: UIButton) {
        isPlaying = true
        playButton.isHidden = true
        gameTimer()
    }
    
    func gameTimer(){
        timeLeft = 10
        if timer != nil {
            timer?.invalidate()
        }
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {timer in
            self.updateTimer()
        })
    }
    
    func updateTimer() {
        if (timeLeft > 0) {
            timeLeft -= 1
            timerLabel.text = String(timeLeft)
        } else {
            timer?.invalidate()
            finalScore()
        }
    }
    
    func gameOver() {
        colorLabel.isHidden = true
        colorWord.isHidden = true
        scoreLabel.isHidden = false
        noButton.isHidden = true
        yesButton.isHidden = true
    }
    
    func answerCheck() -> Bool {
        let colorOfLabel = UIColorToString(color: colorLabel.textColor)
        
        return colorOfLabel == colorWord.text!
    }
    
    @IBAction func yesButtonTapped(_ sender: Any) {
        if isPlaying {
            if answerCheck(){
                score += 100
            } else {
                score -= 50
            }
            randomizeLabels()
        }
    }
    
    @IBAction func noButtonTapped(_ sender: Any) {
        if isPlaying {
            if answerCheck(){
                score += 100
            } else {
                score -= 50
            }
            randomizeLabels()
        }
    }
    
    
    func randomizeLabels() {
        let colorText = colorToString(color: randomColor())
        
        let realColor = colorToUIColor(color: randomColor())
        
        let realColorText = colorToString(color: randomColor())
        
        colorLabel.textColor = realColor
        colorLabel.text = realColorText
        colorWord.text = colorText
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        randomizeLabels()
        
        yesButton.backgroundColor = UIColor.green
        noButton.backgroundColor = UIColor.red
        // Do any additional setup after loading the view.
    }
}

