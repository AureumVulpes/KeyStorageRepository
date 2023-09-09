//
//  KeyStorageCell.swift
//  KeyStorage
//
//  Created by Дмитрий on 22.08.2023.
//

import UIKit

protocol KeyStorageCellDelegate: AnyObject {
    
    func deleteButtonTapped(cellProfile: String, cellRow: Int)
    func editButtonTapped(platform: String, login: String, password: String)
}

final class KeyStorageCell: UITableViewCell {
    
    weak var delegate: KeyStorageCellDelegate?
    
    private var cellPlatform: String = ""
    private var cellLogin: String = ""
    private var cellPassword: String = ""
    private var cellRow: Int = 0
    
    private let aggregateView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 25
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let mainAggregateView = MainAggregateView()
    private let buttonAggregateView = ButtonAggregateView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupInitials()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        mainAggregateView.prepareForReuse()
    }
    
    func configure(platformText: String, loginText: String, passwordText: String, cellRow: Int) {
        mainAggregateView.configure(platformText: platformText, loginText: loginText, passwordText: passwordText)
        self.cellPlatform = platformText
        self.cellLogin = loginText
        self.cellPassword = passwordText
        self.cellRow = cellRow
        configureButtons()
    }
    
    func configureButtons() {
        buttonAggregateView.deleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        buttonAggregateView.editButton.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
    }
    
    private func setupInitials() {
        contentView.backgroundColor = UIColor(red: 0.7, green: 0.81, blue: 0.93, alpha: 1.0)
        contentView.addSubview(aggregateView)
        aggregateView.addSubview(mainAggregateView)
        aggregateView.addSubview(buttonAggregateView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            aggregateView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2),
            aggregateView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2),
            aggregateView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2),
            aggregateView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2),
            
            mainAggregateView.topAnchor.constraint(equalTo: aggregateView.topAnchor),
            mainAggregateView.leadingAnchor.constraint(equalTo: aggregateView.leadingAnchor),
            mainAggregateView.trailingAnchor.constraint(equalTo: aggregateView.trailingAnchor),
            
            buttonAggregateView.topAnchor.constraint(equalTo: mainAggregateView.bottomAnchor),
            buttonAggregateView.leadingAnchor.constraint(equalTo: aggregateView.leadingAnchor),
            buttonAggregateView.trailingAnchor.constraint(equalTo: aggregateView.trailingAnchor),
            buttonAggregateView.bottomAnchor.constraint(equalTo: aggregateView.bottomAnchor)
        ])
    }
    
    @objc private func deleteButtonTapped() {
        delegate?.deleteButtonTapped(cellProfile: cellPlatform, cellRow: cellRow)
    }
    
    @objc private func editButtonTapped() {
        delegate?.editButtonTapped(platform: cellPlatform, login: cellLogin, password: cellPassword)
    }
}
