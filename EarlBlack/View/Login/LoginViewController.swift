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
    
    @IBOutlet weak var sign_in_loading_button: LoginLoadingButton!
    
    let login_view_model = LoginViewModel()
    
    @IBAction func sign_in_button(_ sender: Any)  {
        login_view_model.check_user_exists(email: email_text_field.text ?? "", password: password_text_field.text ?? "") { result in
            if result {
                print("User exists")
            } else {
                print("User does not exist")
            }
        }
        // sign_in_loading_button.animated_button(shoud_load: true)
    }
    
    @IBAction func sign_up_button(_ sender: Any) {
        let sign_up_view_controller = self.storyboard?.instantiateViewController(withIdentifier: "register_storyboard_id") as! RegisterViewController
        navigationController?.pushViewController(sign_up_view_controller, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
}



