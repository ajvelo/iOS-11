//
//  Question.swift
//  Quizzler
//
//  Created by Andreas Velounias on 12/12/2017.
//  Copyright © 2017 Andreas Velounias. All rights reserved.
//

import Foundation


class Question {
    
    let questionText: String
    let answer: Bool
    
    init(text: String, correctAnswer: Bool) {
        
        questionText = text
        answer = correctAnswer
    }
}
