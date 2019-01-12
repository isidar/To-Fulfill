//
//  ExtendedButton.swift
//  To Fulfill
//
//  Created by Nazarii Melnyk on 1/7/19.
//  Copyright © 2019 Nazarii Melnyk. All rights reserved.
//

import UIKit

@IBDesignable
class ExtendedButton: UIButton {
    
    @IBInspectable
    var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
}
