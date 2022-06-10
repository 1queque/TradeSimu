//
//  SignUpViewModel.swift
//  EarlBlack
//
//  Created by queque on 9.06.2022.
//

import Foundation

class SignUpViewModel{
    
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
