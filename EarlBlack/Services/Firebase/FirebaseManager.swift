//
//  FirebaseManager.swift
//  EarlBlack
//
//  Created by queque on 20.06.2022.
//

import Foundation
import Firebase
import PromiseKit


enum EndpointKeys: String {
    case users = "users"
}


class FirebaseManager: FirebaseEndpoint {
    static let singleton_instance = FirebaseManager()
    var path: String = EndpointKeys.users.rawValue
    var firebase_reference: DatabaseReference
    var reference_with_id: DatabaseReference? = nil
    
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
    
    
    func get_user(email: String) -> Promise<[String: AnyObject]> {
        let query = self.firebase_reference.child("users").queryOrdered(byChild: "email").queryEqual(toValue: email)
        return Promise { resolver in
            query.observeSingleEvent(of: .value, with: { (snapshot) in
                if let userDict = snapshot.value as? [String: AnyObject] {
                    resolver.fulfill(userDict)
                } else {
                    resolver.reject(NSError(domain: "User not found", code: 404, userInfo: nil))
                }
            })
        }
    }
}

/*
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
 
 func get_user(email:String) -> Promise<DataSnapshot>{
     let query = self.firebase_reference.child("users").queryOrdered(byChild: "email").queryEqual(toValue : email)
     return Promise { seal in
         query.observeSingleEvent(of: .value) { snapshot in
             if let users = snapshot.value as? [String: AnyObject]{
                 for user in users{
                     if let user_data = user.value as? NSDictionary{
                         self.user_dict = user_data
                     }
                 }
             }
             seal.fulfill(snapshot)
         }
     }
 }
 
 return Promise { resolver in
     let query = self.firebase_reference.child("users").queryOrdered(byChild: "email").queryEqual(toValue : email)
     
     query.observeSingleEvent(of: .value) { (querySnapshot, error) in
         if let error = error {
             resolver.reject(error)
         } else if let users = querySnapshot.value as? [String: AnyObject] {
             if let user_data = users[0].value as? NSDictionary{
                 resolver.fulfill(user_data)
             } else {
                 resolver.fulfill([:](NSDictionary))
             }
         }
     } else {
         let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "No user found"])
         resolver.reject(error)
     }
     }
 
 
 let ref = Database.database().reference()
 firstly {
     observeSingleEventPromise(ref: ref)
 }.done { snapshot in
     // handle snapshot
 }.catch { error in
     // handle error
 }
 
 */




