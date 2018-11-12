//
//  Localizator.swift
//  CellcomTviOSApp
//
//  Created by Nazarii Melnyk on 8/15/18.
//  Copyright © 2018 Cellcom. All rights reserved.
//

import Foundation

class Localizator {
    
    private(set) var currentLocalization: Localization = .english
    private var localizableDictionary: NSDictionary?
    
    static let shared = Localizator()
    private init() { setup() }
    
    private func setup() {
        
        if let availableLanguage = Localization(rawValue: currentAppleLanguage) {
            currentLocalization = availableLanguage
        } else {
            currentLocalization = currentAppleLanguage == "ua" ? .russian : .english
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
    
    func localize(_ path: String) -> String {
        guard let string = parseFromPlist(path: path) as? String else {
            return "missed translation"
        }
        return string
    }
    
    func localize(_ path: String) -> [String] {
        guard let array = parseFromPlist(path: path) as? [String] else {
            return ["missed translation"]
        }
        return array
    }
    
    private func parseFromPlist(path: String) -> Any? {
        var container = localizableDictionary as? [String: Any]
        let properties = path.split(separator: ".")
        
        var value: Any?
        properties.forEach {
            value = container?[String($0)]
            container = value as? [String: Any]
        }
        return value
    }
    
}

extension Localizator {
    
    enum Localization: String {
        case english = "en"
        case russian = "ru"
    }
    
}
