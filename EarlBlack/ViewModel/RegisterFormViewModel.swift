//
//  SignUpViewModel.swift
//  EarlBlack
//
//  Created by queque on 9.06.2022.
//

import Foundation
import UIKit

class RegisterFormViewModel{
    
    static let user_coding_keys_array = User.add_all_coding_keys_to_array()
    
    func set_data_to_encode(from form_dictionary:[String:Any]){
        let user = User(from: form_dictionary)
        let encoder = JSONEncoder()
        let decoder = JSONDecoder()
        do {
            let jsonData = try encoder.encode(user.self)
            let account = try decoder.decode(User.self, from: jsonData)
            print(account.get_all_data())
        }catch let error {
            print(error)
        }
    }
    
    func check_text_is_valid(from dict:[String: Any]) -> (is_valid:Bool, alert_message:String) {
        if let password:String = dict["Password"] as? String{
            return (password.is_password_valid, "Password is not valid!\n Needs capital letter, lower case and number\n Needs at least 8 character  ")
        }
        if let email:String = dict["Email"] as? String{
            return (email.is_email_valid, "Email is not valid!")
        }
        if let phone_number:String = dict["Phone Number"] as? String{
            return (phone_number.is_phone_number_valid, "Phone Number is not valid!")
        }
        return (true, "")
    }
    
}
