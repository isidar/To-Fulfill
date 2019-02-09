//
//  Root+LocalizedStrings.swift
//  To Fulfill
//
//  Created by Nazarii Melnyk on 2/6/19.
//  Copyright © 2019 Nazarii Melnyk. All rights reserved.
//

import Foundation

extension LocalizedStrings {
    struct Main: Decodable {
        var conversationButtonsLabel: String
        var storyButtonsLabel: String
        var specialThanksButtonsLabel: String
    }
    
    struct Conversation: Decodable {
        var questions: [Question]
        var ui: UI
    }
    
    struct Story: Decodable {
        var title: String
    }
    
    struct SpecialThanks: Decodable {
        var title: String
    }
    
    struct Common: Decodable {
        var backButton: String
    }
}
