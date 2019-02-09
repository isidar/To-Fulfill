//
//  SpecialThanksViewController.swift
//  To Fulfill
//
//  Created by Nazarii Melnyk on 11/2/18.
//  Copyright © 2018 Nazarii Melnyk. All rights reserved.
//

import UIKit

class SpecialThanksViewController: ViewController {

    @IBOutlet private weak var thanksLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        thanksLabel.text = Localizator.shared.localizedStrings?.specialThanks.title
    }

}
