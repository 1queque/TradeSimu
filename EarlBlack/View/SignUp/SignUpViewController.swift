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
    var sign_up_form_list: [String:UITextField] = [:]

    @IBAction func sign_up_done_button(_ sender: Any) {
        var form_dictionary:[String:String] = [:]
        
        for (key,value) in sign_up_form_list{
            form_dictionary[key] = value.text
        }
        SignUpViewModel(from: form_dictionary).set_data_to_encode()
        navigationController?.popToRootViewController(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        did_load_changes()
        register_cells()
    }

    func did_load_changes(){
        self.hideKeyboardWhenTappedAround()
        self.sign_up_table_view.separatorColor = UIColor.clear
        self.sign_up_table_view.alwaysBounceVertical = false
        user_coding_keys_array = User.get_all_coding_keys()
        sign_up_table_view.delegate = self
        sign_up_table_view.dataSource = self
    }

    func register_cells(){
        sign_up_table_view.register(UINib(nibName: "SignUpTableViewCell", bundle: nil), forCellReuseIdentifier: "sign_up_cell")
    }
}


extension SignUpViewController:  UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return user_coding_keys_array.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sign_up_cell", for: indexPath) as! SignUpTableViewCell
        cell.title_label.text = user_coding_keys_array[indexPath.section]
        cell.sign_up_text_field.placeholder = user_coding_keys_array[indexPath.section]
        sign_up_form_list[cell.title_label.text!] = cell.sign_up_text_field
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 5 {
            return 40
        } else { return 25 }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
 }

