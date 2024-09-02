//
//  APSignUpView.swift
//  Apto91
//
//  Created by Henrique Alves Batochi on 08/06/24.
//

import UIKit

/// Interface to realy SignUp view events
protocol SignUpViewDelegate: AnyObject {
    func navigateToHouseSignUpButton(_ sender: UIButton)
    func navigateToResidentSignUpButton(_ sender: UIButton)
}

final class SignUpView: UIView {
    
    public weak var delegate: SignUpViewDelegate?
    
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
    
    private let circleView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 150
        view.layer.shadowColor = UIColor.white.cgColor
        view.layer.shadowOpacity = 1.0
        view.layer.shadowRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let logoView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Logo")
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let houseButton: UIButton = {
        let button = UIButton()
        button.setTitle("Moradia", for: .normal)
        button.setTitleColor(UIColor.apto91Text, for: .normal)
        button.setTitleColor(UIColor.signUpText, for: .highlighted)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let residentButton: UIButton = {
        let button = UIButton()
        button.setTitle("Morador", for: .normal)
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
                         circleView,
                         residentButton,
                         houseButton)
        
        circleView.addSubview(logoView)
        
        addConstraints()
        setUpButtons()
        
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
            NSLayoutConstraint.activate(regularConstraints)
        }
    }
    
    private func setUpButtons() {
        self.houseButton.addTarget(self, action: #selector(self.houseClickedButton), for: .touchUpInside)
        self.residentButton.addTarget(self, action: #selector(self.residentClickedButton), for: .touchUpInside)
    }
    
    @objc private func houseClickedButton(_ sender: UIButton) {
        delegate?.navigateToHouseSignUpButton(sender)
    }
    
    @objc private func residentClickedButton(_ sender: UIButton) {
        delegate?.navigateToResidentSignUpButton(sender)
    }
    
    func layoutTrait(traitCollection: UITraitCollection) {
        if (!sharedConstraints[0].isActive) {
            NSLayoutConstraint.deactivate(regularConstraints)
            NSLayoutConstraint.deactivate(compactConstraints)
            
            circleView.layer.cornerRadius = 150
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
            circleView.layer.cornerRadius = 60
            NSLayoutConstraint.activate(regularConstraints)
        }
    }
    
    private func addConstraints() {
        
        sharedConstraints.append(contentsOf: [
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 3),
            messageLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor, constant: 0),
            messageLabel.widthAnchor.constraint(equalToConstant: titleLabel.intrinsicContentSize.width + 10),
            
            circleView.heightAnchor.constraint(equalToConstant: 290),
            circleView.widthAnchor.constraint(equalToConstant: 290),
            circleView.centerXAnchor.constraint(equalTo: centerXAnchor),
            circleView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            logoView.heightAnchor.constraint(equalToConstant: 120),
            logoView.widthAnchor.constraint(equalToConstant: 130),
            logoView.centerXAnchor.constraint(equalTo: circleView.centerXAnchor),
            logoView.centerYAnchor.constraint(equalTo: circleView.centerYAnchor),
            
            residentButton.heightAnchor.constraint(equalToConstant: 50),
            residentButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            residentButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            residentButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            houseButton.heightAnchor.constraint(equalToConstant: 50),
            houseButton.leftAnchor.constraint(equalTo: residentButton.leftAnchor),
            houseButton.rightAnchor.constraint(equalTo: residentButton.rightAnchor),
            houseButton.bottomAnchor.constraint(equalTo: residentButton.topAnchor, constant: -10)
        ])
        
        regularConstraints.append(contentsOf: [
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 3),
            messageLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor, constant: 0),
            messageLabel.widthAnchor.constraint(equalToConstant: titleLabel.intrinsicContentSize.width + 10),
            
            circleView.topAnchor.constraint(equalTo: titleLabel.topAnchor),
            circleView.rightAnchor.constraint(equalTo: rightAnchor,constant: -10),
            circleView.heightAnchor.constraint(equalToConstant: 120),
            circleView.widthAnchor.constraint(equalToConstant: 120),
            
            logoView.heightAnchor.constraint(equalToConstant: 70),
            logoView.widthAnchor.constraint(equalToConstant: 80),
            logoView.centerXAnchor.constraint(equalTo: circleView.centerXAnchor),
            logoView.centerYAnchor.constraint(equalTo: circleView.centerYAnchor),
            
            residentButton.heightAnchor.constraint(equalToConstant: 40),
            residentButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            residentButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            residentButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            houseButton.heightAnchor.constraint(equalToConstant: 40),
            houseButton.leftAnchor.constraint(equalTo: residentButton.leftAnchor),
            houseButton.rightAnchor.constraint(equalTo: residentButton.rightAnchor),
            houseButton.bottomAnchor.constraint(equalTo: residentButton.topAnchor, constant: -10)
        ])
        
        compactConstraints.append(contentsOf: sharedConstraints)
    }
}
