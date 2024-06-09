//
//  SharedItensViewController.swift
//  Apto91
//
//  Created by Henrique Alves Batochi on 08/06/24.
//

import UIKit

class SharedItensViewController: UIViewController {
    
    private let sharedItensView = APSharedItensView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Compartilhado"
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.systemGray]
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.systemGray]
        
        view.addSubview(sharedItensView)
        
        setUpView()
    }

    private func setUpView() {
        NSLayoutConstraint.activate([
            sharedItensView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            sharedItensView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            sharedItensView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            sharedItensView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
