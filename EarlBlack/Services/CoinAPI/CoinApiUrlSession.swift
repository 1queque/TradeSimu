//
//  CoinApiUrlSession.swift
//  EarlBlack
//
//  Created by queque on 11.02.2022.
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

enum URLSessionError: Error {
case invalid_server_response
case unsupported_data
}


class CoinApiUrlSession {
    
    init() {
        
    }
    
    func get_data_from_api(_ query_items: [URLQueryItem], completionHandler: @escaping ([Any]) -> ()) {
        let url = Endpoint.market(query_items).url
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: {
            (data, response, error) in
            if let error = error {
                print("Error with fetching coins: \(error)")
                return
            }
          
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                      print(
                        "Error with the response, unexpected status code: \(String(describing:response))"
                      )
                return
            }
            
            if let data = data, let api_data = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [Any] {
                completionHandler(api_data)
            }
        })
        task.resume()
    }
    
    func get_all_api_data_instances(api_data: [Any]) -> [CoinInfo] {
        var coin_info_instance_array = [CoinInfo]()
        for api_data_dictionary in api_data {
            let coin_info_model = CoinInfo(json_data: api_data_dictionary as! [String : Any])
            coin_info_instance_array.append(coin_info_model!)
        }
        return coin_info_instance_array
    }
}

