//
//  QuestionsManager.swift
//  To Fulfill
//
//  Created by Nazarii Melnyk on 11/11/18.
//  Copyright © 2018 Nazarii Melnyk. All rights reserved.
//

import Foundation

class QuestionsManager {
    
    static let shared = QuestionsManager()
    
    private init() {}
    
    
}

enum Question: String { /*loc*/
    case solvingConflict = "Solving Conflict"
    case throughToughTimes = "Through Tough Times"
    case alienation = "Alienation"
    case relationshipTransformation = "Relationship Transformation"
    case endingUpRelationship = "Ending Up Relationship"
    
    var string: String { return "\(self)" }
}
