//
//  UIViewController.swift
//  To Fulfill
//
//  Created by Nazarii Melnyk on 6/15/19.
//  Copyright © 2019 Nazarii Melnyk. All rights reserved.
//

import UIKit

extension UIViewController {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static func instantiateViewController<T: UIViewController>(_ bundle: Bundle? = nil) -> T {
        let storyboard = UIStoryboard(name: identifier, bundle: nil)
        return instantiate(from: storyboard, bundle)
    }
    
    static func instantiate<T: UIViewController>(from storyboard: UIStoryboard, _ bundle: Bundle? = nil) -> T {
        return storyboard.instantiateViewController(withIdentifier: identifier) as? T ?? T()
    }
    
//    static func instantiateViewController<T: UIViewController>(_ bundle: Bundle? = nil) -> T {
//        let nib = UINib(nibName: identifier, bundle: nil)
//        return instantiate(from: nib, bundle)
//    }
//    
//    static func instantiate(from nib: UINib) {
//        nib.instantiate(withOwner: <#T##Any?#>, options: <#T##[UINib.OptionsKey : Any]?#>)
//    }
    
    
    
}
