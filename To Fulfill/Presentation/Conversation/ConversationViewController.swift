//
//  ConversationViewController.swift
//  To Fulfill
//
//  Created by Nazarii Melnyk on 11/12/18.
//  Copyright © 2018 Nazarii Melnyk. All rights reserved.
//

import UIKit

class ConversationViewController: ViewController {
    
    private let localizedStrings = Localizator.shared.localizedStrings?.conversation

    @IBOutlet private weak var contentStackView: UIStackView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var separatorView: CurvedLineView!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var readyButton: NavigationButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    
    private func setupSubviews() {
        tableView.alpha = 0
        readyButton.navigationState = .weAreReady
        descriptionLabel.text = localizedStrings?.ui.descriptionLabel.intro
    }
    
    @IBAction private func readyClick(_ sender: UIButton) {
        descriptionLabel.alpha = 0
        descriptionLabel.text = localizedStrings?.ui.descriptionLabel.topicsTip
        separatorView.alpha = 0
        separatorView.isHidden = false
        readyButton.isHidden = true
        
        // TODO: – Try batch update instead of consistent calls
        
        let separatorAnimation: (Bool) -> Void = { [weak self] _ in
            UIView.animate(withDuration: 0.3) {
                self?.separatorView.alpha = 1
            }
        }
        let descriptionAnimation: (Bool) -> Void = { [weak self] _ in
            UIView.animate(withDuration: 0.6, animations: {
                self?.descriptionLabel.alpha = 1
            }, completion: separatorAnimation)
        }
        
        UIView.animate(withDuration: 0.5, animations: {
            self.tableView.isHidden = false
            self.tableView.alpha = 1
            self.contentStackView.layoutIfNeeded()
        }, completion: descriptionAnimation)
    }
    
}

extension ConversationViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return localizedStrings?.questions.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "questionsTopic", for: indexPath)
        let questionObject = localizedStrings?.questions[safe: indexPath.row]
        cell.textLabel?.text = questionObject?.topicHeader ?? ""
        return cell
    }
    
}

extension ConversationViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let cell = tableView.cellForRow(at: indexPath)
        guard let questionsTopic = cell?.textLabel?.text else { return }
        
        show(.questions) {
            ($0 as? QuestionsViewController)?.questionsTopic = questionsTopic
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let numberOfTopics = localizedStrings?.questions.count,
              numberOfTopics != 0 else { return 0 }
        return tableView.frame.height / CGFloat(numberOfTopics)
    }
    
}
