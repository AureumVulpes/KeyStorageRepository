//
//  KeyStoragePresenter.swift
//  KeyStorage
//
//  Created by Дмитрий on 19.08.2023.
//

import Foundation

protocol KeyStoragePresenterProtocol: KeyStorageCellDelegate {
    var userProfiles: [Profile] { get set }
    func popViewController()
    func dismissEditView()
    func saveAndDismiddEditView(platform: String, login: String, password: String)
}

final class KeyStoragePresenter {
    
    var delegate: MassiveCoordinatorDelegate?
    var dataManager: CoreDataManagerProtocol?
    var userProfiles: [Profile]
    
    weak var view: KeyStorageViewProtocol?
    
    init(userProfiles: [Profile]) {
        self.userProfiles = userProfiles
    }
    
    private func updateUserProfiles() {
        guard let profiles = dataManager?.fetchProfiles() else { return }
        userProfiles = profiles
    }
    
}

extension KeyStoragePresenter: KeyStoragePresenterProtocol {
    func popViewController() {
        userProfiles.removeAll()
        delegate?.popViewController()
    }
    
    func dismissEditView() {
        delegate?.dismissViewController()
    }
    
    func saveAndDismiddEditView(platform: String, login: String, password: String) {
        dataManager?.updateProfile(with: platform, login: login, password: password)
        updateUserProfiles()
        view?.reloadDataTableView()
        dismissEditView()
    }
}

extension KeyStoragePresenter: KeyStorageCellDelegate {
    
    func editButtonTapped(platform: String, login: String, password: String) {
        delegate?.presentEditViewController(presenter: self, platform: platform, login: login, password: password)
    }
    
    func deleteButtonTapped(cellProfile: String, cellRow: Int) {
        dataManager?.deleteProfile(with: cellProfile)
        userProfiles.remove(at: cellRow)
        view?.reloadDataTableView()
    }
}
