//
//  ConversationViewController.swift
//  To Fulfill
//
//  Created by Nazarii Melnyk on 11/2/18.
//  Copyright © 2018 Nazarii Melnyk. All rights reserved.
//

import UIKit

class QuestionsViewController: ViewController {
    
    var question: Question = .alienation

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = question.rawValue
    }

}

