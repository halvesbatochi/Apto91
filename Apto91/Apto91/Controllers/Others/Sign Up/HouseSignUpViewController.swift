//
//  HouseSignUpViewController.swift
//  Apto91
//
//  Created by Henrique Alves Batochi on 22/06/24.
//

import UIKit

class HouseSignUpViewController: UIViewController {
    
    private let houseSignUpView = APHouseSignUpView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.signUpBackground
        
        view.addSubview(houseSignUpView)
        
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
