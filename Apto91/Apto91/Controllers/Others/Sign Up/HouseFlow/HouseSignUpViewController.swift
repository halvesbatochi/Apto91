//
//  HouseSignUpViewController.swift
//  Apto91
//
//  Created by Henrique Alves Batochi on 22/06/24.
//

import UIKit

class HouseSignUpViewController: UIViewController {
    
    private let houseSignUpView = HouseSignUpView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.signUpBackground
        view.addSubview(houseSignUpView)
        houseSignUpView.delegate = self
        
        setUpView()
    }
    
    private func setUpView() {
        NSLayoutConstraint.activate([
            houseSignUpView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            houseSignUpView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            houseSignUpView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            houseSignUpView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension HouseSignUpViewController: HouseSignUpViewDelegate {
    func navigateToHouseSignUpStep2(_ sender: UIButton) {
        let vc = HouseSignUpStep2ViewController()
        vc.navigationController?.navigationBar.prefersLargeTitles = true
        vc.navigationItem.largeTitleDisplayMode = .always
        navigationController?.pushViewController(vc, animated: true)
    }
}
