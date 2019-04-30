//
//  NSAttributedString.swift
//  To Fulfill
//
//  Created by Nazarii Melnyk on 4/30/19.
//  Copyright © 2019 Nazarii Melnyk. All rights reserved.
//

import UIKit

extension NSAttributedString {
    
    func replaced(_ stringToReplace: String, with icon: UIImage) -> NSAttributedString {
        guard let cgImage = icon.cgImage,
              let font = attribute(.font, at: 0, effectiveRange: nil) as? UIFont else { return self }
        let oldHeight = icon.size.height
        let scaleFactor = oldHeight / font.pointSize
        
        let attachment = NSTextAttachment()
        attachment.image = UIImage(cgImage: cgImage, scale: scaleFactor, orientation: .up)
        
        let iconString = NSAttributedString(attachment: attachment)
        let result = NSMutableAttributedString(attributedString: self)
        
        var range = result.mutableString.range(of: stringToReplace)
        while range.location != NSNotFound {
            result.replaceCharacters(in: range, with: iconString)
            let nextRange = NSRange(location: range.location, length: result.length - range.location)
            range = result.mutableString.range(of: stringToReplace, range: nextRange)
        }

        return result
    }
    
}
