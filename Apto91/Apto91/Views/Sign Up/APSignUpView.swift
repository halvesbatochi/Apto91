//
//  APSignUpView.swift
//  Apto91
//
//  Created by Henrique Alves Batochi on 08/06/24.
//

import UIKit

class APSignUpView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Bem vindo!"
        label.font = .systemFont(ofSize: 30, weight: .medium)
        label.textColor = UIColor.signUpText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.text = "Escolha a opção para iniciar seu cadastro"
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textColor = UIColor.signUpText
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.signUpBackground
        
        self.addSubviews(titleLabel, 
                         messageLabel)
        
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 3),
            messageLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor, constant: 0),
            messageLabel.widthAnchor.constraint(equalToConstant: titleLabel.intrinsicContentSize.width + 10)
        ])
    }

}

#Preview {
    let vc = SignUpViewController()
    return vc
}
