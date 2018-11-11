//
//  Localizable.swift
//  CellcomTVOS
//
//  Created by Nazarii Melnyk on 8/31/18.
//  Copyright © 2018 Cellcom. All rights reserved.
//

import Foundation

protocol Localizable {}
extension Localizable {
    
    static func localize(_ string: String) -> String {
        return (pathOfTypes + "." + string).localizedString
    }
    
    static func localize(_ string: String) -> [String] {
        return (pathOfTypes + "." + string).localizedArray
    }
    
    static private var pathOfTypes: String {
        let rawPath = String(reflecting: self)
        var components = rawPath.components(separatedBy: ".")
        guard components.count > 2 else { return rawPath }
        components.removeFirst(2)
        return components.joined(separator: ".")
    }
    
}
