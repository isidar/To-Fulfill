//
//  UIFont.swift
//  To Fulfill
//
//  Created by Nazarii Melnyk on 1/8/19.
//  Copyright © 2019 Nazarii Melnyk. All rights reserved.
//

import UIKit

extension UIFont {
    
    static func verdanaRegular(_ pointSize: CGFloat) -> UIFont {
        return UIFont(name: "Verdana-Regular", size: pointSize) ??
            .systemFont(ofSize: pointSize)
    }
    
}
