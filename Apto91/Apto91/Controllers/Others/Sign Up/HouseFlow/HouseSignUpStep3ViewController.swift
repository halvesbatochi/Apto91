//
//  HouseSignUpStep3ViewController.swift
//  Apto91
//
//  Created by Henrique Alves Batochi on 06/07/24.
//

import UIKit

class HouseSignUpStep3ViewController: UIViewController {
    
    private let signUpStep3View = HouseSignUpStep3View()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.signUpBackground
        view.addSubview(signUpStep3View)

        signUpStep3View.delegate = self
        
        setUpView()
    }
    
    private func setUpView() {
        NSLayoutConstraint.activate([
            signUpStep3View.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            signUpStep3View.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            signUpStep3View.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            signUpStep3View.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension HouseSignUpStep3ViewController: HouseSignUpStep3ViewDelegate {
    func navigateToHouseSignUpStep4(_ sender: UIButton) {
        let vc = HouseSignUpStep4ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
