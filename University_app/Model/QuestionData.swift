//
//  QuestionData.swift
//  University_app
//
//  Created by Чингиз on 07.06.2018.
//  Copyright © 2018 Чингиз. All rights reserved.
//

import UIKit

class QuestionData {
    var answer : String = ""
    var question : String = ""
    init(question:String , answer: String)
    {
        self.question = question
        self.answer = answer
    }
}
