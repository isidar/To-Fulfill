//
//  ViewController.swift
//  To Fulfill
//
//  Created by Nazarii Melnyk on 11/11/18.
//  Copyright © 2018 Nazarii Melnyk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    func show(_ vc: ViewControllerToShow) {
        TransitionManager.shared.show(vc, presentingVC: self)
    }
    
}
