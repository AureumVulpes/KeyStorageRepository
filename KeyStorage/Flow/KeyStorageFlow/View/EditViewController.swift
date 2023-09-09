//
//  EditView.swift
//  KeyStorage
//
//  Created by Дмитрий on 08.09.2023.
//

import UIKit

final class EditViewController: UIViewController {
    
    private let alertView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.7, green: 0.81, blue: 0.93, alpha: 1.0)
        view.layer.cornerRadius = 25
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(red: 0.5, green: 0.61, blue: 0.93, alpha: 1.0).cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let platformLabel = LazyLabel(color: .clearBackground)
    private let loginTextField = LazyTextField(title: "Логин")
    private let passwordTextField = LazyTextField(title: "Пароль")
    
    private let saveButton: LazyButton = {
        let button = LazyButton(title: "Сохранить", color: .blue)
        button.layer.cornerRadius = 20
        return button
    }()
    
    private let cancelButton: LazyButton = {
        let button = LazyButton(title: "Отмена", color: .blue)
        button.layer.cornerRadius = 20
        return button
    }()
    
    private let presenter: KeyStoragePresenterProtocol
    
    init(presenter: KeyStoragePresenterProtocol, platform:String, login: String, password: String) {
        self.presenter = presenter
        self.platformLabel.text = platform
        self.loginTextField.text = login
        self.passwordTextField.text = password
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitials()
    }
    
    private func setupInitials() {
        view.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.4)
        view.addSubview(alertView)
        
        view.addSubview(platformLabel)
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        
        view.addSubview(saveButton)
        saveButton.addTarget(self, action: #selector(updateProfile), for: .touchUpInside)
        view.addSubview(cancelButton)
        cancelButton.addTarget(self, action: #selector(dismissEditView), for: .touchUpInside)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            alertView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            alertView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            alertView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            alertView.heightAnchor.constraint(equalToConstant: 660),

            platformLabel.topAnchor.constraint(equalTo: alertView.topAnchor, constant: 13),
            platformLabel.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 4),
            platformLabel.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -4),
            platformLabel.heightAnchor.constraint(equalToConstant: 48),
            
            loginTextField.topAnchor.constraint(equalTo: platformLabel.bottomAnchor, constant: 13),
            loginTextField.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 4),
            loginTextField.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -4),
            loginTextField.heightAnchor.constraint(equalToConstant: 48),
            
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 13),
            passwordTextField.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 4),
            passwordTextField.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -4),
            passwordTextField.heightAnchor.constraint(equalToConstant: 48),
            
            saveButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 13),
            saveButton.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 4),
            saveButton.trailingAnchor.constraint(equalTo: alertView.centerXAnchor, constant: -3),
            saveButton.bottomAnchor.constraint(equalTo: alertView.bottomAnchor, constant: -13),
            saveButton.heightAnchor.constraint(equalToConstant: 40),
            
            cancelButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 13),
            cancelButton.leadingAnchor.constraint(equalTo: alertView.centerXAnchor, constant: 3),
            cancelButton.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -4),
            cancelButton.bottomAnchor.constraint(equalTo: alertView.bottomAnchor, constant: -13),
            cancelButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc private func dismissEditView() {
        presenter.dismissEditView()
    }
    
    @objc private func updateProfile() {
        presenter.saveAndDismiddEditView(platform: platformLabel.text!, login: loginTextField.text!, password: passwordTextField.text!)
    }
    
}
