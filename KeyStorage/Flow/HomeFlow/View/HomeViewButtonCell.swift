//
//  HomeViewCell.swift
//  KeyStorage
//
//  Created by Дмитрий on 16.08.2023.
//

import UIKit

final class HomeViewButtonCell: UITableViewCell {
    
    private let aggregateView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 2
        view.layer.cornerRadius = 25
        return view
    }()
    
    private let titleLabel = LazyLabel(color: .clearBackground)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupInitials()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
    }
    
    func configure(with textView: String) {
        titleLabel.text = textView
    }
    
    private func setupInitials() {
        contentView.backgroundColor = UIColor(red: 0.7, green: 0.81, blue: 0.93, alpha: 1.0)
        contentView.addSubview(aggregateView)
        aggregateView.addSubview(titleLabel)
        aggregateView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: aggregateView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: aggregateView.centerYAnchor),
            
            aggregateView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2),
            aggregateView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2),
            aggregateView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2),
            aggregateView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2),
            aggregateView.heightAnchor.constraint(equalToConstant: 46)
        ])
    }
}
