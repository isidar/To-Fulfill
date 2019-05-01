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
    
    private let topBorder = UIView()
    private let bottomBorder = UIView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        updateBordersFrames()
        updateBordersColor()
        
        addSubview(topBorder)
        addSubview(bottomBorder)
    }
    
    private func updateBordersFrames() {
        topBorder.frame = CGRect(x: 0, y: 0, width: frame.width, height: verticalBordersWidth)
        bottomBorder.frame = CGRect(x: 0, y: frame.height, width: frame.width, height: verticalBordersWidth)
    }
    
    private func updateBordersColor() {
        topBorder.backgroundColor = topBorderColor
        bottomBorder.backgroundColor = bottomBorderColor
    }
    
    // MARK: - Default borders
    
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
    
    // MARK: - Custom borders
    
    @IBInspectable
    var topBorderColor: UIColor = .clear {
        didSet {
            updateBordersColor()
        }
    }
    @IBInspectable
    var bottomBorderColor: UIColor = .clear {
        didSet {
            updateBordersColor()
        }
    }
    @IBInspectable
    var verticalBordersWidth: CGFloat = 0 {
        didSet {
            updateBordersFrames()
        }
    }
    
}
