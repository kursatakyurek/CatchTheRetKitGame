//
//  Alert.swift
//  CatchTheRetKitGame
//
//  Created by Kürşat Akyürek on 14.10.2023.
//

import Foundation
import UIKit

extension ViewController {
    func alert (title: String, messages: String) {
        let alert = UIAlertController(title: title, message: messages, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "No", style: .cancel, handler: nil)
        let replayButton = UIAlertAction(title: "Replay", style: .default) { UIAlertAction in
            self.score = 0
            self.scoreLabel.text = "Score: \(self.score)"
            self.counter = 30
            self.timeLabel.text = "Time: \(self.counter)"
            
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
            
            self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hideRetKit), userInfo: nil, repeats: true)
        }
        
        alert.addAction(okButton)
        alert.addAction(replayButton)
        self.present(alert, animated: true, completion: nil)
    }
}
