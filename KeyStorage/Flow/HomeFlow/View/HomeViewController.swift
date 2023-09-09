//
//  ViewController.swift
//  KeyStorage
//
//  Created by Дмитрий on 16.08.2023.
//

import UIKit

protocol HomeViewProtocol: AnyObject {}

final class HomeViewController: UIViewController {

    private let presenter: HomePresenterProtocol
    
    private let homeViewTableView = UITableView()
    
    init(presenter: HomePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeViewTableView.dataSource = self
        homeViewTableView.delegate = self
        setupInitials()
        
    }
    
    func setupInitials() {
        view.backgroundColor = UIColor(red: 0.7, green: 0.81, blue: 0.93, alpha: 1.0)
        view.addSubview(homeViewTableView)
        homeViewTableView.backgroundColor = view.backgroundColor
        homeViewTableView.separatorStyle = .none
        homeViewTableView.register(HomeViewButtonCell.self, forCellReuseIdentifier: "HomeViewButtonCell")
        homeViewTableView.translatesAutoresizingMaskIntoConstraints = false
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            homeViewTableView.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 10),
            homeViewTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            homeViewTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            homeViewTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5)
        ])
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.buttonTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = homeViewTableView.dequeueReusableCell(withIdentifier: "HomeViewButtonCell", for: indexPath) as! HomeViewButtonCell
        let tableButton = presenter.buttonTitle[indexPath.row]
        cell.configure(with: tableButton)
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectAddIndex(index: indexPath.row)
    }
}

extension HomeViewController: HomeViewProtocol {}
