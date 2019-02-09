//
//  MainViewController.swift
//  To Fulfill
//
//  Created by Nazarii Melnyk on 11/2/18.
//  Copyright © 2018 Nazarii Melnyk. All rights reserved.
//

import UIKit

class MainViewController: ViewController {
    
    private let localizedStrings = Localizator.shared.localizedStrings?.main
    
    @IBOutlet private weak var conversationButton: UIButton!
    @IBOutlet private weak var storyButton: UIButton!
    @IBOutlet private weak var specialThanksButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        conversationButton.setTitle(localizedStrings?.conversationButtonsLabel, for: .normal)
        storyButton.setTitle(localizedStrings?.storyButtonsLabel, for: .normal)
        specialThanksButton.setTitle(localizedStrings?.specialThanksButtonsLabel, for: .normal)
    }
    
    @IBAction private func conversationButtonClick(_ sender: UIButton) {
        show(.conversation) { $0.navigationItem.title = sender.currentTitle }
    }
    
    @IBAction private func storyButtonClick(_ sender: UIButton) {
        show(.story) { $0.navigationItem.title = sender.currentTitle }
    }
    
    @IBAction private func specialThanksButtonClick(_ sender: UIButton) {
        show(.specialThanks) { $0.navigationItem.title = sender.currentTitle }
    }
    
}

