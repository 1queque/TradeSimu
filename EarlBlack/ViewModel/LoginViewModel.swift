//
//  LoginViewModel.swift
//  EarlBlack
//
//  Created by queque on 1.08.2022.
//

import Foundation


class LoginViewModel{
    let firebase_manager = FirebaseManager.singleton_instance
    
    init(){}
    
    func check_fields(email:String, password:String) -> (successful:Bool, alert_message:String){
        if email.is_email_valid && password.is_password_valid{
            print(email)
            print(password)
            let user = firebase_manager.get_user(email: email)
            print(user)
            print(firebase_manager.get_user(email: email)["id"] as? String ?? "")
            return (true, "")
        }
        else{
            return (false, "Email and Password invalid")
        }
    }
}
