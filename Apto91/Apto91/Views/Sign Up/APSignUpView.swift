//
//  APSignUpView.swift
//  Apto91
//
//  Created by Henrique Alves Batochi on 08/06/24.
//

import UIKit

/// Interface to realy SignUp view events
protocol APSignUpViewDelegate: AnyObject {
    func navigateToHouseSignUpButton(_ sender: UIButton)
    func navigateToResidentSignUpButton(_ sender: UIButton)
}

final class APSignUpView: UIView {
    
    public weak var delegate: APSignUpViewDelegate?
    
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
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let residentButton: UIButton = {
        let button = UIButton()
        button.setTitle("Morador", for: .normal)
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
                         circleView,
                         residentButton,
                         houseButton)
        
        circleView.addSubview(logoView)
        
        addConstraints()
        setupButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func setupButtons() {
        self.houseButton.addTarget(self, action: #selector(self.houseClickedButton), for: .touchUpInside)
        self.residentButton.addTarget(self, action: #selector(self.residentClickedButton), for: .touchUpInside)
    }
    
    @objc private func houseClickedButton(_ sender: UIButton) {
        delegate?.navigateToHouseSignUpButton(sender)
    }
    
    @objc private func residentClickedButton(_ sender: UIButton) {
        delegate?.navigateToResidentSignUpButton(sender)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
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
            logoView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            residentButton.heightAnchor.constraint(equalToConstant: 60),
            residentButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            residentButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            residentButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            houseButton.heightAnchor.constraint(equalToConstant: 60),
            houseButton.leftAnchor.constraint(equalTo: residentButton.leftAnchor),
            houseButton.rightAnchor.constraint(equalTo: residentButton.rightAnchor),
            houseButton.bottomAnchor.constraint(equalTo: residentButton.topAnchor, constant: -10)
            
        ])
    }

}
