//
//  KeyStorageViewController.swift
//  KeyStorage
//
//  Created by Дмитрий on 19.08.2023.
//

import UIKit

protocol KeyStorageViewProtocol: AnyObject {
    func reloadDataTableView()
}

final class KeyStorageViewController: UIViewController {
    
    private let storageTableView = UITableView()
    
    private let presenter: KeyStoragePresenterProtocol
    
    init(presenter: KeyStoragePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storageTableView.dataSource = self
        storageTableView.delegate = self
        setupInitials()
    }
    
    private func setupInitials() {
        view.backgroundColor = UIColor(red: 0.7, green: 0.81, blue: 0.93, alpha: 1.0)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "LeftArrow"), style: .done, target: self, action: #selector(popViewController))
        view.addSubview(storageTableView)
        storageTableView.backgroundColor = view.backgroundColor
        storageTableView.separatorStyle = .none
        storageTableView.alwaysBounceVertical = true
        storageTableView.register(KeyStorageCell.self, forCellReuseIdentifier: "KeyStorageCell")
        storageTableView.translatesAutoresizingMaskIntoConstraints = false
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            storageTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            storageTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            storageTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            storageTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5)
        ])
    }
    
    @objc private func popViewController() {
        presenter.popViewController()
    }
}

extension KeyStorageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.userProfiles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = storageTableView.dequeueReusableCell(withIdentifier: "KeyStorageCell", for: indexPath) as! KeyStorageCell
        let userProfile = presenter.userProfiles[indexPath.row]
        cell.configure(platformText: userProfile.platform!, loginText: userProfile.login!, passwordText: userProfile.password!, cellRow: indexPath.row)
        cell.delegate = presenter
        return cell
    }
}

extension KeyStorageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension KeyStorageViewController: KeyStorageViewProtocol {
    func reloadDataTableView() {
        storageTableView.reloadData()
    }
}
