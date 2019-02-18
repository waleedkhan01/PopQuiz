//
//  Question.swift
//  Quizzler
//
//  Created by Waleed Khan on 1/2/19.


import Foundation

class Question {
    
    let questionText: String
    let answer: Bool
   
    init(textForQuestion: String, correctAnswer: Bool){
        questionText = textForQuestion
        answer = correctAnswer
    }
}
