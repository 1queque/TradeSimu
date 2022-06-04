//
//  CoinApiUrlSession.swift
//
//
//  Created by queque on 11.02.2022.
//

import UIKit


class ViewController: UIViewController{
    
    
    @IBOutlet weak var coinTableView: UITableView!
    
    var coin_info_instances = [CoinInfo]()
    var api_data: [Any] = []
    let api_session_request = CoinApiUrlSession()
    let query_items_instance = QueryItems()
    
    override func viewDidLoad()  {
        super.viewDidLoad()
        
        query_items_instance.load_query_items()
        
        api_session_request.get_data_from_api(query_items_instance.query_items) {
            [weak self] (api_data) in
            self!.api_data = api_data as [Any]
            DispatchQueue.main.async {
                self?.coin_info_instances = self?.api_session_request.get_all_api_data_instances(
                    api_data: self!.api_data
                ) ?? [CoinInfo]()
                self?.coinTableView.reloadData()
            }
        }
        coinTableView.delegate = self
        coinTableView.dataSource = self
    }
    
}

extension ViewController:  UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coin_info_instances.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "coinCell", for: indexPath) as! CoinTableViewCell
        cell.coinIconImageView.load(url: URL(string: coin_info_instances[indexPath.row].image)!)
        cell.coinInfoLabel.text = coin_info_instances[indexPath.row].symbol + " " + String(coin_info_instances[indexPath.row].price)
        cell.coinChangeLabel.text = String(coin_info_instances[indexPath.row].change_percent_24_hr) + "%"
        return cell
    }
}
