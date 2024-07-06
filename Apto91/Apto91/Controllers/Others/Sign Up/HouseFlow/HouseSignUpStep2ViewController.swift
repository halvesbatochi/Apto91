//
//  HouseSignUpStep2ViewController.swift
//  Apto91
//
//  Created by Henrique Alves Batochi on 06/07/24.
//

import UIKit

class HouseSignUpStep2ViewController: UIViewController {

    private let signUpStep2View = HouseSignUpStep2View()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.signUpBackground
        view.addSubview(signUpStep2View)
        
        setUpView()
    }
    
    private func setUpView() {
        NSLayoutConstraint.activate([
            signUpStep2View.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            signUpStep2View.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            signUpStep2View.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            signUpStep2View.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}
