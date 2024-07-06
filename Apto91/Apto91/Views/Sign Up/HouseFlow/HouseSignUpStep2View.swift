//
//  HouseSignUpStep2View.swift
//  Apto91
//
//  Created by Henrique Alves Batochi on 06/07/24.
//

import UIKit

class HouseSignUpStep2View: UIView {
    
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
        label.text = "Você será o responsável por\ninformar, gerir e aprovar as\ncontas da casa"
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
        label.text = "Dados de Login"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = UIColor.signUpText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let signUpScrollView: UIScrollView = {
        let view = UIScrollView()
        view.isScrollEnabled = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let signUpScrollStackViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.clearButtonMode = .whileEditing
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.textAlignment = .left
        textField.font = .systemFont(ofSize: 20)
        textField.backgroundColor = UIColor.signUpText
        textField.textColor = UIColor.apto91Text
        textField.alpha = 0.7
        textField.layer.cornerRadius = 3
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let loginTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Login"
        textField.clearButtonMode = .whileEditing
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.textAlignment = .left
        textField.font = .systemFont(ofSize: 20)
        textField.backgroundColor = UIColor.signUpText
        textField.textColor = UIColor.apto91Text
        textField.alpha = 0.7
        textField.layer.cornerRadius = 3
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Senha"
        textField.clearButtonMode = .whileEditing
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.textAlignment = .left
        textField.font = .systemFont(ofSize: 20)
        textField.backgroundColor = UIColor.signUpText
        textField.textColor = UIColor.apto91Text
        textField.alpha = 0.7
        textField.layer.cornerRadius = 3
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let confirmationPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Confirmação da senha"
        textField.clearButtonMode = .whileEditing
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.textAlignment = .left
        textField.font = .systemFont(ofSize: 20)
        textField.backgroundColor = UIColor.signUpText
        textField.textColor = UIColor.apto91Text
        textField.alpha = 0.7
        textField.layer.cornerRadius = 3
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Próximo", for: .normal)
        button.setTitleColor(UIColor.apto91Text, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
                         signUpScrollView,
                         nextButton)
        
        signUpScrollView.addSubview(signUpScrollStackViewContainer)
        signUpScrollStackViewContainer.addArrangedSubview(emailTextField)
        signUpScrollStackViewContainer.addArrangedSubview(loginTextField)
        signUpScrollStackViewContainer.addArrangedSubview(passwordTextField)
        signUpScrollStackViewContainer.addArrangedSubview(confirmationPasswordTextField)
        addConstraints()
        setUpButton()
        chooseConstraints(traitCollection: UIScreen.main.traitCollection)
        registerForTraitChanges(sizeTraits) {(self: Self, previousTraitCollection: UITraitCollection) in
            self.layoutTrait(traitCollection: UIScreen.main.traitCollection)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func chooseConstraints(traitCollection: UITraitCollection) {
        
        if traitCollection.verticalSizeClass == .regular &&
            traitCollection.horizontalSizeClass == .compact {
            NSLayoutConstraint.activate(sharedConstraints)
        } else if traitCollection.verticalSizeClass == .compact &&
                    traitCollection.horizontalSizeClass == .regular {
            NSLayoutConstraint.activate(compactConstraints)
        } else {
            signUpScrollView.isScrollEnabled = true
            NSLayoutConstraint.activate(regularConstraints)
        }
    }
    
    private func setUpButton() {}
    
    private func layoutTrait(traitCollection: UITraitCollection) {
        if (!sharedConstraints[0].isActive) {
            NSLayoutConstraint.deactivate(regularConstraints)
            NSLayoutConstraint.deactivate(compactConstraints)
            NSLayoutConstraint.deactivate(sharedConstraints)
            signUpScrollView.isScrollEnabled = false
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
            signUpScrollView.isScrollEnabled = true
            
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
            messageLabel.widthAnchor.constraint(equalToConstant: titleLabel.intrinsicContentSize.width + 60),
            
            headerImage.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -15),
            headerImage.rightAnchor.constraint(equalTo: rightAnchor, constant: -5),
            headerImage.heightAnchor.constraint(equalToConstant: 112),
            headerImage.widthAnchor.constraint(equalToConstant: 149),
            
            sectionLabel.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 30),
            sectionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            signUpScrollView.topAnchor.constraint(equalTo: sectionLabel.bottomAnchor, constant: 5),
            signUpScrollView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            signUpScrollView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            signUpScrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            signUpScrollStackViewContainer.topAnchor.constraint(equalTo: signUpScrollView.topAnchor, constant: 5),
            signUpScrollStackViewContainer.leftAnchor.constraint(equalTo: signUpScrollView.leftAnchor, constant: 5),
            signUpScrollStackViewContainer.rightAnchor.constraint(equalTo: signUpScrollView.rightAnchor),
            signUpScrollStackViewContainer.bottomAnchor.constraint(equalTo: signUpScrollView.bottomAnchor),
            signUpScrollStackViewContainer.widthAnchor.constraint(equalTo: signUpScrollView.widthAnchor, constant: -10),
            
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            loginTextField.heightAnchor.constraint(equalToConstant: 40),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            confirmationPasswordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            nextButton.heightAnchor.constraint(equalToConstant: 50),
            nextButton.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 10),
            nextButton.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -10),
            nextButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
        ])
        
        regularConstraints.append(contentsOf: [
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 3),
            messageLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor, constant: 0),
            messageLabel.widthAnchor.constraint(equalToConstant: titleLabel.intrinsicContentSize.width + 60),
            
            headerImage.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -15),
            headerImage.rightAnchor.constraint(equalTo: rightAnchor, constant: -5),
            headerImage.heightAnchor.constraint(equalToConstant: 90),
            headerImage.widthAnchor.constraint(equalToConstant: 120),
            
            sectionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            sectionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            signUpScrollView.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 5),
            signUpScrollView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            signUpScrollView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            signUpScrollView.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -10),
            
            signUpScrollStackViewContainer.topAnchor.constraint(equalTo: signUpScrollView.topAnchor, constant: 5),
            signUpScrollStackViewContainer.leftAnchor.constraint(equalTo: signUpScrollView.leftAnchor, constant: 5),
            signUpScrollStackViewContainer.rightAnchor.constraint(equalTo: signUpScrollView.rightAnchor),
            signUpScrollStackViewContainer.bottomAnchor.constraint(equalTo: signUpScrollView.bottomAnchor),
            signUpScrollStackViewContainer.widthAnchor.constraint(equalTo: signUpScrollView.widthAnchor, constant: -10),
            
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            loginTextField.heightAnchor.constraint(equalToConstant: 40),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            confirmationPasswordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            nextButton.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 10),
            nextButton.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -10),
            nextButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
        ])
        
        compactConstraints.append(contentsOf: [])
    }
}
