//
//  LazyTextField.swift
//  KeyStorage
//
//  Created by Дмитрий on 30.08.2023.
//

import UIKit

final class LazyTextField: UITextField {
    
    private var title: String = ""
    
    init(title: String) {
        super.init(frame: .zero)
        self.title = title
        setSettingTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setSettingTextField() {
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        leftViewMode = .always
        placeholder = title
        backgroundColor = .white
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 13
        textColor = .black
        
    }
}
