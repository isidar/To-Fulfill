//
//  Conversation+Strings.swift
//  To Fulfill
//
//  Created by Nazarii Melnyk on 11/20/18.
//  Copyright © 2018 Nazarii Melnyk. All rights reserved.
//

import Foundation

protocol QuestionModel {
    static var description: String { get }
    static var advise: String { get }
    static var questions: [String] { get }
}

extension LocalizedStrings.Conversation {
    struct Questions {
        struct SolvingConflict: Localizable, QuestionModel {
            static var description: String { return localize(#function) }
            static var advise: String { return localize(#function) }
            static var questions: [String] { return localize(#function) }
        }
        struct ThroughToughTimes: Localizable, QuestionModel {
            static var description: String { return localize(#function) }
            static var advise: String { return localize(#function) }
            static var questions: [String] { return localize(#function) }
        }
        struct Alienation: Localizable, QuestionModel {
            static var description: String { return localize(#function) }
            static var advise: String { return localize(#function) }
            static var questions: [String] { return localize(#function) }
        }
        struct RelationshipTransformation: Localizable, QuestionModel {
            static var description: String { return localize(#function) }
            static var advise: String { return localize(#function) }
            static var questions: [String] { return localize(#function) }
        }
        struct EndingUpRelationship: Localizable, QuestionModel {
            static var description: String { return localize(#function) }
            static var advise: String { return localize(#function) }
            static var questions: [String] { return localize(#function) }
        }
    }
    struct UI: Localizable {
        static var title: String { return localize(#function) }
        static var nextButton: String { return localize(#function) }
    }
}
