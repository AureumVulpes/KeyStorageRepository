//
//  HomePresenter.swift
//  KeyStorage
//
//  Created by Дмитрий on 16.08.2023.
//

import Foundation

protocol HomePresenterProtocol {
    var buttonTitle: [String] { get }
    func didSelectAddIndex(index: Int)
}

final class HomePresenter {
    
    var delegate: MassiveCoordinatorDelegate?
    
    weak var view: HomeViewProtocol?
    
    var buttonTitle = ["Хранилище", "Добавить новый"]
}

extension HomePresenter: HomePresenterProtocol {
    func didSelectAddIndex(index: Int) {
        switch index {
        case 0 : delegate?.pushToKeyStorage()
        case 1 : delegate?.pushToAddKey()
        default : break
        }
    }
    
    
    
    
}
