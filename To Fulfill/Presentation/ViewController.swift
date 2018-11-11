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
        
        view.backgroundColor = UIColor(hexString: "#bfffc0")
//        view.backgroundColor = UIColor(hexString: "#ace3cf")
    }
    
    func show(_ vc: ViewControllerToShow) {
        TransitionManager.shared.show(vc, presentingVC: self)
    }
    
}

// Цвета: #bfffc0 #ace3cf
// Шрифт: Rage Italic, Open San
