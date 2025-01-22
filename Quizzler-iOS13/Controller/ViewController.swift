//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var optionA: UIButton!
    @IBOutlet weak var optionB: UIButton!
    @IBOutlet weak var optionC: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizLogic = QuizLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let firstQuestion = quizLogic.getCurrentQuestion()
        
        questionLabel.text = firstQuestion.question
        optionA.setTitle(firstQuestion.options[0], for: UIControl.State.normal)
        optionB.setTitle(firstQuestion.options[1], for: UIControl.State.normal)
        optionC.setTitle(firstQuestion.options[2], for: UIControl.State.normal)
        
        progressBar.progress = 0.0
        scoreLabel.text = "Score:\(quizLogic.score)"
    }

    @IBAction func answerGiven(_ sender: UIButton) {
        
        
        let isCorrect = quizLogic.isQuestionCorrect((sender.titleLabel?.text!)!)
        
        // is the answer user provided correct
        if(isCorrect){
            // if its correct button becomes green
            sender.backgroundColor = UIColor.green
        }else{
            // if its wrong button becomes red
            sender.backgroundColor = UIColor.red
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1 ) {
            UIView.animate(withDuration: 0.2) {
                sender.backgroundColor = UIColor.clear
            }
        }
        
        
        
      
        updateUI()
    }
    
    func updateUI() {
        
        let progressVal = quizLogic.percentageProgress()
        print(progressVal)
        
        scoreLabel.text = "Score:\(quizLogic.score)"
        
        // go to next Question
        quizLogic.nextQuestion()
        let currentQuestion = quizLogic.getCurrentQuestion()
        
        // get the new Question
        questionLabel.text = currentQuestion.question
        
        // update multiple choice answers
        optionA.setTitle(currentQuestion.options[0], for: UIControl.State.normal)
        optionB.setTitle(currentQuestion.options[1], for: UIControl.State.normal)
        optionC.setTitle(currentQuestion.options[2], for: UIControl.State.normal)
        
        //update progressbar
        progressBar.progress = progressVal
    
        
    }
    

    
}

