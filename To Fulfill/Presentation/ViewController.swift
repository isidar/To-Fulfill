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
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        view.backgroundColor = .background
    }
    
    func show(_ vc: ViewControllerToShow, configure: ((UIViewController) -> Void)? = nil) {
        TransitionManager.shared.show(vc, presentingVC: self, configure: configure)
    }
    
}

// Colors: #bfffc0 #ace3cf
