//
//  LazyLabel.swift
//  KeyStorage
//
//  Created by Дмитрий on 30.08.2023.
//

import UIKit

final class LazyLabel: UILabel {
    
    private var color: Color?
    
    enum Color {
        case whiteWithBorder, whiteWithoutBorder, lightBlue, clearBackground
    }
    
    init(color: Color) {
        self.color = color
        super.init(frame: .zero)
        setSettingLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setSettingLabel() {
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = false
        switch color {
        case .whiteWithBorder:
            backgroundColor = .white
            clipsToBounds = true
            layer.borderColor = UIColor.black.cgColor
            layer.borderWidth = 1
            layer.cornerRadius = 13
            textColor = .black
        case .whiteWithoutBorder:
            backgroundColor = .white
            clipsToBounds = true
            textColor = .black
        case .lightBlue:
            backgroundColor = UIColor(red: 0.7, green: 0.81, blue: 0.93, alpha: 0.5)
            clipsToBounds = true
            layer.borderColor = UIColor(red: 0.7, green: 0.81, blue: 0.93, alpha: 0.5).cgColor
            layer.borderWidth = 1
            layer.cornerRadius = 13
            textColor = .black
        case .clearBackground:
            backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
            textAlignment = .center
            clipsToBounds = true
            textColor = .black
        default:
            break
        }
    }
}
