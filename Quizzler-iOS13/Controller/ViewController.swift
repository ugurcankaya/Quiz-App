//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var questinBar: UIProgressView!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var trueButton: UIButton!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var falseButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showQuestion()
        updateScore()
    }
    
    func showQuestion(){
        questionLabel.text = quizBrain.getQuestionText()
        trueButton.backgroundColor = .clear
        falseButton.backgroundColor = .clear
        questinBar.progress = quizBrain.getProgress()
    }
    func updateScore(){
        scoreLabel.text = "Score: " + String(Int(quizBrain.getScore()))
    }
    
    
    
    @objc func passQuestion(){
        showQuestion()

    }
    @IBAction func answerButtonTapped(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight =  quizBrain.checkAnswer(answer: userAnswer)
        
        
        
        if userGotItRight{
            sender.backgroundColor = UIColor.green
            updateScore()
        }else{
            updateScore()
            sender.backgroundColor = UIColor.red
        }
        
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(passQuestion), userInfo: nil, repeats: false)

    }
    

}

