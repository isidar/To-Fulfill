//
//  UIColor.swift
//  To Fulfill
//
//  Created by Nazarii Melnyk on 11/11/18.
//  Copyright © 2018 Nazarii Melnyk. All rights reserved.
//

import UIKit
import Foundation

extension UIColor {
    
    convenience init(hexString: String, alpha: CGFloat = 1) {
        let hexString = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        
        if hexString.hasPrefix("#") {
            scanner.scanLocation = 1
        }
        
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red =  CGFloat(r) / 255
        let green =  CGFloat(g) / 255
        let blue =  CGFloat(b) / 255
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    static var background: UIColor {
        return UIColor(hexString: "#bfffc0")
    }
    
}
