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
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var quizLogic = QuizLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        questionLabel.text = quizLogic.getCurrentQuestion()
        progressBar.progress = 0.0
    }

    @IBAction func answerGiven(_ sender: UIButton) {
        
        // if question is correct
        let isCorrect = quizLogic.isQuestionCorrect((sender.titleLabel?.text!)!)
        
        if(isCorrect){
            sender.backgroundColor = UIColor.green
        }else{
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
        // go to next Question
        quizLogic.nextQuestion()
        
        // get the new Question
        questionLabel.text = quizLogic.getCurrentQuestion()
        
        //update progressbar
        progressBar.progress += quizLogic.percentageProgress()
    
        
    }
    

    
}

