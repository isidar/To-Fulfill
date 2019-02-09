//
//  ConversationViewController.swift
//  To Fulfill
//
//  Created by Nazarii Melnyk on 11/12/18.
//  Copyright © 2018 Nazarii Melnyk. All rights reserved.
//

import UIKit

class ConversationViewController: ViewController {
    
    private let localizedStrings = Localizator.shared.localizedStrings?.conversation

    @IBOutlet private weak var contentStackView: UIStackView!
    @IBOutlet private weak var topicsButtonsStackView: UIStackView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var separatorImageView: UIImageView!
    @IBOutlet private weak var readyButton: NavigationButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    
    private func setupSubviews() {
        topicsButtonsStackView.alpha = 0
        readyButton.navigationState = .weAreReady
        descriptionLabel.text = localizedStrings?.ui.descriptionLabel.intro
        for (i, view) in topicsButtonsStackView.arrangedSubviews.enumerated() {
            let buttonsTitle = localizedStrings?.questions[safe: i]?.topicHeader
            (view as? UIButton)?.setTitle(buttonsTitle, for: .normal)
        }
    }
    
    @IBAction private func readyClick(_ sender: UIButton) {
        descriptionLabel.alpha = 0
        descriptionLabel.text = localizedStrings?.ui.descriptionLabel.topicsTip
        separatorImageView.alpha = 0
        separatorImageView.isHidden = false
        readyButton.isHidden = true
        
        // TODO: – Try batch update instead of consistent calls
        
        let separatorAnimation: (Bool) -> Void = { [weak self] _ in
            UIView.animate(withDuration: 0.3) {
                self?.separatorImageView.alpha = 1
            }
        }
        let descriptionAnimation: (Bool) -> Void = { [weak self] _ in
            UIView.animate(withDuration: 0.6, animations: {
                self?.descriptionLabel.alpha = 1
            }, completion: separatorAnimation)
        }
        
        UIView.animate(withDuration: 0.5, animations: {
            self.topicsButtonsStackView.isHidden = false
            self.topicsButtonsStackView.alpha = 1
            self.contentStackView.layoutIfNeeded()
        }, completion: descriptionAnimation)
    }

    @IBAction private func questionClick(_ sender: UIButton) {
        let questionsTopic = sender.currentTitle ?? ""
        show(.questions) {
            let vc = $0 as? QuestionsViewController
            vc?.questionsTopic = questionsTopic
        }
    }
    
}
