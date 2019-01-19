//
//  UIImage.swift
//  To Fulfill
//
//  Created by Nazarii Melnyk on 1/19/19.
//  Copyright © 2019 Nazarii Melnyk. All rights reserved.
//

import UIKit

extension UIImage {
    
    class func getImageFor(question: Question) -> UIImage {
        return UIImage(named: question.string) ?? UIImage()
    }
    
}
