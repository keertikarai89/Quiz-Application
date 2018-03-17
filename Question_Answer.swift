//
//  Question_Answer.swift
//  Quiz
//
//  Created by Keertika on 3/6/18.
//  Copyright © 2018 DePaul University. All rights reserved.
//

import Foundation

import UIKit

class Question {
    var question : String?
    var answers : [Answer]!
    
    init (question: String, answers: [Answer]) {
        self.question = question
        self.answers = answers
    }
}

class Answer {
    var response: String!
    var isRight: Bool!
    
    init(answer: String, isRight: Bool) {
        self.response  = answer
        self.isRight = isRight
    }
}
