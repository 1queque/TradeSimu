//
//  SignUpViewController.swift
//  EarlBlack
//
//  Created by queque on 5.06.2022.
//

import UIKit

class SignUpViewController: UIViewController{

    @IBOutlet weak var sign_up_table_view: UITableView!
    var user_coding_keys_array = [String]()
    
    @IBAction func sign_up_button(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        user_coding_keys_array = User.get_all_coding_keys()
        
        self.sign_up_table_view.separatorColor = UIColor.clear
        self.sign_up_table_view.alwaysBounceVertical = false
        
        sign_up_table_view.delegate = self
        sign_up_table_view.dataSource = self
    }
}

extension SignUpViewController:  UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user_coding_keys_array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sign_up_cell", for: indexPath) as! SignUpTableViewCell
        cell.sign_up_text_field.placeholder = user_coding_keys_array[indexPath.row]
        return cell
    }
 }
