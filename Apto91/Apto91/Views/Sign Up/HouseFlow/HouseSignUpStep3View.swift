//
//  HouseSignUpStep3View.swift
//  Apto91
//
//  Created by Henrique Alves Batochi on 06/07/24.
//

import UIKit

/// Interface to realy HouseSignUpStep3 view events
protocol HouseSignUpStep3ViewDelegate: AnyObject {
    func navigateToHouseSignUpStep4(_ sender: UIButton)
}

class HouseSignUpStep3View: UIView {
    
    public weak var delegate: HouseSignUpStep3ViewDelegate?

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
        label.text = "Forneça um nome para\na residência"
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textColor = UIColor.signUpText
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let headerImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "HouseHeaderSignUp3")
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let sectionLabel: UILabel = {
        let label = UILabel()
        label.text = "Residência"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = UIColor.signUpText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let houseNameTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "Nome da casa",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray])
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
        button.setTitleColor(UIColor.signUpText, for: .highlighted)
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
                         houseNameTextField,
                         nextButton)
        
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        endEditing(true)
    }
    
    private func setUpButton() {
        self.nextButton.addTarget(self,
                                  action: #selector(self.nextClickedButton),
                                  for: .touchUpInside)
    }
    
    @objc
    private func nextClickedButton(_ sender: UIButton) {
        delegate?.navigateToHouseSignUpStep4(sender)
    }
    
    private func chooseConstraints(traitCollection: UITraitCollection) {
        
        if traitCollection.verticalSizeClass == .regular &&
           traitCollection.horizontalSizeClass == .compact {
            NSLayoutConstraint.activate(sharedConstraints)
        } else if traitCollection.verticalSizeClass == .compact &&
                  traitCollection.horizontalSizeClass == .regular {
            NSLayoutConstraint.activate(compactConstraints)
        } else {
            NSLayoutConstraint.activate(regularConstraints)
        }
    }
    
    private func layoutTrait(traitCollection: UITraitCollection) {
        if (!sharedConstraints[0].isActive) {
            NSLayoutConstraint.deactivate(regularConstraints)
            NSLayoutConstraint.deactivate(compactConstraints)
            NSLayoutConstraint.deactivate(sharedConstraints)
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
            
            headerImage.topAnchor.constraint(equalTo: titleLabel.topAnchor),
            headerImage.rightAnchor.constraint(equalTo: rightAnchor, constant: -5),
            headerImage.heightAnchor.constraint(equalToConstant: 90),
            headerImage.widthAnchor.constraint(equalToConstant: 150),
            
            sectionLabel.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 50),
            sectionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            houseNameTextField.centerYAnchor.constraint(equalTo: centerYAnchor),
            houseNameTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            houseNameTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            houseNameTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            houseNameTextField.heightAnchor.constraint(equalToConstant: 40),
            
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
            
            headerImage.topAnchor.constraint(equalTo: titleLabel.topAnchor),
            headerImage.rightAnchor.constraint(equalTo: rightAnchor, constant: -5),
            headerImage.heightAnchor.constraint(equalToConstant: 90),
            headerImage.widthAnchor.constraint(equalToConstant: 130),
            
            sectionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            sectionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            houseNameTextField.centerYAnchor.constraint(equalTo: centerYAnchor),
            houseNameTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            houseNameTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            houseNameTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            houseNameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            nextButton.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 10),
            nextButton.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -10),
            nextButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
        ])
        
        compactConstraints.append(contentsOf: [])
    }
}
