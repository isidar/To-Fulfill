//
//  StoryViewController.swift
//  To Fulfill
//
//  Created by Nazarii Melnyk on 11/2/18.
//  Copyright © 2018 Nazarii Melnyk. All rights reserved.
//

import UIKit

class StoryViewController: ViewController {
    
    @IBOutlet private weak var textField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.text = ""
        DispatchQueue.main.async { [weak self] in
            self?.textField.text = Localizator.shared.localizedStrings?.story.title
        }
    }

}
