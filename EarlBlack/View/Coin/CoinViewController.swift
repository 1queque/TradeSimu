//
//  CoinViewController.swift
//  EarlBlack
//
//  Created by queque on 15.06.2022.
//

import UIKit

class CoinViewController: UIViewController {
    
    @IBOutlet weak var coinTableView: UITableView!
    
    var coin_info_instances = [CoinInfo]()
    var api_data: [Any] = []
    let api_session_request = CoinApiUrlSession()
    let query_items_instance = QueryItems()
    var username: String?
    
    @IBOutlet weak var user_profile_button: UIBarButtonItem!
    
    override func viewDidLoad()  {
        super.viewDidLoad()
        query_items_instance.load_query_items()
        self.user_profile_button.title = self.username
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
    
    @IBAction func go_to_user_profile(_ sender: Any) {
        let view_controller = self.storyboard?.instantiateViewController(withIdentifier: "user_profile_storyboard_id") as? UserProfileViewController
        view_controller?.modalPresentationStyle = .fullScreen
        self.present(view_controller!, animated: true, completion: nil)
    }
}


extension CoinViewController: UITableViewDelegate, UITableViewDataSource {
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

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

