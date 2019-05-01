//
//  UIFont.swift
//  To Fulfill
//
//  Created by Nazarii Melnyk on 1/8/19.
//  Copyright © 2019 Nazarii Melnyk. All rights reserved.
//

import UIKit

extension UIFont {
    
    static func papyrusRegular(_ pointSize: CGFloat) -> UIFont {
        return UIFont(name: "Papyrus", size: pointSize) ??
            .systemFont(ofSize: pointSize)
    }
    
    static func pingFangHKSemibold(_ pointSize: CGFloat) -> UIFont {
        return UIFont(name: "PingFangHK-Semibold", size: pointSize) ??
            .systemFont(ofSize: pointSize)
    }
    
}
