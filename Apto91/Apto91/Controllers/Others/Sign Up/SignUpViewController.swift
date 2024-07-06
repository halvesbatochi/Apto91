//
//  APSignUpViewController.swift
//  Apto91
//
//  Created by Henrique Alves Batochi on 08/06/24.
//

import UIKit

class SignUpViewController: UIViewController {
    
    private let signUpView = SignUpView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUpView.delegate = self

        view.backgroundColor = UIColor.signUpBackground
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

/// APSignUpViewDelegate
extension SignUpViewController: SignUpViewDelegate {
    func navigateToHouseSignUpButton(_ sender: UIButton) {
        let vc = HouseSignUpViewController()
        vc.navigationController?.navigationBar.prefersLargeTitles = true
        vc.navigationItem.largeTitleDisplayMode = .always
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func navigateToResidentSignUpButton(_ sender: UIButton) {
        let vc = ResidentSignUpViewController()
        vc.navigationController?.navigationBar.prefersLargeTitles = true
        vc.navigationItem.largeTitleDisplayMode = .always
        navigationController?.pushViewController(vc, animated: true)
    }
}
