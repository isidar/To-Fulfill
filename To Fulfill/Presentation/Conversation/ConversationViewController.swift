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
        readyButton.isHidden = true
        
        UIView.animate(withDuration: 0.5, animations: {
            self.topicsButtonsStackView.isHidden = false
            self.topicsButtonsStackView.alpha = 1
            
            self.contentStackView.layoutIfNeeded()
        }) { _ in
            UIView.animate(withDuration: 0.8) {
                self.descriptionLabel.alpha = 1
            }
        }
    }

    @IBAction private func solvingConflictClick(_ sender: UIButton) {
        showQuestion(.solvingConflict)
    }
    
    @IBAction private func throughToughTimesClick(_ sender: UIButton) {
        showQuestion(.throughToughTimes)
    }
    
    @IBAction private func alienationClick(_ sender: UIButton) {
        showQuestion(.alienation)
    }
    
    @IBAction private func relationshipTransformationClick(_ sender: UIButton) {
        showQuestion(.relationshipTransformation)
    }
    
    @IBAction private func endingUpRelationshipClick(_ sender: UIButton) {
        showQuestion(.endingUpRelationship)
    }
    
    private func showQuestion(_ questionsTopic: Question) {
        show(.questions) { vc in
            guard let vc = vc as? QuestionsViewController else { return }
            vc.questionsTopic = questionsTopic
        }
    }
    
}
