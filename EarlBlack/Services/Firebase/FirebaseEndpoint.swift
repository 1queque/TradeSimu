//
//  FirebaseEndpoint.swift
//  EarlBlack
//
//  Created by queque on 20.06.2022.
//

import Foundation
import Firebase


protocol FirebaseEndpoint {
    
    var path: String { get set }
    var firebase_reference: DatabaseReference { get set }
    
}


