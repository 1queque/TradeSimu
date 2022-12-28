//
//  FirebaseManager.swift
//  EarlBlack
//
//  Created by queque on 20.06.2022.
//

import Foundation
import Firebase

enum EndpointKeys: String {
    case users = "users"
}


class FirebaseManager: FirebaseEndpoint {
    static let singleton_instance = FirebaseManager()
    var path: String = EndpointKeys.users.rawValue
    var firebase_reference: DatabaseReference
    var reference_with_id: DatabaseReference? = nil
    var user_dict: NSDictionary? = nil
    
    private init(){
        self.firebase_reference = Database.database(url: "https://cointradesimu-default-rtdb.europe-west1.firebasedatabase.app/").reference()
    }
    
    func set_path(from path: String) {
        self.path = path
    }
    
    func post(from data: Any){
        self.reference_with_id?.setValue(data)
    }
    
    func delete(with id:String){
        self.firebase_reference.child(self.path).child(id).removeValue()
    }
    
    func update(with id: String, from data: [String:Any]){
        self.firebase_reference.child(self.path).child(id).updateChildValues(data)
    }
    
    func get_user(email:String) -> NSDictionary{
        let query = self.firebase_reference.child("users").queryOrdered(byChild: "email").queryEqual(toValue : email)
        query.observeSingleEvent(of: .value, with: { snapshot in
            if let users = snapshot.value as? [String: AnyObject]{
                for user in users{
                    if let user_data = user.value as? NSDictionary{
                        self.user_dict = user_data
                    }
                }
            }
        })
        return user_dict ?? [:]
    }
}
