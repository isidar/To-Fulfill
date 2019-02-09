//
//  Conversation+Strings.swift
//  To Fulfill
//
//  Created by Nazarii Melnyk on 11/20/18.
//  Copyright © 2018 Nazarii Melnyk. All rights reserved.
//

import Foundation

extension LocalizedStrings.Conversation {
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
