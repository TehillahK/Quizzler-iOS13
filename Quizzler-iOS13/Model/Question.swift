//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Tehillah Kangamba on 2025-01-19.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

struct Question{
    var question: String
    var options: [String]
    var answer: String
    
    
    init(q: String,a: [String], correctAnswer: String) {
        question = q
        options = a
        answer = correctAnswer
    }
    
    
}

