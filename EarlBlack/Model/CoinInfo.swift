//
//  CoinInfo.swift
//  BlackEarl
//
//  Created by queque on 9.02.2022.
//

import Foundation

class CoinInfo: JsonSerializable {
    private(set) var id: String
    private(set) var symbol: String
    private(set) var name: String
    private(set) var price: Double
    private(set) var image: String
    private(set) var change_percent_24_hr: Double
    
    required init?(json_data: [String: Any]) {
        self.id = json_data[MyKey.CoinInfo.id] as? String ?? DefaultValue.Empty.string
        self.symbol = json_data[MyKey.CoinInfo.symbol] as? String ?? DefaultValue.Empty.string
        self.name = json_data[MyKey.CoinInfo.name] as? String ?? DefaultValue.Empty.string
        self.price = json_data[MyKey.CoinInfo.price] as? Double ?? DefaultValue.Empty.double
        self.image = json_data[MyKey.CoinInfo.image] as? String ?? DefaultValue.Empty.string
        self.change_percent_24_hr = json_data[MyKey.CoinInfo.change_percent_24_hr] as? Double ?? DefaultValue.Empty.double
        self.change_percent_24_hr = round(self.change_percent_24_hr * 10) / 10.0
    }
    
    func get_json_data() {
        print("Id : " + self.id)
        print("Symbol : " + self.symbol)
        print("Name : " + self.name)
        print("Price : " + String(self.price))
        print("Image : " + String(self.image))
        print("Change : " + String(self.change_percent_24_hr))
    }
}
