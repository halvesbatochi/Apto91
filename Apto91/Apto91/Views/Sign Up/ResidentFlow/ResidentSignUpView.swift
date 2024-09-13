//
//  APResidentSignUpView.swift
//  Apto91
//
//  Created by Henrique Alves Batochi on 22/06/24.
//

import UIKit

/// Interface to relay ResidentSignUpStep view events
protocol ResidentSignUpViewDelegate: AnyObject {
    func navigateToResidentSignUpStep2(_ sender: UIButton)
}

class ResidentSignUpView: UIView {
    
    public weak var delegate:ResidentSignUpViewDelegate?
    
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
        label.text = "Informe o código da moradia\npara iniciar o seu processo\nde vinculação"
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
    
    private let sectionMessageLabel: UILabel = {
        let label = UILabel()
        label.text = "Forneça o Token de cadastro\nda Residência"
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
        backgroundColor = .signUpBackground
        
        self.addSubviews(titleLabel,
                         messageLabel,
                         headerImage,
                         sectionMessageLabel,
                         tokenStack,
                         nextButton)
        
        squareToken1.addSubview(squareToken1Label)
        squareToken2.addSubview(squareToken2Label)
        squareToken3.addSubview(squareToken3Label)
        squareToken4.addSubview(squareToken4Label)
        squareToken5.addSubview(squareToken5Label)
        squareToken6.addSubview(squareToken6Label)
        
        addConstraints()
        setUpButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func setUpButton() {
        self.nextButton.addTarget(self,
                                  action: #selector(self.nextClickedButton),
                                  for: .touchUpInside)
    }
    
    @objc
    private func nextClickedButton(_ sender: UIButton) {
        delegate?.navigateToResidentSignUpStep2(sender)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
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
            
            tokenStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            tokenStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            sectionMessageLabel.bottomAnchor.constraint(equalTo: tokenStack.topAnchor, constant: -40),
            sectionMessageLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
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
            
            nextButton.heightAnchor.constraint(equalToConstant: 50),
            nextButton.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 10),
            nextButton.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -10),
            nextButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
        ])
    }

}
