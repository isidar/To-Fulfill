//
//  ConversationViewController.swift
//  To Fulfill
//
//  Created by Nazarii Melnyk on 11/2/18.
//  Copyright © 2018 Nazarii Melnyk. All rights reserved.
//

import UIKit

class QuestionsViewController: ViewController {
    
    @IBOutlet private weak var questionStackView: UIStackView!
    @IBOutlet private weak var questionLabel: UILabel!
    @IBOutlet private weak var nextButton: NavigationButton!
    @IBOutlet private weak var notNowButton: NavigationButton!
    
    var questionsTopic: Question = .alienation
    
    private var questions: [(question: String, flag: QuestionFlag)] = []
    private var questionIndex = 0
    private var topicDescription = ""
    private var adviseData = (advice: "", flag: QuestionFlag.next)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = questionsTopic.rawValue
        nextButton.navigationState = .weAreReady
        notNowButton.navigationState = .notNow
        
        fetchData()
        questionLabel.text = topicDescription
    }
    
    private func fetchData() {
        questions = QuestionsManager.shared.getQuestions(for: questionsTopic)
        topicDescription = QuestionsManager.shared.getTopicDescription(for: questionsTopic)
        adviseData = QuestionsManager.shared.getAdvise(for: questionsTopic)
    }
    
    @IBAction private func buttonClick(_ sender: NavigationButton) {
        setupNextQuestion(accordingTo: sender.navigationState)
    }
    
    private func setupNextQuestion(accordingTo navigationState: NavigationButtonState) {
        switch navigationState {
        case .next, .weAreReady where questionLabel.text != topicDescription:
            questionIndex += 1
            
        case .solveOtherConflicts:
            questionIndex = 0
            
        case .backToMenu:
            navigationController?.popToRootViewController(animated: true)
            return
            
        case .notNow:
            let currentQuestionFlag = questions[safe: questionIndex]?.flag
            if case let QuestionFlag.redirect(nextQuestionIndex)? = currentQuestionFlag {
                questionIndex = nextQuestionIndex
            }
            
        default: break
        }
        
        setupButtonsAppearanceForNextQuestion()
        setupTextForNextQuestion()
    }
    
    private func setupButtonsAppearanceForNextQuestion() {
        guard let nextQuestionFlag = questions[safe: questionIndex]?.flag else { return }
        
        switch nextQuestionFlag {
        case .next:
            nextButton.navigationState = .next
            notNowButton.isHidden = true
            
        case .menu where !notNowButton.isHidden:
            nextButton.navigationState = .backToMenu
            notNowButton.isHidden = true
            
        case .again where !notNowButton.isHidden:
            nextButton.navigationState = .solveOtherConflicts
            notNowButton.isHidden = true
            
        case .menu where notNowButton.isHidden,
             .again where notNowButton.isHidden:
            questionIndex += 1
            setupButtonsAppearanceForNextQuestion()
            
        case .redirect:
            nextButton.navigationState = .weAreReady
            notNowButton.isHidden = false
            
        default: break
        }
    }
    
    
    private func setupTextForNextQuestion() {
        let animationDuration = 0.4
        
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
            notNowButton.isHidden = true
        }
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

