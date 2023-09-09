//
//  AddKeyPresenter.swift
//  KeyStorage
//
//  Created by Дмитрий on 31.08.2023.
//

import Foundation

protocol AddKeyPresenterProtocol {
    func popViewController()
    func saveProfile(platform: String, login: String, password: String)
}

final class AddKeyPresenter {
    
    var delegate: MassiveCoordinatorDelegate?
    var dataManager: CoreDataManagerProtocol?
    
    weak var view: AddKeyViewProtocol?
    
}

extension AddKeyPresenter: AddKeyPresenterProtocol {
    func popViewController() {
        delegate?.popViewController()
    }
    
    func saveProfile(platform: String, login: String, password: String) {
        dataManager?.createProfile(platform: platform, login: login, password: password)
        popViewController()
    }
}
