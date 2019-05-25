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
    case next
    case previous
    case solveOtherConflicts
    case backToMenu
    
    var localizedRawValue: String {
        guard let localizedStrings = Localizator.shared.localizedStrings?.conversation.ui.navigationButtonsLabels else { return "" }
        
        switch self {
        case .weAreReady:
            return localizedStrings.weAreReady
        case .next:
            return localizedStrings.next
        case .previous:
            return "<—"
        case .solveOtherConflicts:
            return localizedStrings.solveOtherConflicts
        case .backToMenu:
            return localizedStrings.backToMenu
        }
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
