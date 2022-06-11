//
//  SignUpViewModel.swift
//  EarlBlack
//
//  Created by queque on 9.06.2022.
//

import Foundation
import UIKit

class SignUpViewModel{
    
    let user_coding_keys_array = User.add_all_coding_keys_to_array()
    
    func check_sign_up_form(from dict:[String:UITextField]) -> Bool{
        if dict.count == user_coding_keys_array.count {
            for (_, value) in dict{
                if value.text == "" {
                    return false
                }
            }
        } else {
            return false
        }
        return true
    }
    
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
    
}
