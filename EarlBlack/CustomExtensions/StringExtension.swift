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
    
    func lowercase_all_letters_and_replace_underscore() -> String {
        return self.lowercased().replacingOccurrences(of: " ", with: "_")
    }
    
    var is_username_valid:Bool{
        let username_reg_ex = "[A-Za-z\\d]{3,}"
        let username_test = NSPredicate(format: "SELF MATCHES %@", username_reg_ex)
        return username_test.evaluate(with: self)
    }
    
    var is_name_valid:Bool{
        let name_reg_ex = "[A-Za-z]{3,}"
        let name_test = NSPredicate(format: "SELF MATCHES %@", name_reg_ex)
        return name_test.evaluate(with: self)
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
        let password_reg_ex = "^(?=.*[a-z])[A-Za-z\\d$@$#!%*?&]{8,}"
        
        let password_test = NSPredicate(format: "SELF MATCHES %@", password_reg_ex)
        return password_test.evaluate(with: self)
    }
    
    var is_email_valid: Bool{
        let email_reg_ex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        let email_test = NSPredicate(format: "SELF MATCHES %@", email_reg_ex)
        return email_test.evaluate(with: self)
    }
}
