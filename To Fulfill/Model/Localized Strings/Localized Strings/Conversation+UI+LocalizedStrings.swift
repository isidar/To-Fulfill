//
//  Conversation+UI+LocalizedStrings.swift
//  To Fulfill
//
//  Created by Nazarii Melnyk on 2/6/19.
//  Copyright © 2019 Nazarii Melnyk. All rights reserved.
//

import Foundation

extension LocalizedStrings.Conversation.UI {
    struct DescriptionLabel: Decodable {
        var intro: String
        var topicsTip: String
    }
    
    struct NavigationButtonsLabels: Decodable {
        var weAreReady: String
        var next: String
        var solveOtherConflicts: String
        var backToMenu: String
    }
}

