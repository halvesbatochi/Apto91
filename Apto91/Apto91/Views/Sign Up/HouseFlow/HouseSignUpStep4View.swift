//
//  HouseSignUpStep4View.swift
//  Apto91
//
//  Created by Henrique Alves Batochi on 01/09/24.
//

import UIKit

class HouseSignUpStep4View: UIView {
    
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
        image.image = UIImage(named: "HouseHeaderSignUp4")
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let sectionLabel: UILabel = {
        let label = UILabel()
        label.text = "Token Residência"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = UIColor.signUpText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let sectionMessageLabel: UILabel = {
        let label = UILabel()
        label.text = "Forneça o Token aos demais\nmoradores para se vincularem\na esta residência"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textColor = UIColor.signUpText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let squareToken1: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor(red: 217, green: 229, blue: 240, alpha: 1)
        view.layer.cornerRadius = 6
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let squareToken1Label: UILabel = {
        let label = UILabel()
        label.text = "A"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textColor = UIColor.systemGreen
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
                         sectionMessageLabel,
                         squareToken1)
        
        squareToken1.addSubview(squareToken1Label)
        
        addConstraints()
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
            headerImage.heightAnchor.constraint(equalToConstant: 110),
            headerImage.widthAnchor.constraint(equalToConstant: 150),
            
            sectionLabel.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 50),
            sectionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            sectionMessageLabel.topAnchor.constraint(equalTo: sectionLabel.bottomAnchor, constant: 5),
            sectionMessageLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            squareToken1.centerXAnchor.constraint(equalTo: centerXAnchor),
            squareToken1.centerYAnchor.constraint(equalTo: centerYAnchor),
            squareToken1.widthAnchor.constraint(equalToConstant: 60),
            squareToken1.heightAnchor.constraint(equalToConstant: 80),
            
            squareToken1Label.centerXAnchor.constraint(equalTo: squareToken1.centerXAnchor),
            squareToken1Label.centerYAnchor.constraint(equalTo: squareToken1.centerYAnchor),
            
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
            
            sectionMessageLabel.topAnchor.constraint(equalTo: sectionLabel.bottomAnchor, constant: 5),
            sectionMessageLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            
        ])
        
        compactConstraints.append(contentsOf: [])
    }
}
