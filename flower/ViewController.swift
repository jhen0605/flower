//
//  ViewController.swift
//  flower
//
//  Created by 簡吟真 on 2021/5/26.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var flowerButton: UIButton!
    @IBOutlet weak var showLabel: UILabel!
    @IBOutlet weak var restartButton: UIButton!
    
    var ans: Int?
    var count = 0
    var showBool = true
    
    let speechSynth = AVSpeechSynthesizer()
    let startUtterance = AVSpeechUtterance(string: "Click here")
    let loveUtterance1 = AVSpeechUtterance(string: "love me")
    let loveUtterance2 = AVSpeechUtterance(string: "Don't love me")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        flowerButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
        ans = Int.random(in: 1...10)
        print(ans!)
        
        startUtterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        loveUtterance1.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        loveUtterance2.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        speechSynth.speak(startUtterance)
    }

    @IBAction func pressFlowerButton(_ sender: Any) {
        count += 1
        if count == ans {
            flowerButton.isHidden = true
        }
        if showBool {
            flowerButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 5 / 8)
            showLabel.text = "love me"
            showBool.toggle()
            speechSynth.speak(loveUtterance1)
        } else {
            flowerButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 3 / 8)
            showLabel.text = "Don't love me"
            showBool.toggle()
            speechSynth.speak(loveUtterance2)
        }
    }
    
    @IBAction func pressRestartButton(_ sender: Any) {
        flowerButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
        ans = Int.random(in: 1...10)
        showLabel.text = "Click here"
        showBool = true
        flowerButton.isHidden = false
        count = 0
        print(ans!)
        speechSynth.speak(startUtterance)
    }
    
    
}

