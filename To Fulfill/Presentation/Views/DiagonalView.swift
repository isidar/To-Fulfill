//
//  DiagonalView.swift
//  To Fulfill
//
//  Created by Nazarii Melnyk on 11/4/18.
//  Copyright © 2018 Nazarii Melnyk. All rights reserved.
//

import UIKit

@IBDesignable
class DiagonalView: UIView {
    
    @IBInspectable
    var topPointRatio: CGFloat = 0.9
    
    @IBInspectable
    var bottomPointRatio: CGFloat = -0.01
    
    @IBInspectable
    var secondBackgroundColor: UIColor = .white
    
    override func draw(_ rect: CGRect) {
        let triangle = UIBezierPath()
        triangle.move(to: .zero)
        triangle.addLine(to: CGPoint(x: bounds.size.width * topPointRatio,
                                     y: 0))
        triangle.addLine(to: CGPoint(x: bounds.size.width * bottomPointRatio,
                                     y: bounds.size.height))
        triangle.addLine(to: CGPoint(x: 0,
                                     y: bounds.size.height))
        triangle.close()
        
        secondBackgroundColor.setFill()
        triangle.fill()
        secondBackgroundColor.setStroke()
        triangle.stroke()
    }

}
