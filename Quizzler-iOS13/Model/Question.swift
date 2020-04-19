//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by UGURCAN KAYA on 4/15/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

struct Question{
    
    let text : String
    let answer: String
    
    init(q: String, a: String) {
        text = q
        answer = a
    }
}
