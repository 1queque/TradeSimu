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
    
    var is_phone_number_valid: Bool{
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let matches = detector.matches(in: self, options: [], range: NSMakeRange(0, self.count))
            if let res = matches.first {
                return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == self.count && self.count == 10
            } else {
                return false
            }
        } catch {
            return false
        }
    }
    
    var is_password_valid: Bool{
        let passwordRegEx = "^(?=.*[a-z])[A-Za-z\\d$@$#!%*?&]{8,}"
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return passwordTest.evaluate(with: self)
    }
    
    var is_email_valid: Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}
