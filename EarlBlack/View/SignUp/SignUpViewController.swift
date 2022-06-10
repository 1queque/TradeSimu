//
//  SignUpViewController.swift
//  EarlBlack
//
//  Created by queque on 5.06.2022.
//

import UIKit

enum ErrorMessage: String{
    case fill_the_form = "Fill in all fields!"
    case fill_all_red_fields = "Fill in all red fields!"
}

class SignUpViewController: UIViewController{

    @IBOutlet weak var sign_up_table_view: UITableView!
    let user_coding_keys_array = User.add_all_coding_keys_to_array()
    var sign_up_form_dictionary: [String:UITextField] = [:]
    let sign_up_view_model = SignUpViewModel()

    @IBAction func submit_sign_up_table_view_through_done_button(_ sender: Any) {
        if sign_up_form_dictionary.count == user_coding_keys_array.count{
            if check_sign_up_form() {
                var form_dictionary:[String:String] = [:]
                for (key,value) in sign_up_form_dictionary{ form_dictionary[key] = value.text }
                sign_up_view_model.set_data_to_encode(from: form_dictionary)
            } else {
                show_alert_message(for: ErrorMessage.fill_all_red_fields.rawValue)
            }
        } else {
            show_alert_message(for: ErrorMessage.fill_the_form.rawValue)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        did_load_changes()
        register_cells()
    }
}

extension SignUpViewController{
    func did_load_changes(){
        self.hideKeyboardWhenTappedAround()
        self.sign_up_table_view.separatorColor = UIColor.clear
        self.sign_up_table_view.alwaysBounceVertical = false
        sign_up_table_view.delegate = self
        sign_up_table_view.dataSource = self
    }

    func register_cells(){
        sign_up_table_view.register(UINib(nibName: "SignUpTableViewCell", bundle: nil), forCellReuseIdentifier: "sign_up_cell")
    }
    
    func check_sign_up_form() -> Bool{
        var is_filled:Bool = true
        for (key, value) in sign_up_form_dictionary{
            if value.text == ""{
                is_filled = false
                value.attributedPlaceholder = NSAttributedString(
                    string: key.capitalize_first_letter_and_replace_underscore(),
                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.red]
                )
            }
        }
        return is_filled
    }
    
    func show_alert_message(for alert_message:String){
        let alert = UIAlertController(title: "", message: alert_message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
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
        sign_up_form_dictionary[cell.title_label.text?.lowercase_all_letter_and_replace_underscore() ?? ""] = cell.sign_up_text_field
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

