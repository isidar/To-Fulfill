//
//  NavigationButton.swift
//  To Fulfill
//
//  Created by Nazarii Melnyk on 11/19/18.
//  Copyright © 2018 Nazarii Melnyk. All rights reserved.
//

import UIKit

enum NavigationButtonState {
    case weAreReady
    case notNow // currently disabled according to new requirements
    case next
    case solveOtherConflicts
    case backToMenu
    
    var localizedRawValue: String {
        let localizedStrings = Localizator.shared.localizedStrings?.conversation.ui.navigationButtonsLabels
        var result: String?
        
        switch self {
        case .weAreReady:
            result = localizedStrings?.weAreReady
        case .notNow:
            result = localizedStrings?.notNow
        case .next:
            result = localizedStrings?.next
        case .solveOtherConflicts:
            result = localizedStrings?.solveOtherConflicts
        case .backToMenu:
            result = localizedStrings?.backToMenu
        }
        
        return result ?? ""
    }
}

@IBDesignable
class NavigationButton: ExtendedButton {
    
    var navigationState: NavigationButtonState = .weAreReady {
        didSet {
            setTitle(navigationState.localizedRawValue, for: .normal)
        }
    }

}
