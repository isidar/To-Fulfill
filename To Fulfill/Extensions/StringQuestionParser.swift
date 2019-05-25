//
//  StringQuestionParser.swift
//  To Fulfill
//
//  Created by Nazarii Melnyk on 11/19/18.
//  Copyright © 2018 Nazarii Melnyk. All rights reserved.
//

import Foundation

enum QuestionFlag {
    case next
    case menu
    case again
}

extension String {
    
    var questionAndFlag: (String, QuestionFlag) {
        guard let flagStartIndex = firstIndex(of: "["),
              let flagEndIndex = firstIndex(of: "]") else {
                return (self, .next)
        }
        
        let questionStart = index(after: flagEndIndex)
        let question = String(suffix(from: questionStart))
        
        let flagContent = self[index(after: flagStartIndex)..<flagEndIndex]
        let flag: QuestionFlag
        
        switch flagContent {
        case "menu": flag = .menu
        case "again": flag = .again
        default: flag = .next
        }
        
        return (question, flag)
    }
    
}
