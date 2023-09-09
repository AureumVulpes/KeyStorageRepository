//
//  LazyButton.swift
//  KeyStorage
//
//  Created by Дмитрий on 16.08.2023.
//

import UIKit

final class LazyButton: UIButton {
    
    private var title: String?
    private var color: Color?
    
    enum Color {
        case white, blue, black, red, lightBlue
    }
    
    init(title: String, color: Color) {
        super.init(frame: .zero)
        self.title = title
        self.color = color
        setSettingButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setSettingButton() {
        setTitle(title, for: .normal)
        titleLabel?.textAlignment = .center
        translatesAutoresizingMaskIntoConstraints = false
        switch color {
        case .black:
            backgroundColor = .black
            setTitleColor(.white, for: .normal)
            layer.borderColor = UIColor.white.cgColor
            layer.borderWidth = 1
        case .blue:
            backgroundColor = .blue
            setTitleColor(.white, for: .normal)
            layer.borderColor = UIColor.white.cgColor
            layer.borderWidth = 1
        case .white:
            backgroundColor = .white
            setTitleColor(.black, for: .normal)
            layer.borderColor = UIColor.systemGray.cgColor
            layer.borderWidth = 1
        case .red:
            backgroundColor = .red
            setTitleColor(.white, for: .normal)
            layer.borderColor = UIColor.white.cgColor
            layer.borderWidth = 1
        case .lightBlue:
            backgroundColor = UIColor(red: 0.7, green: 0.81, blue: 0.93, alpha: 0.5)
            setTitleColor(.black, for: .normal)
            layer.borderColor = UIColor.black.cgColor
            layer.borderWidth = 1
        default:
            break
        }
    }
}
