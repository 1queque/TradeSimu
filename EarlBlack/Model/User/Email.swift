//
//  Email.swift
//  EarlBlack
//
//  Created by queque on 1.06.2022.
//

import Foundation

class Email: Codable{
    var email: String

    enum CodingKeys: String, CodingKey {
        case email = "email"
    }

    init(_ email: String){
        self.email = email
    }

    required init(from decoder: Decoder) throws{
        let container = try decoder.singleValueContainer()
        self.email = try container.decode(String.self)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(email)
    }
}
