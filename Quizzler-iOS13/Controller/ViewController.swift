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
        questionLabel.text = quizLogic.getCurrentQuestion()
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
        
        scoreLabel.text = "Score:\(quizLogic.score)"
        
        // go to next Question
        quizLogic.nextQuestion()
        
        // get the new Question
        questionLabel.text = quizLogic.getCurrentQuestion()
        
        //update progressbar
        progressBar.progress += quizLogic.percentageProgress()
    
        
    }
    

    
}

