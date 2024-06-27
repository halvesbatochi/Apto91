//
//  APHouseSignUpView.swift
//  Apto91
//
//  Created by Henrique Alves Batochi on 22/06/24.
//

import UIKit

class APHouseSignUpView: UIView {

    private let sizeTraits: [UITrait] = [UITraitVerticalSizeClass.self, UITraitHorizontalSizeClass.self]
    private var compactConstraints: [NSLayoutConstraint] = []
    private var regularConstraints: [NSLayoutConstraint] = []
    private var sharedConstraints: [NSLayoutConstraint] = []
    
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
    
    private let headerImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "HouseHeaderSignIn1")
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let sectionLabel: UILabel = {
        let label = UILabel()
        label.text = "Dados Pessoais"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = UIColor.signUpText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let signScrollView: UIScrollView = {
        let view = UIScrollView()
        view.isScrollEnabled = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let signScrollStackViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let nameTextFiel: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Nome"
        textField.textContentType = .givenName
        textField.clearButtonMode = .whileEditing
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .words
        textField.textAlignment = .left
        textField.font = .systemFont(ofSize: 20)
        textField.backgroundColor = UIColor.signUpText
        textField.textColor = UIColor.apto91Text
        textField.alpha = 0.7
        textField.layer.cornerRadius = 3
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let lastNameTextFiel: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Sobrenome"
        textField.textContentType = .familyName
        textField.clearButtonMode = .whileEditing
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .words
        textField.textAlignment = .left
        textField.font = .systemFont(ofSize: 20)
        textField.backgroundColor = UIColor.signUpText
        textField.textColor = UIColor.apto91Text
        textField.alpha = 0.7
        textField.layer.cornerRadius = 3
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let cpfTextFiel: UITextField = {
        let textField = UITextField()
        textField.placeholder = "CPF"
        textField.clearButtonMode = .whileEditing
        textField.autocorrectionType = .no
        textField.textAlignment = .left
        textField.keyboardType = .numberPad
        textField.font = .systemFont(ofSize: 20)
        textField.backgroundColor = UIColor.signUpText
        textField.textColor = UIColor.apto91Text
        textField.alpha = 0.7
        textField.layer.cornerRadius = 3
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.signUpBackground
        
        self.addSubviews(titleLabel,
                         messageLabel,
                         headerImage,
                         sectionLabel, 
                         signScrollView)
        
        signScrollView.addSubview(signScrollStackViewContainer)
        signScrollStackViewContainer.addArrangedSubview(nameTextFiel)
        signScrollStackViewContainer.addArrangedSubview(lastNameTextFiel)
        signScrollStackViewContainer.addArrangedSubview(cpfTextFiel)
        
        cpfTextFiel.delegate = self
        
        addConstraints()
        chooseConstraints(traitCollection: UIScreen.main.traitCollection)
                
        registerForTraitChanges(sizeTraits) {(self: Self, previousTraitCollection: UITraitCollection) in
            self.layoutTrait(traitCollection: UIScreen.main.traitCollection)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    func chooseConstraints(traitCollection: UITraitCollection) {
        
        if traitCollection.verticalSizeClass == .regular &&
            traitCollection.horizontalSizeClass == .compact {
            NSLayoutConstraint.activate(sharedConstraints)
        } else if traitCollection.verticalSizeClass == .compact &&
                    traitCollection.horizontalSizeClass == .regular {
            NSLayoutConstraint.activate(compactConstraints)
        } else {
            signScrollView.isScrollEnabled = true
            NSLayoutConstraint.activate(regularConstraints)
        }
    }
    
    func layoutTrait(traitCollection: UITraitCollection) {
        if (!sharedConstraints[0].isActive) {
            NSLayoutConstraint.deactivate(regularConstraints)
            NSLayoutConstraint.deactivate(compactConstraints)
            NSLayoutConstraint.deactivate(sharedConstraints)
            signScrollView.isScrollEnabled = false
            NSLayoutConstraint.activate(sharedConstraints)
            
        } else if traitCollection.horizontalSizeClass == .compact &&
            traitCollection.verticalSizeClass == .regular {
            
            NSLayoutConstraint.deactivate(sharedConstraints)
            
            if regularConstraints.count > 0 && regularConstraints[0].isActive {
                NSLayoutConstraint.deactivate(regularConstraints)
            }
            NSLayoutConstraint.activate(compactConstraints)
            
        } else {
            
            NSLayoutConstraint.deactivate(sharedConstraints)
            signScrollView.isScrollEnabled = true
            
            if compactConstraints.count > 0 && compactConstraints[0].isActive {
                NSLayoutConstraint.deactivate(compactConstraints)
            }
            NSLayoutConstraint.activate(regularConstraints)
        }
    }
    
    private func addConstraints() {
        
        sharedConstraints.append(contentsOf: [
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -(UIScreen.main.bounds.width / 2)),
            
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 3),
            messageLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor, constant: 0),
            messageLabel.widthAnchor.constraint(equalToConstant: titleLabel.intrinsicContentSize.width + 10),
            
            headerImage.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -15),
            headerImage.rightAnchor.constraint(equalTo: rightAnchor, constant: -5),
            headerImage.heightAnchor.constraint(equalToConstant: 112),
            headerImage.widthAnchor.constraint(equalToConstant: 149),
            
            sectionLabel.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 30),
            sectionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            signScrollView.topAnchor.constraint(equalTo: sectionLabel.bottomAnchor, constant: 5),
            signScrollView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            signScrollView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            signScrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            signScrollStackViewContainer.topAnchor.constraint(equalTo: signScrollView.topAnchor, constant: 5),
            signScrollStackViewContainer.leftAnchor.constraint(equalTo: signScrollView.leftAnchor, constant: 5),
            signScrollStackViewContainer.rightAnchor.constraint(equalTo: signScrollView.rightAnchor),
            signScrollStackViewContainer.bottomAnchor.constraint(equalTo: signScrollView.bottomAnchor),
            signScrollStackViewContainer.widthAnchor.constraint(equalTo: signScrollView.widthAnchor, constant: -10),
            
            nameTextFiel.heightAnchor.constraint(equalToConstant: 40),
            lastNameTextFiel.heightAnchor.constraint(equalToConstant: 40),
            cpfTextFiel.heightAnchor.constraint(equalToConstant: 40),
        ])
        
        regularConstraints.append(contentsOf: [
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 3),
            messageLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor, constant: 0),
            messageLabel.widthAnchor.constraint(equalToConstant: titleLabel.intrinsicContentSize.width + 10),
            
            headerImage.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -15),
            headerImage.rightAnchor.constraint(equalTo: rightAnchor, constant: -5),
            headerImage.heightAnchor.constraint(equalToConstant: 90),
            headerImage.widthAnchor.constraint(equalToConstant: 120),
            
            sectionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            sectionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            signScrollView.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 5),
            signScrollView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            signScrollView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            signScrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            signScrollStackViewContainer.topAnchor.constraint(equalTo: signScrollView.topAnchor, constant: 5),
            signScrollStackViewContainer.leftAnchor.constraint(equalTo: signScrollView.leftAnchor, constant: 5),
            signScrollStackViewContainer.rightAnchor.constraint(equalTo: signScrollView.rightAnchor),
            signScrollStackViewContainer.bottomAnchor.constraint(equalTo: signScrollView.bottomAnchor),
            signScrollStackViewContainer.widthAnchor.constraint(equalTo: signScrollView.widthAnchor, constant: -10),
            
            nameTextFiel.heightAnchor.constraint(equalToConstant: 40),
            lastNameTextFiel.heightAnchor.constraint(equalToConstant: 40),
            cpfTextFiel.heightAnchor.constraint(equalToConstant: 40),
        ])
        
        compactConstraints.append(contentsOf: [])
    }
}

extension APHouseSignUpView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        return true
    }
}
