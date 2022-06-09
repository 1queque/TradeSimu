//
//  LoginViewController.swift
//  EarlBlack
//
//  Created by queque on 3.06.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var email_text_field: UITextField!
    
    @IBOutlet weak var password_text_field: UITextField!
    
    @IBAction func sign_in_button(_ sender: Any) {
        print(email_text_field.text!)
        print(password_text_field.text!)
    }
    
    @IBAction func sign_up_button(_ sender: Any) {
        let sign_up_view_controller = self.storyboard?.instantiateViewController(withIdentifier: "sign_up_storyboard_id") as! SignUpViewController
        navigationController?.pushViewController(sign_up_view_controller, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
}



