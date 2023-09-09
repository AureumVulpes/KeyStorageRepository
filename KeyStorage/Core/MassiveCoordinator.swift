//
//  HomeCoordinator.swift
//  KeyStorage
//
//  Created by Дмитрий on 16.08.2023.
//

import UIKit

protocol MassiveCoordinatorDelegate {
    func popViewController()
    func dismissViewController()
    func pushToKeyStorage()
    func pushToAddKey()
    func presentEditViewController(presenter: KeyStoragePresenterProtocol, platform: String, login: String, password: String)
}

final class MassiveCoordinator {
    weak var navigationController: UINavigationController?
    var dataManager: CoreDataManagerProtocol?
}

extension MassiveCoordinator: MassiveCoordinatorDelegate {
    func popViewController() {
        navigationController?.popViewController(animated: true)
    }
    
    func dismissViewController() {
        navigationController?.dismiss(animated: true)
    }
    
    func pushToKeyStorage() {
        guard let userProfiles = dataManager?.fetchProfiles() else { return }
        let presenter = KeyStoragePresenter(userProfiles: userProfiles)
        let vc = KeyStorageViewController(presenter: presenter)
        navigationController?.pushViewController(vc, animated: true)
        presenter.delegate = self
        presenter.dataManager = dataManager
        presenter.view = vc
    }
    
    func pushToAddKey() {
        let presenter = AddKeyPresenter()
        let vc = AddKeyViewController(presenter: presenter)
        navigationController?.pushViewController(vc, animated: true)
        presenter.delegate = self
        presenter.dataManager = dataManager
        presenter.view = vc
    }
    
    func presentEditViewController(presenter: KeyStoragePresenterProtocol, platform: String, login: String, password: String) {
        let editViewController = EditViewController(presenter: presenter, platform: platform, login: login, password: password)
        editViewController.modalPresentationStyle = .overFullScreen
        navigationController?.present(editViewController, animated: true)
    }
}
