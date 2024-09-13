//
//  ResidentSignUpStep2View.swift
//  Apto91
//
//  Created by Henrique Alves Batochi on 13/09/24.
//

import UIKit

/// Interface to realy ResidentSignUpStep2View view events
protocol ResidentSignUpStep2ViewDelegate: AnyObject {
    func navigateToResidentSignUpStep3(_ sender: UIButton)
}

class ResidentSignUpStep2View: UIView {
    
    public weak var delegate: ResidentSignUpStep2ViewDelegate?
    
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
        label.text = "Informe seus dados pessoais\npara cadastro"
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textColor = UIColor.signUpText
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let headerImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "HouseHeaderSignUp1")
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
    
    private let signUpScrollView: UIScrollView = {
        let view = UIScrollView()
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
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "Nome",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray])
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
    
    private let lastNameTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "Sobrenome",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray])
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
    
    private let cpfTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "CPF",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray])
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
                         sectionLabel,
                         signUpScrollView,
                         nextButton)
        
        signUpScrollView.addSubview(signUpScrollStackViewContainer)
        signUpScrollStackViewContainer.addArrangedSubview(nameTextField)
        signUpScrollStackViewContainer.addArrangedSubview(lastNameTextField)
        signUpScrollStackViewContainer.addArrangedSubview(cpfTextField)
        
        cpfTextField.delegate = self
        
        addConstraints()
        setUpButton()
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
        delegate?.navigateToResidentSignUpStep3(sender)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -(UIScreen.main.bounds.width / 2)),
            
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 3),
            messageLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor, constant: 0),
            messageLabel.widthAnchor.constraint(equalToConstant: titleLabel.intrinsicContentSize.width + 80),
            
            headerImage.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -15),
            headerImage.rightAnchor.constraint(equalTo: rightAnchor, constant: -5),
            headerImage.heightAnchor.constraint(equalToConstant: 112),
            headerImage.widthAnchor.constraint(equalToConstant: 149),
            
            sectionLabel.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 30),
            sectionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            signUpScrollView.topAnchor.constraint(equalTo: sectionLabel.bottomAnchor, constant: 5),
            signUpScrollView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            signUpScrollView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            signUpScrollView.heightAnchor.constraint(equalToConstant: 180),
            
            signUpScrollStackViewContainer.topAnchor.constraint(equalTo: signUpScrollView.topAnchor, constant: 5),
            signUpScrollStackViewContainer.leftAnchor.constraint(equalTo: signUpScrollView.leftAnchor, constant: 5),
            signUpScrollStackViewContainer.rightAnchor.constraint(equalTo: signUpScrollView.rightAnchor),
            signUpScrollStackViewContainer.bottomAnchor.constraint(equalTo: signUpScrollView.bottomAnchor),
            signUpScrollStackViewContainer.widthAnchor.constraint(equalTo: signUpScrollView.widthAnchor, constant: -10),
            
            nameTextField.heightAnchor.constraint(equalToConstant: 40),
            lastNameTextField.heightAnchor.constraint(equalToConstant: 40),
            cpfTextField.heightAnchor.constraint(equalToConstant: 40),
            
            nextButton.heightAnchor.constraint(equalToConstant: 50),
            nextButton.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 10),
            nextButton.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -10),
            nextButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
        ])
    }
}

extension ResidentSignUpStep2View: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        return true
    }
}
