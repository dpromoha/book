//
//  Validator.swift
//  book
//
//  Created by Daria on 29.06.2024.
//

import Foundation

public final class Validator {
    
    static func isEmailValid(_ value: String) -> Bool {
        let range = NSRange(location: 0, length: value.utf16.count)
        if let regex = try? NSRegularExpression(pattern: "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$") {
            
            return regex.firstMatch(in: value, range: range) != nil
        } else {
            
            return false
        }
    }
    
    static func isPasswordValid(_ value: String) -> Bool {
        let range = NSRange(location: 0, length: value.utf16.count)
        if let regex = try? NSRegularExpression(pattern: "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{10,}$") {
            
            return regex.firstMatch(in: value, range: range) != nil
        } else {
            
            return false
        }
    }
    
}
