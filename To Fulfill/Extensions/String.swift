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
        return split(separator: " ").count > 1 ?
            prefix(1).lowercased() + capitalized.replacingOccurrences(of: " ", with: "").dropFirst() :
            self
    }
    
}
