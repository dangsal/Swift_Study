//
//  Model.swift
//  QuizApp
//
//  Created by 이성호 on 2021/07/19.
//

import Foundation

struct Question {
    let text : String
    let answers : [Answer]
}

struct Answer {
    let text : String
    let correct: Bool
}
