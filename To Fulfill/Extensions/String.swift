//
//  String.swift
//  To Fulfill
//
//  Created by Nazarii Melnyk on 11/2/18.
//  Copyright © 2018 Nazarii Melnyk. All rights reserved.
//

import Foundation

extension String {
    
    var localizedString: String {
        return Localizator.shared.localize(self)
    }
    
    var localizedArray: [String] {
        return Localizator.shared.localize(self)
    }
    
    var capitalizedFirstLetter: String {
        return String(prefix(1).capitalized + dropFirst())
    }
    
}
