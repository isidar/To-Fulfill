//
//  SpecialThanksViewController.swift
//  To Fulfill
//
//  Created by Nazarii Melnyk on 11/2/18.
//  Copyright © 2018 Nazarii Melnyk. All rights reserved.
//

import UIKit

class SpecialThanksViewController: ViewController {

    @IBOutlet private weak var authorTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authorTextView.text = ""
        DispatchQueue.main.async { [weak self] in // need to investigate why it works
            self?.authorTextView.text = Localizator.shared.localizedStrings?.specialThanks.title
        }
    }

}
