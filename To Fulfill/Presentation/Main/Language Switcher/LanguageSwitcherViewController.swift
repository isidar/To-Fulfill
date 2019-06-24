//
//  LanguageSwitcherViewController.swift
//  To Fulfill
//
//  Created by Nazarii Melnyk on 6/15/19.
//  Copyright © 2019 Nazarii Melnyk. All rights reserved.
//

import UIKit

class LanguageSwitcherViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        preferredContentSize = CGSize(width: 100, height: 100)
    }

}

extension LanguageSwitcherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension LanguageSwitcherViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        return
    }
}
