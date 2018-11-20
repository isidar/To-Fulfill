//
//  ConversationViewController.swift
//  To Fulfill
//
//  Created by Nazarii Melnyk on 11/12/18.
//  Copyright © 2018 Nazarii Melnyk. All rights reserved.
//

import UIKit

class ConversationViewController: ViewController {

    @IBOutlet private weak var topicsButtonsStackView: UIStackView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var readyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "The Conversation" /*loc*/
    }
    
    
    @IBAction private func readyClick(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3, animations: {
            self.topicsButtonsStackView.alpha = 1
            self.descriptionLabel.alpha = 0
            self.readyButton.alpha = 0
        })
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
