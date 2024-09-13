//
//  ResidentSignUpStep2ViewController.swift
//  Apto91
//
//  Created by Henrique Alves Batochi on 13/09/24.
//

import UIKit

class ResidentSignUpStep2ViewController: UIViewController {
    
    private let residentSignUpStep2View = ResidentSignUpStep2View()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .signUpBackground
        view.addSubview(residentSignUpStep2View)
        
        residentSignUpStep2View.delegate = self
        
        setupView()

    }
    
    private func setupView() {
        NSLayoutConstraint.activate([
            residentSignUpStep2View.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            residentSignUpStep2View.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            residentSignUpStep2View.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            residentSignUpStep2View.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension ResidentSignUpStep2ViewController: ResidentSignUpStep2ViewDelegate {
    func navigateToResidentSignUpStep3(_ sender: UIButton) {
        print("Zucchini")
    }
    
    
}
