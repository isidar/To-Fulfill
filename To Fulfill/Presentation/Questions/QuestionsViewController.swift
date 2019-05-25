//
//  ConversationViewController.swift
//  To Fulfill
//
//  Created by Nazarii Melnyk on 11/2/18.
//  Copyright © 2018 Nazarii Melnyk. All rights reserved.
//

import UIKit

class QuestionsViewController: ViewController {
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var questionStackView: UIStackView!
    @IBOutlet private weak var questionLabel: UILabel!
    @IBOutlet private weak var nextButton: NavigationButton!
    
    var questionsTopic = ""
    
    private var questions: [(question: String, flag: QuestionFlag)] = []
    private var questionIndex = 0
    private var topicDescription = ""
    private var adviseData = (advice: "", flag: QuestionFlag.next)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupQuestionsData()
        
        navigationItem.title = questionsTopic
        nextButton.navigationState = .weAreReady
        questionLabel.text = topicDescription
    }
    
    func changeText(to text: String, withAnimationDuration: TimeInterval) {
        questionLabel.text = text
        UIView.animate(withDuration: withAnimationDuration) {
            self.questionLabel.alpha = 0
            self.questionLabel.alpha = 1
            self.questionStackView.layoutIfNeeded()
        }
    }

}

private extension QuestionsViewController {
    @IBAction func buttonClick(_ sender: NavigationButton) {
        setupNextQuestion(accordingTo: sender.navigationState)
    }
}

private extension QuestionsViewController {
    
    func setupQuestionsData() {
        imageView.image = QuestionsManager.shared.image(for: questionsTopic)
        questions = QuestionsManager.shared.getQuestions(for: questionsTopic)
        topicDescription = QuestionsManager.shared.getTopicDescription(for: questionsTopic)
        adviseData = QuestionsManager.shared.getAdvise(for: questionsTopic)
    }
    
    func setupNextQuestion(accordingTo navigationState: NavigationButtonState) {
        switch navigationState {
        case .next,
             .weAreReady where questionLabel.text != topicDescription:
            questionIndex += 1
            
        case .solveOtherConflicts:
            questionIndex = 0
            
        case .backToMenu:
            navigationController?.popToRootViewController(animated: true)
            return
            
        default: break
        }
        
        if let questionFlag = questions[safe: questionIndex]?.flag,
           questionFlag == .next {
            nextButton.navigationState = .next
        }
        
        setupTextForNextQuestion()
    }
    
    func setupTextForNextQuestion() {
        let animationDuration = 0.2
        
        if let nextQuestion = questions[safe: questionIndex]?.question {
            changeText(to: nextQuestion, withAnimationDuration: animationDuration)
        } else {
            changeText(to: adviseData.advice, withAnimationDuration: animationDuration)
            
            switch adviseData.flag {
            case .menu:
                nextButton.navigationState = .backToMenu
            case .again:
                nextButton.navigationState = .solveOtherConflicts
            default:
                nextButton.isHidden = true
            }
        }
    }
    
}
