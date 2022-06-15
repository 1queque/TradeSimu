//
//  RegisterFormViewController.swift
//  EarlBlack
//
//  Created by queque on 14.06.2022.
//

import UIKit

class RegisterFormViewController: UIViewController {
    
    let register_form_keys = RegisterFormViewModel.user_coding_keys_array
    let register_form_view_model = RegisterFormViewModel()
    var form_key_row:Int = 0
    var register_form:[String: Any] = [:]

    @IBOutlet weak var form_label: UILabel!
    @IBOutlet weak var form_text_field: UITextField!
    @IBOutlet weak var form_button: UIButton!
    
    @IBAction func check_field_and_next_to_submit(_ sender: Any) {
        let text_dictionary:[String: Any] = [form_label.text: form_text_field.text] as? [String: Any] ?? ["": ""]
        let check_text_is_valid_returns = register_form_view_model.check_text_is_valid(from: text_dictionary)
        if check_text_is_valid_returns.is_valid{
            self.form_key_row += 1
            register_form[form_label.text?.lowercase_all_letter_and_replace_underscore() ?? ""] = form_text_field.text
            if form_button.titleLabel?.text! == "SUBMIT"{
                self.submit_and_back_to_login()
            }
            change_form_fields()
        } else {
            show_alert_message(for: check_text_is_valid_returns.alert_message)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.change_form_fields()
    }
    
}

extension RegisterFormViewController{
    
    func change_form_fields(){
        form_label.text = self.register_form_keys[form_key_row]
        form_text_field.placeholder = self.register_form_keys[form_key_row]
        register_form_keys.count > form_key_row + 1 ? form_button.setTitle(self.register_form_keys[form_key_row + 1], for: .normal) : form_button.setTitle("SUBMIT", for: .normal)
        form_text_field.text = ""
    }
    
    func show_alert_message(for alert_message:String){
        let alert = UIAlertController(title: "", message: alert_message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func submit_and_back_to_login(){
        navigationController?.pushViewController(LoginViewController(), animated: true)
    }
    
}
