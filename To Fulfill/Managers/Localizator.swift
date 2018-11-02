//
//  Localizator.swift
//  CellcomTviOSApp
//
//  Created by Nazarii Melnyk on 8/15/18.
//  Copyright © 2018 Cellcom. All rights reserved.
//

import Foundation

class Localizator {
    
    private(set) var currentLocalization: Localization = .ukrainian
    private var localizableDictionary: NSDictionary?
    
    static let shared = Localizator()
    private init() { setup() }
    
    private func setup() {
        
        if let availableLanguage = Localization(rawValue: currentAppleLanguage) {
            currentLocalization = availableLanguage
        } else {
            currentLocalization = currentAppleLanguage == "ru" ? .ukrainian : .english
        }
        
        guard let path = Bundle.main.path(forResource: currentLocalization.rawValue, ofType: "plist") else {
            print("[localization] Localizable file (.plist) NOT found")
            return
        }
        localizableDictionary = NSDictionary(contentsOfFile: path)
    }
    
    /// Returns current Apple device language
    var currentAppleLanguage: String {
        let langArray = UserDefaults.standard.object(forKey: "AppleLanguages") as? NSArray
        var current = (langArray?.firstObject as? String) ?? ""
        
        if let range = current.range(of: "-") {
            current.removeSubrange(range.lowerBound..<current.endIndex)
        }
        
        return current
    }
    
    func localize(_ string: String) -> String {
        var container = localizableDictionary as? [String: Any]
        let properties = string.split(separator: ".")
        
        for property in properties {
            guard let value = container?[String(property)] else { break }
            if let localizedString = value as? String {
                return localizedString
            }
            container = value as? [String: Any]
        }
        
        // TODO: - Handle this case after localization will be done (nmelnyk)
        print("[localization] Missing translation for: \(properties.last ?? "errorPropertyName")")
        return "missed translation"
    }
    
}

extension Localizator {
    
    enum Localization: String {
        case english = "en"
        case ukrainian = "ua"
    }
    
}
