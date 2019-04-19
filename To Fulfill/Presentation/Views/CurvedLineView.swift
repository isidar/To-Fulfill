//
//  CurvedLineView.swift
//  To Fulfill
//
//  Created by Nazarii Melnyk on 4/18/19.
//  Copyright © 2019 Nazarii Melnyk. All rights reserved.
//

import UIKit

@IBDesignable
class CurvedLineView: UIView {

    @IBInspectable
    var horizontalOffset: CGFloat = 10
    @IBInspectable
    var verticalOffset: CGFloat = 0
    @IBInspectable
    var curve: CGFloat = 10
    @IBInspectable
    var lineWidth: CGFloat = 1
    @IBInspectable
    var lineColor: UIColor = .gray
    
    override func draw(_ rect: CGRect) {
        lineColor.set()
        
        let horizontalOffset = self.horizontalOffset / 100 * rect.width
        let verticalOffset = self.verticalOffset / 100 * rect.height
        let curve = self.curve / 100 * rect.height
        
        let start = CGPoint(x: rect.minX + horizontalOffset,
                            y: rect.midY + verticalOffset)
        let middle = CGPoint(x: rect.midX, y: rect.midY)
        let end = CGPoint(x: rect.maxX - horizontalOffset,
                          y: rect.midY - verticalOffset)
        let leftCurve = CGPoint(x: (start.x + middle.x) * 0.5,
                                y: (start.y + middle.y) * 0.5 - curve)
        let rightCurve = CGPoint(x: (middle.x + end.x) * 0.5,
                                 y: (middle.y + end.y) * 0.5 + curve)
        
        let path = UIBezierPath()
        path.lineWidth = lineWidth
        path.move(to: start)
        path.addQuadCurve(to: middle, controlPoint: leftCurve)
        path.addQuadCurve(to: end, controlPoint: rightCurve)
        path.stroke()
    }
    
}
