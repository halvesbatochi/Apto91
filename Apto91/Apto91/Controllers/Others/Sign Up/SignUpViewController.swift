//
//  APSignUpViewController.swift
//  Apto91
//
//  Created by Henrique Alves Batochi on 08/06/24.
//

import UIKit

class SignUpViewController: UIViewController {
    
    private let signUpView = APSignUpView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Sign Up"
        
        self.navigationItem.largeTitleDisplayMode = .always
        
        view.backgroundColor = UIColor.signUpBackground
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.systemGray]
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.systemGray]
        
        view.addSubview(signUpView)
        
        setUpView()
    }
    
    private func setUpView() {
        NSLayoutConstraint.activate([
            signUpView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            signUpView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            signUpView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            signUpView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
