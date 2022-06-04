//
//  JsonSerializable.swift
//  EarlBlack
//
//  Created by queque on 16.02.2022.
//

import Foundation

protocol JsonSerializable {
    init?(json_data: [String: Any])
}
