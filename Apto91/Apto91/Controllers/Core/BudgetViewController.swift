//
//  APBudgetViewViewController.swift
//  Apto91
//
//  Created by Henrique Alves Batochi on 08/06/24.
//

import UIKit

class BudgetViewController: UIViewController {
    
    private let budgetView = APBudgetView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Orçamento"
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.systemGray]
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.systemGray]
        
        view.addSubview(budgetView)
        
        setUpView()
    }
    
    private func setUpView() {
        NSLayoutConstraint.activate([
            budgetView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            budgetView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            budgetView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            budgetView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
