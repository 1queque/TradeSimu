//
//  User.swift
//  EarlBlack
//
//  Created by queque on 26.05.2022.
//

import Foundation

enum CodingKeys: String, CodingKey {
    case id = "id"
    case user_name = "user_name"
    case first_name = "fname"
    case sir_name = "sir_name"
    case password = "password"
    case email = "email"
}

class User: Codable{
    typealias IdentifierType = Identifier<User, String>
    
    let id:IdentifierType
    let user_name:String
    let first_name:String
    let sir_name:String
    let password:String
    let email:Email
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(IdentifierType.self, forKey: .id)
        self.user_name = try container.decode(String.self, forKey: .user_name)
        self.first_name = try container.decode(String.self, forKey: .first_name)
        self.sir_name = try container.decode(String.self, forKey: .sir_name)
        self.password = try container.decode(String.self, forKey: .password)
        self.email = try container.decode(Email.self, forKey: .email)
    }
}

extension User{
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(email, forKey: .email)
        try container.encode(id.wrappedValue, forKey: .id)
        try container.encode(password, forKey: .password)
        try container.encode(first_name, forKey: .first_name)
        try container.encode(email.email, forKey: .email)
    }
}

