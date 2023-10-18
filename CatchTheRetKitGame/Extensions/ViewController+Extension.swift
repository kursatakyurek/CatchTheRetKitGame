//
//  Extensions.swift
//  CatchTheRetKitGame
//
//  Created by Kürşat Akyürek on 13.10.2023.
//

import Foundation

extension ViewController {
    
    @objc func increaseScore (){
        score += 1
        scoreLabel.text = "Score: \(score)"
        
        if score > 0 && score <= 10 {
            hideTimer.invalidate()
            timeInterval = 0.4
            hideTimer = Timer.scheduledTimer(timeInterval: TimeInterval(timeInterval), target: self, selector: #selector(hideRetKit), userInfo: nil, repeats: true)
            
        }else if  score > 10 && score <= 20 {
            hideTimer.invalidate()
            timeInterval = 0.3
            hideTimer = Timer.scheduledTimer(timeInterval: TimeInterval(timeInterval), target: self, selector: #selector(hideRetKit), userInfo: nil, repeats: true)
            
        }else if score > 20 && score <= 30 {
            hideTimer.invalidate()
            timeInterval = 0.2
            hideTimer = Timer.scheduledTimer(timeInterval: TimeInterval(timeInterval), target: self, selector: #selector(hideRetKit), userInfo: nil, repeats: true)
            
        }else if score > 30 && score <= 40 {
            hideTimer.invalidate()
            timeInterval = 0.1
            hideTimer = Timer.scheduledTimer(timeInterval: TimeInterval(timeInterval), target: self, selector: #selector(hideRetKit), userInfo: nil, repeats: true)
        }
        
    }
    
    @objc func countDown () {
        counter -= 1
        timeLabel.text = "Time: \(counter)"
        
        if counter == 0 {
            timer.invalidate()
            hideTimer.invalidate()
            
            for retKit in retKitArray {
                retKit.isHidden = true
            }
            
            if score >= highScore {
                highScore = score
                highScoreLabel.text = "High Score: \(highScore)"
                
                UserDefaults.standard.setValue(highScore, forKey: "highScore")
            }
            
            alert(title: "Time's Up", messages: "Do You Want To Play A Game")
        }
    }
    
    @objc func hideRetKit () {
        
        for retKit in retKitArray{
            retKit.isHidden = true
        }
        
        let random = Int(arc4random_uniform(UInt32(retKitArray.count - 1)))
        retKitArray[random].isHidden = false
    }
}
