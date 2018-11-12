//
//  TransitionManager.swift
//  To Fulfill
//
//  Created by Nazarii Melnyk on 11/11/18.
//  Copyright © 2018 Nazarii Melnyk. All rights reserved.
//

import UIKit

class TransitionManager {
    
    static let shared = TransitionManager()
    
    private init() {}
    
    func show(_ vc: ViewControllerToShow, presentingVC: UIViewController, configure: ((UIViewController) -> Void)?) {
        let storyboard = UIStoryboard(name: vc.rawValue.capitalizedFirstLetter, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: vc.rawValue)
        configure?(vc)
        presentingVC.show(vc, sender: nil)
    }
    
}

enum ViewControllerToShow: String {
    case questions
    case conversation
    case story
    case specialThanks
}
