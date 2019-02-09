//
//  QuestionsManager.swift
//  To Fulfill
//
//  Created by Nazarii Melnyk on 11/11/18.
//  Copyright © 2018 Nazarii Melnyk. All rights reserved.
//

import UIKit

class QuestionsManager {

    static let shared = QuestionsManager()
    private init() {}

    private let questions = Localizator.shared.localizedStrings?.conversation.questions ?? []

    func getQuestions(for questionsTopic: String) -> [(String, QuestionFlag)] {
        let questionObject = questions.first { $0.topicHeader == questionsTopic }
        let questionsTuples = questionObject?.array.map { $0.questionAndFlag }
        return questionsTuples ?? []
    }

    func getTopicDescription(for questionsTopic: String) -> String {
        let questionObject = questions.first { $0.topicHeader == questionsTopic }
        let description = questionObject?.description ?? ""
        return description
    }

    func getAdvise(for questionsTopic: String) -> (String, QuestionFlag) {
        let questionObject = questions.first { $0.topicHeader == questionsTopic }
        let advise = questionObject?.advise ?? ""
        return advise.questionAndFlag
    }
    
    func getImage(for questionsTopic: String) -> UIImage {
        let questionObject = questions.first { $0.topicHeader == questionsTopic }
        let imageName = questionObject?.imageName ?? ""
        return .getImageFor(question: imageName)
    }

}
