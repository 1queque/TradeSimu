//
//  StringExtension.swift
//  EarlBlack
//
//  Created by queque on 10.06.2022.
//

import Foundation

extension String{
    func capitalize_first_letter_and_replace_underscore() -> String {
        return self.capitalized.replacingOccurrences(of: "_", with: " ")
    }
    
    func lowercase_all_letter_and_replace_underscore() -> String {
        return self.lowercased().replacingOccurrences(of: " ", with: "_")
    }
}
