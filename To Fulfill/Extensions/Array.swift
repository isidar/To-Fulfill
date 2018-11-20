//
//  Array.swift
//  To Fulfill
//
//  Created by Nazarii Melnyk on 11/20/18.
//  Copyright © 2018 Nazarii Melnyk. All rights reserved.
//

import Foundation

extension Array {
    subscript (safe index: Int) -> Element? {
        get {
            return indices ~= index ? self[index] : nil
        }
        set {
            guard let value = newValue, index < count, index >= 0 else { return }
            self[index] = value
        }
    }
}
