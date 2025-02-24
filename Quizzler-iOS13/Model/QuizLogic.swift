//
//  QuizLogic.swift
//  Quizzler-iOS13
//
//  Created by Tehillah Kangamba on 2025-01-19.
//  Copyright © 2025 The App Brewery. All rights reserved.
//


struct QuizLogic{
    let questions = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")

    ]
    
    var questionNumber = 1
    
    var score = 0
    
    func getCurrentQuestion() -> Question{
        return questions[questionNumber]
    }
    
    mutating func isQuestionCorrect(_ userAnswer: String) -> Bool {
        let result = questions[questionNumber].answer == userAnswer
        
        if (result){
            self.score += 1
        }
        
        return result
    }
    
    mutating func nextQuestion() {
        if(questionNumber < questions.count - 1){
            self.questionNumber += 1
        }
        
    }
    
    func percentageProgress() -> Float {
        
        return Float(questionNumber)/Float(questions.count - 1)
    }
    
    
    
    
    
}
