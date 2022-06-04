//
//  QueryItems.swift
//  EarlBlack
//
//  Created by queque on 5.04.2022.
//

import Foundation


enum ChangePeriod: String, CaseIterable {
    case hour1 = "1h"
    case day1 = "24h"
    case day7 = "7d"
    case day14 = "14d"
    case day30 = "30d"
    case day200 = "200d"
    case year1 = "1y"
}


class QueryItems {
    private(set) var query_items: [URLQueryItem] = []
    private(set) var query_dictionary : [String: Any] = [
        "vs_currency": "usd",
        "order": "market_cap_desc",
        "per_page": "100",
        "page": "1",
        "sparkline": "false",
        "price_change_percantage": ChangePeriod.day1
    ]

    func change_to_another_period(_ period: String){
        ChangePeriod.allCases.forEach{
            self.query_dictionary["price_change_percantage"] = ($0.rawValue == period) ? $0 : ChangePeriod.day1
        }
    }

    func change_to_another_page(_ page: String){
        self.query_dictionary["page"] = page
    }

    func load_query_items(){
        for (name, describe) in self.query_dictionary {
            self.query_items.append(URLQueryItem(name: name, value: String(describing: describe)))
        }
    }
    
    func clear_query_items(){
        self.query_items = []
    }
}
