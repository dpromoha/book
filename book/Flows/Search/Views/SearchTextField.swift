//
//  SearchTextField.swift
//  book
//
//  Created by Daria on 26.06.2024.
//

import SwiftUI

struct SearchTextField: UIViewRepresentable {
    
    @Binding var text: String
    
    func makeCoordinator() -> SearchTextFieldCoordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        
        textField.placeholder = "Search..."
        textField.delegate = context.coordinator
        textField.autocorrectionType = .no
        textField.returnKeyType = .search
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = Color.gray.cgColor
        textField.layer.cornerRadius = 10.0
        
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 36.0, height: 30.0))
        
        let searchImage = UIImage(systemName: "magnifyingglass")
        let searchImageView = UIImageView(image: searchImage)
        searchImageView.tintColor = .gray
        
        let imageSize = searchImage?.size ?? .zero
        searchImageView.frame = CGRect(x: 6.0, y: 4.0, width: imageSize.width, height: imageSize.height)
        searchImageView.contentMode = .center
        
        containerView.addSubview(searchImageView)
        
        textField.leftView = containerView
        textField.leftViewMode = .always
        
        textField.addTarget(context.coordinator, action: #selector(SearchTextFieldCoordinator.textFieldDidChange), for: .editingChanged)
        
        return textField
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
    
}
