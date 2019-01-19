//
//  QuestionsManager.swift
//  To Fulfill
//
//  Created by Nazarii Melnyk on 11/11/18.
//  Copyright © 2018 Nazarii Melnyk. All rights reserved.
//

import Foundation

enum Question: String { /*loc*/
    case solvingConflict = "Solving Conflict"
    case throughToughTimes = "Through Tough Times"
    case alienation = "Alienation"
    case relationshipTransformation = "Relationship Transformation"
    case endingUpRelationship = "Ending Up Relationship"
    
    var string: String { return "\(self)" }
}

class QuestionsManager {
    
    static let shared = QuestionsManager()
    private init() {}
    
    private let localizedQuestions = LocalizedStrings.Conversation.Questions.self
    
    func getQuestions(for questionsTopic: Question) -> [(String, QuestionFlag)] {
        return mapQuestionTopicToLocalizedStringsStruct(questionsTopic: questionsTopic).questions.map { $0.questionAndFlag }
    }
    
    func getTopicDescription(for questionsTopic: Question) -> String {
        return mapQuestionTopicToLocalizedStringsStruct(questionsTopic: questionsTopic).description
    }
    
    func getAdvise(for questionsTopic: Question) -> (String, QuestionFlag) {
        return mapQuestionTopicToLocalizedStringsStruct(questionsTopic: questionsTopic).advise.questionAndFlag
    }
    
    private func mapQuestionTopicToLocalizedStringsStruct(questionsTopic: Question) -> QuestionModel.Type {
        switch questionsTopic {
        case .solvingConflict:
            return localizedQuestions.SolvingConflict.self
        case .throughToughTimes:
            return localizedQuestions.ThroughToughTimes.self
        case .alienation:
            return localizedQuestions.Alienation.self
        case .relationshipTransformation:
            return localizedQuestions.RelationshipTransformation.self
        case .endingUpRelationship:
            return localizedQuestions.EndingUpRelationship.self
        }
    }
    
}
