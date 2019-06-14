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
            layer.borderWidth = isCircle ? 0 : borderWidth
        }
    }
    @IBInspectable
    var isCircle: Bool = false {
        didSet {
            layer.borderWidth = isCircle ? 0 : borderWidth
        }
    }
    
    override func draw(_ rect: CGRect) {
        guard isCircle else {
            super.draw(rect)
            return
        }
        
        let radius = min(bounds.width, bounds.height) / 2 * 0.95
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0, endAngle: 2 * .pi, clockwise: false)
        path.lineWidth = borderWidth
        borderColor.set()
        path.stroke()
    }
    
}
