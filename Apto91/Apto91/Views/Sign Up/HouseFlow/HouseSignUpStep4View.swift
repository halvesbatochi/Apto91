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
    
    private var squareToken1Label: UILabel = {
        let label = UILabel()
        
        label.text = "A"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textColor = UIColor.systemGreen
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let squareToken2: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor(red: 217, green: 229, blue: 240, alpha: 1)
        view.layer.cornerRadius = 6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var squareToken2Label: UILabel = {
        let label = UILabel()
        
        label.text = "3"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textColor = UIColor.systemGreen
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let squareToken3: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor(red: 217, green: 229, blue: 240, alpha: 1)
        view.layer.cornerRadius = 6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var squareToken3Label: UILabel = {
        let label = UILabel()
        
        label.text = "X"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textColor = UIColor.systemGreen
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let squareToken4: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor(red: 217, green: 229, blue: 240, alpha: 1)
        view.layer.cornerRadius = 6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var squareToken4Label: UILabel = {
        let label = UILabel()
        
        label.text = "B"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textColor = UIColor.systemGreen
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let squareToken5: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor(red: 217, green: 229, blue: 240, alpha: 1)
        view.layer.cornerRadius = 6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var squareToken5Label: UILabel = {
        let label = UILabel()
        
        label.text = "5"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textColor = UIColor.systemGreen
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let squareToken6: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor(red: 217, green: 229, blue: 240, alpha: 1)
        view.layer.cornerRadius = 6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var squareToken6Label: UILabel = {
        let label = UILabel()
        
        label.text = "S"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textColor = UIColor.systemGreen
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var tokenStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [self.squareToken1, 
                                                   self.squareToken2,
                                                   self.squareToken3,
                                                   self.squareToken4,
                                                   self.squareToken5,
                                                   self.squareToken6,
                                                  ])
        
        stack.axis = .horizontal
        stack.spacing = 10.0
        stack.alignment = .center
        stack.distribution = .equalCentering
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
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
                         tokenStack)
        
        squareToken1.addSubview(squareToken1Label)
        squareToken2.addSubview(squareToken2Label)
        squareToken3.addSubview(squareToken3Label)
        squareToken4.addSubview(squareToken4Label)
        squareToken5.addSubview(squareToken5Label)
        squareToken6.addSubview(squareToken6Label)
        
        
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
            
            sectionLabel.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 80),
            sectionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            sectionMessageLabel.topAnchor.constraint(equalTo: sectionLabel.bottomAnchor, constant: 5),
            sectionMessageLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            tokenStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            tokenStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            squareToken1.widthAnchor.constraint(equalToConstant: 50),
            squareToken1.heightAnchor.constraint(equalToConstant: 70),
            
            squareToken1Label.centerXAnchor.constraint(equalTo: squareToken1.centerXAnchor),
            squareToken1Label.centerYAnchor.constraint(equalTo: squareToken1.centerYAnchor),
            
            squareToken2.widthAnchor.constraint(equalTo: squareToken1.widthAnchor),
            squareToken2.heightAnchor.constraint(equalTo: squareToken1.heightAnchor),
            
            squareToken2Label.centerXAnchor.constraint(equalTo: squareToken2.centerXAnchor),
            squareToken2Label.centerYAnchor.constraint(equalTo: squareToken2.centerYAnchor),
            
            squareToken3.widthAnchor.constraint(equalTo: squareToken1.widthAnchor),
            squareToken3.heightAnchor.constraint(equalTo: squareToken1.heightAnchor),
            
            squareToken3Label.centerXAnchor.constraint(equalTo: squareToken3.centerXAnchor),
            squareToken3Label.centerYAnchor.constraint(equalTo: squareToken3.centerYAnchor),
            
            squareToken4.widthAnchor.constraint(equalTo: squareToken1.widthAnchor),
            squareToken4.heightAnchor.constraint(equalTo: squareToken1.heightAnchor),
            
            squareToken4Label.centerXAnchor.constraint(equalTo: squareToken4.centerXAnchor),
            squareToken4Label.centerYAnchor.constraint(equalTo: squareToken4.centerYAnchor),
            
            squareToken5.widthAnchor.constraint(equalTo: squareToken1.widthAnchor),
            squareToken5.heightAnchor.constraint(equalTo: squareToken1.heightAnchor),
            
            squareToken5Label.centerXAnchor.constraint(equalTo: squareToken5.centerXAnchor),
            squareToken5Label.centerYAnchor.constraint(equalTo: squareToken5.centerYAnchor),
            
            squareToken6.widthAnchor.constraint(equalTo: squareToken1.widthAnchor),
            squareToken6.heightAnchor.constraint(equalTo: squareToken1.heightAnchor),
            
            squareToken6Label.centerXAnchor.constraint(equalTo: squareToken6.centerXAnchor),
            squareToken6Label.centerYAnchor.constraint(equalTo: squareToken6.centerYAnchor),
            
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

#Preview {
    let vc = HouseSignUpStep4ViewController()
    return vc
}
