//
//  MainViewController.swift
//  To Fulfill
//
//  Created by Nazarii Melnyk on 11/2/18.
//  Copyright © 2018 Nazarii Melnyk. All rights reserved.
//

import UIKit

class MainViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction private func conversationButtonClick(_ sender: UIButton) {
        show(.conversation)
    }
    
    @IBAction private func storyButtonClick(_ sender: UIButton) {
        show(.story)
    }
    
    @IBAction private func specialThanksButtonClick(_ sender: UIButton) {
        show(.specialThanks)
    }
    
}

