//
//  NavigationButton.swift
//  To Fulfill
//
//  Created by Nazarii Melnyk on 11/19/18.
//  Copyright © 2018 Nazarii Melnyk. All rights reserved.
//

import UIKit

@IBDesignable
class NavigationButton: ExtendedButton {
    
    var navigationState: NavigationButtonState = .weAreReady {
        didSet {
            setTitle(navigationState.rawValue, for: .normal)
        }
    }

}

/*loc*/
enum NavigationButtonState: String {
    case weAreReady = "WE’RE READY"
    case notNow = "Not now" // currently disabled according to new requirements
    case next = "Next"
    case solveOtherConflicts = "Solve other conflict"
    case backToMenu = "Back to menu"
}
