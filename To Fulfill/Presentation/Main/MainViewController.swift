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
    
    @IBOutlet private weak var logoItemsStackView: UIStackView!
    @IBOutlet private weak var curvedLineView: CurvedLineView!
    @IBOutlet private weak var conversationButton: UIButton!
    @IBOutlet private weak var storyButton: UIButton!
    @IBOutlet private weak var specialThanksButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        conversationButton.setTitle(localizedStrings?.conversationButtonsLabel, for: .normal)
        storyButton.setTitle(localizedStrings?.storyButtonsLabel, for: .normal)
        specialThanksButton.setTitle(localizedStrings?.specialThanksButtonsLabel, for: .normal)
        showViews()
    }
    
    private func showViews() {
        logoItemsStackView.alpha = 0
        curvedLineView.alpha = 0
        conversationButton.alpha = 0
        storyButton.alpha = 0
        specialThanksButton.alpha = 0
        
        let buttonsAnimation: (Bool) -> Void = { [weak self] _ in
            UIView.animate(withDuration: 0.35, animations: {
                self?.conversationButton.alpha = 1
            }) { _ in
                UIView.animate(withDuration: 0.35, animations: {
                    self?.storyButton.alpha = 1
                }) { _ in
                    UIView.animate(withDuration: 0.35, animations: {
                        self?.specialThanksButton.alpha = 1
                    })
                }
            }
        }
        let curvedLineAnimation: (Bool) -> Void = { [weak self] _ in
            UIView.animate(withDuration: 0.5, animations: {
                self?.curvedLineView.alpha = 1
            }, completion: buttonsAnimation)
        }
        
        UIView.animate(withDuration: 0.9, animations: {
            self.logoItemsStackView.alpha = 1
        }, completion: curvedLineAnimation)
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

