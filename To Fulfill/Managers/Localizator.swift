//
//  Localizator.swift
//  CellcomTviOSApp
//
//  Created by Nazarii Melnyk on 8/15/18.
//  Copyright © 2018 Cellcom. All rights reserved.
//

import Foundation

enum Localization: String, CaseIterable {
    case english = "en"
    case ukrainian = "uk"
}

class Localizator {
    
    static let shared = Localizator()
    private init() { setup() }
    
    private let userDefaultsKey = "localization"
    
    private(set) var localizedStrings: LocalizedStrings?
    private(set) var currentLocalization: Localization = .english
    
    private func setup() {
        if let savedLocalizationString = UserDefaults.standard.string(forKey: userDefaultsKey),
           let userSelectedLocalization = Localization(rawValue: savedLocalizationString) {
            currentLocalization = userSelectedLocalization
        } else if let availableLanguage = Localization(rawValue: currentAppleLanguage) {
            currentLocalization = availableLanguage
        } else {
            currentLocalization = currentAppleLanguage == "ru" ? .ukrainian : .english
        }
        reloadLocalizedStrings()
    }
    
    private func reloadLocalizedStrings() {
        guard
            let path = Bundle.main.path(forResource: currentLocalization.rawValue, ofType: "plist"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
                return print("[localization] Localizable file \(currentLocalization.rawValue).plist NOT found")
        }
        
        localizedStrings = try? PropertyListDecoder().decode(LocalizedStrings.self, from: data)
    }
    
    // MARK: - Public API
    
    /// Returns current Apple device language
    var currentAppleLanguage: String {
        let langArray = UserDefaults.standard.object(forKey: "AppleLanguages") as? NSArray
        var current = (langArray?.firstObject as? String) ?? ""
        
        if let range = current.range(of: "-") {
            current.removeSubrange(range.lowerBound..<current.endIndex)
        }
        
        return current
    }
    
    func setCurrentLocalization(to localization: Localization) {
        currentLocalization = localization
        UserDefaults.standard.set(localization.rawValue, forKey: userDefaultsKey)
        UserDefaults.standard.synchronize()
        reloadLocalizedStrings()
    }
    
}
