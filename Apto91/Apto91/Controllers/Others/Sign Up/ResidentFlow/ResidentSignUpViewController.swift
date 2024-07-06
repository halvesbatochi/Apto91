//
//  ResidentSignUpViewController.swift
//  Apto91
//
//  Created by Henrique Alves Batochi on 22/06/24.
//

import UIKit

class ResidentSignUpViewController: UIViewController {

    private let residentSignUpView = APResidentSignUpView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.signUpBackground
        
        view.addSubview(residentSignUpView)
        
        setUpView()
    }
    
    private func setUpView() {
        NSLayoutConstraint.activate([
            residentSignUpView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            residentSignUpView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            residentSignUpView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            residentSignUpView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
