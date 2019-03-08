//
//  String.swift
//  To Fulfill
//
//  Created by Nazarii Melnyk on 11/2/18.
//  Copyright © 2018 Nazarii Melnyk. All rights reserved.
//

import Foundation

extension String {
    
    var capitalizedFirstLetter: String {
        return String(prefix(1).capitalized + dropFirst())
    }

    var camelcased: String {
        let words = split(separator: " ")
        let capitalizedWords = words.map { String($0).capitalizedFirstLetter }
        let capitalizedString = capitalizedWords.joined()
        
        return capitalizedString.prefix(1).lowercased() + capitalizedString.dropFirst()
    }
    
}
