//
//  SignUpViewModel.swift
//  EarlBlack
//
//  Created by queque on 9.06.2022.
//

import Foundation
import UIKit
import Firebase
import CodableFirebase


enum ValidError: String{
    case username_invalid = "Username is not valid!\n Needs only digits and letters"
    case name_invalid = "Name is not valid!"
    case password_invalid = "Password is not valid!\n Needs capital letter, lower case and number\n Needs at least 8 character  "
    case email_invalid = "Email is not valid!"
    case phone_number_invalid = "Phone Number is not valid!"
}


class RegisterFormViewModel{
    
    static let user_coding_keys_array = User.add_all_coding_keys_to_array()
    let firebase_manager = FirebaseManager.singleton_instance
    
    init(){}
    
    func set_data_to_encode_and_post(from form_dictionary:[String:Any]) -> Data{
        let user = User(from: self.add_id_to_dictionary(from: form_dictionary))
        let encoder = FirebaseEncoder()
        do {
            let jsonData = try encoder.encode(user.self)
            self.firebase_manager.post(from: jsonData)
        }catch let error {
            print(error)
        }
        return Data()
    }
    
    func check_text_is_valid(from dict:[String: Any]) -> (is_valid:Bool, alert_message:String) {
        for key in RegisterFormViewModel.user_coding_keys_array{
            if let value:String = dict[key] as? String{
                if key == "Username"{
                    return (value.is_username_valid, ValidError.username_invalid.rawValue)
                }else if key == "First Name" || key == "Last Name"{
                    return (value.is_name_valid, ValidError.name_invalid.rawValue)
                } else if key == "Password"{
                    return (value.is_password_valid, ValidError.password_invalid.rawValue)
                } else if key == "Email"{
                    return (value.is_email_valid, ValidError.email_invalid.rawValue)
                } else if key == "Phone Number"{
                    return (value.is_phone_number_valid, ValidError.phone_number_invalid.rawValue)
                }
            }
        }
        return (true, "")
    }
    
    func add_id_to_dictionary(from dict: [String:Any]) -> [String: Any]{
        self.firebase_manager.reference_with_id = self.firebase_manager.firebase_reference.child(self.firebase_manager.path).childByAutoId()
        var proxy_form_dictionary = dict
        proxy_form_dictionary["id"] = String(self.firebase_manager.reference_with_id?.key ?? "")
        return proxy_form_dictionary
    }
}
