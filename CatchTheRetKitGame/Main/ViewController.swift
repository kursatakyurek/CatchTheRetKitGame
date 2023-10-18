//
//  ViewController.swift
//  CatchTheRetKitGame
//
//  Created by Kürşat Akyürek on 13.10.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    var score = 0
    var timer = Timer()
    var counter = 0
    var retKitArray = [UIImageView]()
    var hideTimer = Timer()
    var highScore = 0
    var timeInterval = Double(0.5)
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    
    @IBOutlet weak var retKit1: UIImageView!
    @IBOutlet weak var retKit2: UIImageView!
    @IBOutlet weak var retKit3: UIImageView!
    @IBOutlet weak var retKit4: UIImageView!
    @IBOutlet weak var retKit5: UIImageView!
    @IBOutlet weak var retKit6: UIImageView!
    @IBOutlet weak var retKit7: UIImageView!
    @IBOutlet weak var retKit8: UIImageView!
    @IBOutlet weak var retKit9: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storedHighScore = UserDefaults.standard.object(forKey: "highScore")
        if storedHighScore == nil {
            highScore = 0
            highScoreLabel.text = "High Score: \(highScore)"
        }
        
        if let newScore = storedHighScore as? Int {
            highScore = newScore
            highScoreLabel.text = "High Score: \(highScore)"
        }
        
        retKitArray = [retKit1, retKit2, retKit3, retKit4, retKit5, retKit6, retKit7, retKit8, retKit9]
        
        retKit1.isUserInteractionEnabled = true
        retKit2.isUserInteractionEnabled = true
        retKit3.isUserInteractionEnabled = true
        retKit4.isUserInteractionEnabled = true
        retKit5.isUserInteractionEnabled = true
        retKit6.isUserInteractionEnabled = true
        retKit7.isUserInteractionEnabled = true
        retKit8.isUserInteractionEnabled = true
        retKit9.isUserInteractionEnabled = true
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        retKit1.addGestureRecognizer(recognizer1)
        retKit2.addGestureRecognizer(recognizer2)
        retKit3.addGestureRecognizer(recognizer3)
        retKit4.addGestureRecognizer(recognizer4)
        retKit5.addGestureRecognizer(recognizer5)
        retKit6.addGestureRecognizer(recognizer6)
        retKit7.addGestureRecognizer(recognizer7)
        retKit8.addGestureRecognizer(recognizer8)
        retKit9.addGestureRecognizer(recognizer9)
        
        counter = 30
        
        timeLabel.text = "Time: \(counter)"
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        
        hideTimer = Timer.scheduledTimer(timeInterval: TimeInterval(timeInterval), target: self, selector: #selector(hideRetKit), userInfo: nil, repeats: true)
        
    }
}

