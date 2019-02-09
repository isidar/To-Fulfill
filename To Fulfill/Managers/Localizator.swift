//
//  Localizator.swift
//  CellcomTviOSApp
//
//  Created by Nazarii Melnyk on 8/15/18.
//  Copyright © 2018 Cellcom. All rights reserved.
//

import Foundation

class Localizator {
    
    static let shared = Localizator()
    private init() { setup() }
    
    var localizedStrings: LocalizedStrings?
    private(set) var currentLocalization: Localization = .english
    
    private func setup() {
        if let availableLanguage = Localization(rawValue: currentAppleLanguage) {
            currentLocalization = availableLanguage
        } else {
            currentLocalization = currentAppleLanguage == "ru" ? .ukrainian : .english
        }
        
        guard
            let path = Bundle.main.path(forResource: currentLocalization.rawValue, ofType: "plist"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
                return print("[localization] Localizable file \(currentLocalization.rawValue).plist NOT found")
        }
        
        localizedStrings = try? PropertyListDecoder().decode(LocalizedStrings.self, from: data)
    }
    
    /// Returns current Apple device language
    var currentAppleLanguage: String { // TODO: – Return tuple with language and region
        let langArray = UserDefaults.standard.object(forKey: "AppleLanguages") as? NSArray
        var current = (langArray?.firstObject as? String) ?? ""
        
        if let range = current.range(of: "-") {
            current.removeSubrange(range.lowerBound..<current.endIndex)
        }
        
        return current
    }
    
}

extension Localizator {
    
    enum Localization: String {
        case english = "en"
        case ukrainian = "uk"
    }
    
}
