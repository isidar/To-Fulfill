//
//  NavigationButton.swift
//  To Fulfill
//
//  Created by Nazarii Melnyk on 11/19/18.
//  Copyright © 2018 Nazarii Melnyk. All rights reserved.
//

import UIKit

@IBDesignable
class NavigationButton: UIButton {
    
    var navigationState: NavigationButtonState = .weAreReady {
        didSet {
            setTitle(navigationState.rawValue, for: .normal)
        }
    }
    
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

/*loc*/
enum NavigationButtonState: String {
    case weAreReady = "WE’RE READY"
    case notNow = "Not now"
    case next = "Next"
    case solveOtherConflicts = "Solve other conflict"
    case backToMenu = "Back to menu"
}
