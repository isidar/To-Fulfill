//
//  ConversationViewController.swift
//  To Fulfill
//
//  Created by Nazarii Melnyk on 11/12/18.
//  Copyright © 2018 Nazarii Melnyk. All rights reserved.
//

import UIKit

class ConversationViewController: ViewController {

    @IBOutlet private weak var contentStackView: UIStackView!
    @IBOutlet private weak var topicsButtonsStackView: UIStackView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var separatorImageView: UIImageView!
    @IBOutlet private weak var readyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topicsButtonsStackView.alpha = 0
        navigationItem.title = "The Conversation" /*loc*/
        descriptionLabel.text = "To Fulfill is created to refresh your relationship at different stages. The app was created not only for couples, close friends and relatives.Try to choose a convenient place to talk and give this conversation enough time. Answer questions one by one, be sincere and courageous." /*loc*/
    }
    
    @IBAction private func readyClick(_ sender: UIButton) {
        descriptionLabel.alpha = 0
        descriptionLabel.text = "Choose the section that is most relevant to your relationship at this moment." /*loc*/
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
