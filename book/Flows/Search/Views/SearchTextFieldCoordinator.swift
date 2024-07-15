//
//  SearchTextFieldCoordinator.swift
//  book
//
//  Created by Daria on 26.06.2024.
//

import UIKit

final class SearchTextFieldCoordinator: NSObject, UITextFieldDelegate {
    
    var parent: SearchTextField
    
    init(parent: SearchTextField) {
        self.parent = parent
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        parent.text = textField.text ?? ""
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        parent.text = textField.text ?? ""
    }
    
}
