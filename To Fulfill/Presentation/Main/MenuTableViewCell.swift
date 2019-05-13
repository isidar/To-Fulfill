//
//  MenuTableViewCell.swift
//  To Fulfill
//
//  Created by Nazarii Melnyk on 5/13/19.
//  Copyright © 2019 Nazarii Melnyk. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    enum NavigationType {
        case conversation
        case story
        case specialThanks
    }
    
    @IBOutlet private(set) weak var title: UILabel!
    
    var type: NavigationType = .conversation {
        didSet {
            let localizedStrings = Localizator.shared.localizedStrings?.main
            switch type {
            case .conversation:
                title.text = localizedStrings?.conversationButtonsLabel
            case .story:
                title.text = localizedStrings?.storyButtonsLabel
            case .specialThanks:
                title.text = localizedStrings?.specialThanksButtonsLabel
            }
        }
    }

}
