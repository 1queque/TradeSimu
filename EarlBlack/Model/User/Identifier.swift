//
//  Identifier.swift
//  EarlBlack
//
//  Created by queque on 1.06.2022.
//

import Foundation

struct Identifier<T, KeyType: Decodable>: Decodable {
    let wrappedValue: KeyType

    init(_ wrappedValue: KeyType) {
        self.wrappedValue = wrappedValue
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.wrappedValue = try container.decode(KeyType.self)
    }
}
