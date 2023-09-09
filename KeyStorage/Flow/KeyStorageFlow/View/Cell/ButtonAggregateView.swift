//
//  buttonAggregateView.swift
//  KeyStorage
//
//  Created by Дмитрий on 05.09.2023.
//

import UIKit

final class ButtonAggregateView: UIView {
    
    let deleteButton: LazyButton = {
        let button = LazyButton(title: "Удалить", color: .red)
        button.layer.cornerRadius = 20
        return button
    }()
    
    let editButton: LazyButton = {
        let button = LazyButton(title: "Редактировать", color: .lightBlue)
        button.layer.cornerRadius = 20
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        setupInitials()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupInitials() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(deleteButton)
        addSubview(editButton)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            editButton.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            editButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7),
            editButton.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -3),
            editButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            editButton.heightAnchor.constraint(equalToConstant: 40),
            
            deleteButton.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            deleteButton.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 3),
            deleteButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -7),
            deleteButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            deleteButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
