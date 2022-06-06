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
    
    @IBAction func sign_up_button(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sign_up_view = storyboard.instantiateViewController(withIdentifier: "sign_up_storyboard_id") as! SignUpViewController
        navigationController?.pushViewController(sign_up_view, animated: true)
    }
    
    @IBAction func login_button(_ sender: Any) {
        print(email_text_field.text)
        print(password_text_field.text)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

