//
//  LocalizedStrings.swift
//  CellcomTVOS
//
//  Created by Nazarii Melnyk on 8/20/18.
//  Copyright © 2018 Cellcom. All rights reserved.
//

import Foundation

struct LocalizedStrings {
    struct Main {}
    struct Conversation {}
    struct Story {}
    struct SpecialThanks {}
    struct Common {}
}

struct Loc: Decodable {
    var main: Main
    var conversation: Conversation
    var story: Story
    var specialThanks: SpecialThanks
    var common: Common
}

extension Loc {
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

extension Loc.Conversation {
    struct Question: Decodable {
        var topicHeader: String
        var description: String
        var advise: String
        var array: [String]
    }
    
    struct UI: Decodable {
        var descriptionLabel: DescriptionLabel
        var navigationButtonsLabels: NavigationButtonsLabels
    }
}

extension Loc.Conversation.UI {
    struct DescriptionLabel: Decodable {
        var intro: String
        var topicsTip: String
    }
    
    struct NavigationButtonsLabels: Decodable {
        var weAreReady: String
        var notNow: String
        var next: String
        var solveOtherConflicts: String
        var backToMenu: String
    }
}
