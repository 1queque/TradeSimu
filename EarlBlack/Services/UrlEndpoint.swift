//
//  UrlManagement.swift
//  EarlBlack
//
//  Created by queque on 11.03.2022.
//

import Foundation


struct Endpoint {
    var path: String
    var query_items: [URLQueryItem]
}

extension Endpoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.coingecko.com"
        components.path = "/api/v3/" + path
        components.queryItems = query_items

        guard let url = components.url else {
            preconditionFailure(
                "Invalid URL components: \(components)"
            )
        }
        
        return url
    }
}

extension Endpoint {
    static func market(_ query_items: [URLQueryItem]) -> Self {
        Endpoint(path: "coins/markets", query_items: query_items)
    }
}

