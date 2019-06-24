//
//  LanguageSwitcherViewController.swift
//  To Fulfill
//
//  Created by Nazarii Melnyk on 6/15/19.
//  Copyright © 2019 Nazarii Melnyk. All rights reserved.
//

import UIKit

class LanguageSwitcherViewController: UIViewController {
    
    private let rowHeight: CGFloat = 30
    
    var dismissCompletion: (() -> Void)?
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        preferredContentSize = CGSize(width: 70, height: rowHeight * CGFloat(Localization.allCases.count))
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

}

extension LanguageSwitcherViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Localization.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LanguageTableViewCell", for: indexPath)
        
        let languageName = Localization.allCases[safe: indexPath.row]?.rawValue
        cell.textLabel?.text = languageName
        
        let isLastCell = indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1
        if isLastCell {
            cell.separatorInset = UIEdgeInsets(top: 0,
                                               left: 0,
                                               bottom: 0,
                                               right: .greatestFiniteMagnitude)
        }
        
        return cell
    }
    
}

extension LanguageSwitcherViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let language = Localization.allCases[safe: indexPath.row] else { return }
        Localizator.shared.setCurrentLocalization(to: language)
        
        presentingViewController?.dismiss(animated: true) { [weak self] in
            self?.dismissCompletion?()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }
    
}
