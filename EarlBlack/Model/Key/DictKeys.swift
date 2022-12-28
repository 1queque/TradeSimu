//
//  DictKeys.swift
//  EarlBlack
//
//  Created by queque on 31.05.2022.
//

import Foundation

struct MyKey {
    struct CoinInfo {
        static let id = "id"
        static let symbol = "symbol"
        static let name = "name"
        static let price = "current_price"
        static let image = "image"
        static let change_percent_24_hr = "price_change_percentage_24h"
    }

    struct User {
        static let id = "id"
        static let password = "password"
        static let username = "username"
        static let first_name = "first_name"
        static let last_name = "last_name"
        static let phone_number = "phone_number"
        static let email = "email"
    }
}

struct DefaultValue {
    struct Empty {
        static let string = ""
        static let double = 0.0
    }
}

