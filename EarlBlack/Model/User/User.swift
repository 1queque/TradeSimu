//
//  User.swift
//  EarlBlack
//
//  Created by queque on 26.05.2022.
//

import Foundation

enum UserCodingKeys: String, CodingKey, CaseIterable {
    case id = "id"
    case username = "username"
    case first_name = "first_name"
    case last_name = "last_name"
    case password = "password"
    case email = "email"
    case phone_number = "phone_number"
}


class User: Codable{
    typealias IdentifierType = Identifier<User, String>
    
    let id:IdentifierType
    let username:String
    let first_name:String
    let last_name:String
    let password:String
    let email:Email
    let phone_number:String
    
    init(from user_dictionary:[String:Any]) {
        self.id = IdentifierType(DefaultValue.Empty.string)
        self.username = user_dictionary[MyKey.User.username] as? String ?? DefaultValue.Empty.string
        self.first_name = user_dictionary[MyKey.User.first_name] as? String ?? DefaultValue.Empty.string
        self.last_name = user_dictionary[MyKey.User.last_name] as? String ?? DefaultValue.Empty.string
        self.password = user_dictionary[MyKey.User.password] as? String ?? DefaultValue.Empty.string
        self.email = Email(user_dictionary[MyKey.User.email] as? String ?? DefaultValue.Empty.string)
        self.phone_number = user_dictionary[MyKey.User.phone_number] as? String ?? DefaultValue.Empty.string
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: UserCodingKeys.self)
        self.id = try container.decode(IdentifierType.self, forKey: .id)
        self.username = try container.decode(String.self, forKey: .username)
        self.first_name = try container.decode(String.self, forKey: .first_name)
        self.last_name = try container.decode(String.self, forKey: .last_name)
        self.password = try container.decode(String.self, forKey: .password)
        self.email = try container.decode(Email.self, forKey: .email)
        self.phone_number = try container.decode(String.self, forKey: .phone_number)
    }
}

extension User{
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: UserCodingKeys.self)
        try container.encode(username, forKey: .username)
        try container.encode(password, forKey: .password)
        try container.encode(first_name, forKey: .first_name)
        try container.encode(email.email, forKey: .email)
        try container.encode(last_name, forKey: .last_name)
        try container.encode(phone_number, forKey: .phone_number)
    }
    
    func get_all_data(){
        print(self.id.wrappedValue)
        print(self.username)
        print(self.first_name)
        print(self.last_name)
        print(self.email)
        print(self.password)
        print(self.phone_number)
    }
    
    static func add_all_coding_keys_to_array() -> Array<String> {
        var coding_keys_array = [String]()
        UserCodingKeys.allCases.forEach { coding_keys_array.append($0.stringValue.capitalize_first_letter_and_replace_underscore()) }
        coding_keys_array.remove(at: 0) // removes "id" case from keys array
        return coding_keys_array
    }
}
