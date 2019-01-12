//
//  UIFont.swift
//  To Fulfill
//
//  Created by Nazarii Melnyk on 1/8/19.
//  Copyright © 2019 Nazarii Melnyk. All rights reserved.
//

import UIKit

extension UIFont {
    
    static func clickerScriptRegular(_ pointSize: CGFloat) -> UIFont {
        return UIFont(name: "ClickerScript-Regular", size: pointSize) ??
            .systemFont(ofSize: pointSize)
    }
    
    static func montserratLight(_ pointSize: CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-Light", size: pointSize) ??
            .systemFont(ofSize: pointSize)
    }
    
}
