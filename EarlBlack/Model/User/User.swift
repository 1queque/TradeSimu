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
    case phone = "phone"
}

class User: Codable{
    typealias IdentifierType = Identifier<User, String>
    
    let id:IdentifierType
    let username:String
    let first_name:String
    let last_name:String
    let password:String
    let email:Email
    let phone:String
    
    init(from user_dict:[String:Any]) {
        self.id = IdentifierType(DefaultValue.Empty.string)
        self.username = user_dict[MyKey.User.username] as? String ?? DefaultValue.Empty.string
        self.first_name = user_dict[MyKey.User.first_name] as? String ?? DefaultValue.Empty.string
        self.last_name = user_dict[MyKey.User.last_name] as? String ?? DefaultValue.Empty.string
        self.password = user_dict[MyKey.User.password] as? String ?? DefaultValue.Empty.string
        self.email = user_dict[MyKey.User.email] as? Email ?? Email(DefaultValue.Empty.string)
        self.phone = user_dict[MyKey.User.phone] as? String ?? DefaultValue.Empty.string
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: UserCodingKeys.self)
        self.id = try container.decode(IdentifierType.self, forKey: .id)
        self.username = try container.decode(String.self, forKey: .username)
        self.first_name = try container.decode(String.self, forKey: .first_name)
        self.last_name = try container.decode(String.self, forKey: .last_name)
        self.password = try container.decode(String.self, forKey: .password)
        self.email = try container.decode(Email.self, forKey: .email)
        self.phone = try container.decode(String.self, forKey: .phone)
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
        try container.encode(phone, forKey: .phone)
    }
    
    static func get_all_coding_keys() -> Array<String> {
        var coding_keys_array = [String]()
        for key in UserCodingKeys.allCases {
            if key.stringValue != UserCodingKeys.id.stringValue {
                if key.stringValue.contains("_"){
                    coding_keys_array.append(key.stringValue.replacingOccurrences(of: "_", with: "").capitalizingFirstLetter())
                }
                else{
                    coding_keys_array.append(key.stringValue.capitalizingFirstLetter())
                }
            }
        }
        return coding_keys_array
    }
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
