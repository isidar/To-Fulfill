//
//  MainViewController.swift
//  To Fulfill
//
//  Created by Nazarii Melnyk on 11/2/18.
//  Copyright © 2018 Nazarii Melnyk. All rights reserved.
//

import UIKit

class MainViewController: ViewController {
    
    private let localizedStrings = Localizator.shared.localizedStrings?.main
    
    @IBOutlet private weak var logoItemsStackView: UIStackView!
    @IBOutlet private weak var curvedLineView: CurvedLineView!
    @IBOutlet private weak var menuTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showViewsWithAnimation()
    }
    
    private func showViewsWithAnimation() {
        logoItemsStackView.alpha = 0
        curvedLineView.alpha = 0
        menuTableView.alpha = 0
        
        UIView.animate(withDuration: 1) {
            self.logoItemsStackView.alpha = 1
            self.curvedLineView.alpha = 1
            self.menuTableView.alpha = 1
        }
    }
    
}

// MARK: - TableView DataSource methods
extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "navigationCell", for: indexPath) as? MenuTableViewCell else {
            return UITableViewCell()
        }
        
        switch indexPath.row {
        case 0:
            cell.type = .conversation
        case 1:
            cell.type = .story
        case 2:
            cell.type = .specialThanks
        default: break
        }
        
        return cell
    }
    
}

// MARK: - TableView Delegate methods
extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let selectedCell = tableView.cellForRow(at: indexPath) as? MenuTableViewCell,
              let vcToShow = ViewControllerToShow(rawValue: "\(selectedCell.type)") else { return }
        show(vcToShow) { $0.navigationItem.title = selectedCell.title.text }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / CGFloat(tableView.numberOfRows(inSection: 0))
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0
        UIView.animate(
            withDuration: 0.9,
            delay: 0.35 * Double(indexPath.row),
            animations: {
                cell.alpha = 1
        })
    }

}
