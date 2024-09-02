//
//  HouseSignUpStep4ViewController.swift
//  Apto91
//
//  Created by Henrique Alves Batochi on 01/09/24.
//

import UIKit

class HouseSignUpStep4ViewController: UIViewController {
    
    private let signUpStep4View = HouseSignUpStep4View()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.signUpBackground
        view.addSubview(signUpStep4View)
        
        setUpView()
    }
    
    private func setUpView() {
        NSLayoutConstraint.activate([
            signUpStep4View.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            signUpStep4View.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            signUpStep4View.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            signUpStep4View.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
