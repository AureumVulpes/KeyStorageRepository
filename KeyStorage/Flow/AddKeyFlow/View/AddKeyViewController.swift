//
//  AddKeyViewController.swift
//  KeyStorage
//
//  Created by Дмитрий on 31.08.2023.
//

import UIKit

protocol AddKeyViewProtocol: AnyObject {}

final class AddKeyViewController: UIViewController {
    
    private let presenter: AddKeyPresenterProtocol
    
    private let platformTextField = LazyTextField(title: "Платформа")
    private let loginTextField = LazyTextField(title: "Логин")
    private let passwordTextField = LazyTextField(title: "Пароль")
    private let saveButton: LazyButton = {
        let button = LazyButton(title: "Сохранить", color: .blue)
        button.layer.cornerRadius = 20
        return button
    }()
    
    init(presenter: AddKeyPresenterProtocol) {
        self.presenter = presenter
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
        view.backgroundColor = UIColor(red: 0.7, green: 0.81, blue: 0.93, alpha: 1.0)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "LeftArrow"), style: .done, target: self, action: #selector(popViewController))
        view.addSubview(platformTextField)
        platformTextField.addTarget(self, action: #selector(activateButton), for: .editingChanged)
        view.addSubview(loginTextField)
        loginTextField.addTarget(self, action: #selector(activateButton), for: .editingChanged)
        view.addSubview(passwordTextField)
        passwordTextField.addTarget(self, action: #selector(activateButton), for: .editingChanged)
        view.addSubview(saveButton)
        saveButton.isUserInteractionEnabled = false
        saveButton.addTarget(self, action: #selector(saveProfile), for: .touchUpInside)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            platformTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 13),
            platformTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 4),
            platformTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -4),
            platformTextField.heightAnchor.constraint(equalToConstant: 48),
            
            loginTextField.topAnchor.constraint(equalTo: platformTextField.bottomAnchor, constant: 13),
            loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 4),
            loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -4),
            loginTextField.heightAnchor.constraint(equalToConstant: 48),
            
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 13),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 4),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -4),
            passwordTextField.heightAnchor.constraint(equalToConstant: 48),
            
            saveButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 13),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 4),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -4),
            saveButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func activateButton() {
        if platformTextField.text?.isEmpty == false && loginTextField.text?.isEmpty == false && passwordTextField.text?.isEmpty == false {
            saveButton.isUserInteractionEnabled = true
        } else {
            saveButton.isUserInteractionEnabled = false
        }
    }
    
    @objc private func popViewController() {
        presenter.popViewController()
    }
    
    @objc private func saveProfile() {
        presenter.saveProfile(platform: platformTextField.text!, login: loginTextField.text!, password: passwordTextField.text!)
        platformTextField.text?.removeAll()
        loginTextField.text?.removeAll()
        passwordTextField.text?.removeAll()
    }
}

extension AddKeyViewController: AddKeyViewProtocol {}
