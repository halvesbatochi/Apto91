//
//  APHouseSignUpView.swift
//  Apto91
//
//  Created by Henrique Alves Batochi on 22/06/24.
//

import UIKit

class APHouseSignUpView: UIView {

    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.signUpBackground
        
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func addConstraints() {
        
    }
}
