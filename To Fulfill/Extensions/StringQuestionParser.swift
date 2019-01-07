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
    case redirect(Int)
}

extension String {
    
    var questionAndFlag: (String, QuestionFlag) {
        var question = self
        var flag: QuestionFlag = .next
        
        if let flagStartIndex = firstIndex(of: "["),
           let flagEndIndex = firstIndex(of: "]") {
            
            let flagContent = self[index(after: flagStartIndex)..<flagEndIndex]
            let questionStart = index(after: flagEndIndex)
            question = String(suffix(from: questionStart))
            
            switch flagContent {
            case "menu": flag = .menu
            case "again": flag = .again
            default:
                Int(flagContent).flatMap { flag = .redirect($0) }
            }
            
        }
        
        return (question, flag)
    }
    
}
