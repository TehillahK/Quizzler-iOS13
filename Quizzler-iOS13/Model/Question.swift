//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Tehillah Kangamba on 2025-01-19.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

struct Question{
    var question: String
    var optionA: String
    var optionB: String
    var optionC: String
    var answer: String
    
    
    init(q: String,op1: String,op2: String,op3: String, a: String) {
        question = q
        optionA = op1
        optionB = op2
        optionC = op3
        answer = a
    }
    
    
}

