//
//  mainAggregateView.swift
//  KeyStorage
//
//  Created by Дмитрий on 05.09.2023.
//

import UIKit

final class MainAggregateView: UIView {
    
    private let platformLabel = LazyLabel(color: .lightBlue)
    private let loginLabel = LazyLabel(color: .lightBlue)
    private let passwordLabel = LazyLabel(color: .lightBlue)
    
    init() {
        super.init(frame: .zero)
        setupInitials()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupInitials() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(platformLabel)
        addSubview(loginLabel)
        addSubview(passwordLabel)
        setupConstraints()
    }
    
    func prepareForReuse() {
        platformLabel.text = nil
        loginLabel.text = nil
        passwordLabel.text = nil
    }
    
    func configure(platformText: String, loginText: String, passwordText: String) {
        platformLabel.text = "  " + platformText
        loginLabel.text = "  " + loginText
        passwordLabel.text = "  " + passwordText
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            platformLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            platformLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7),
            platformLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -7),
            platformLabel.heightAnchor.constraint(equalToConstant: 48),
            
            loginLabel.topAnchor.constraint(equalTo: platformLabel.bottomAnchor, constant: 5),
            loginLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7),
            loginLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -7),
            loginLabel.heightAnchor.constraint(equalToConstant: 48),
            
            passwordLabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 5),
            passwordLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7),
            passwordLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -7),
            passwordLabel.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -10),
            passwordLabel.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}
