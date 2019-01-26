//
//  Conversation+Strings.swift
//  To Fulfill
//
//  Created by Nazarii Melnyk on 11/20/18.
//  Copyright © 2018 Nazarii Melnyk. All rights reserved.
//

import Foundation

protocol QuestionModel: Localizable {}
extension QuestionModel {
    static var topicHeader: String { return localize(#function) }
    static var description: String { return localize(#function) }
    static var advise: String { return localize(#function) }
    static var questions: [String] { return localize(#function) }
}

extension LocalizedStrings.Conversation {
    struct Questions {
        struct SolvingConflict: QuestionModel {}
        struct ThroughToughTimes: QuestionModel {}
        struct Alienation: QuestionModel {}
        struct RelationshipTransformation: QuestionModel {}
        struct EndingUpRelationship: QuestionModel {}
    }
    struct UI {
        struct DescriptionLabel: Localizable {
            static var intro: String { return localize(#function) }
            static var topicsTip: String { return localize(#function) }
        }
        struct NavigationButtonsLabels: Localizable {
            static var weAreReady: String { return localize(#function) }
            static var notNow: String { return localize(#function) }
            static var next: String { return localize(#function) }
            static var solveOtherConflicts: String { return localize(#function) }
            static var backToMenu: String { return localize(#function) }
        }
    }
}
