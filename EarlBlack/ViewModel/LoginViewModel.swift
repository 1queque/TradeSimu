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
    
    func check_user_exists(email: String, password:String, completion: @escaping (Bool) -> Void) {
        self.firebase_manager.get_user(email: email).done { userData in
            for user in userData{
                if (email == user.value["email"] as! String && password == user.value["password"] as! String) {
                    completion(true)
                } else {
                    completion(false)
                }
            }
        }.catch { error in
            completion(false)
        }
    }
}

/*
 
 func checkUserExists(email: String) -> Bool {
         var result = false
         getUser(email: email).done { userData in
             result = true
         }.catch { error in
             result = false
         }
         return result
     }
 
 func check_fields(email:String, password:String) -> Bool {
     firebase_manager.get_user(email: email).then { userData in
         return true
     }.catch { error in
         // Handle the error
         print(error)
     }
 }
 
 
 
 firebase_manager.get_user(email: email).then { userData in
     // Do something with the user data
     print(userData)
 }.catch { error in
     // Handle the error
     print(error)
 }
 
 if email.is_email_valid && password.is_password_valid{
     print(password)
     let user = firebase_manager.get_user(email: email)
     
     return true
 }
 else{
     return false
 }
 
 */
