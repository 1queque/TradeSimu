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
        self.sign_in_loading_button.animated_button(shoud_load: true)
        login_view_model.check_user_exists(email: email_text_field.text ?? "", password: password_text_field.text ?? "") { result, username in
            if result {
                self.change_view_to_coin(with: "coin_storyboard_id", username)
            } else {
                self.change_view_to_coin(with: "login_storyboard_id", username)
            }
        }
    }
    
    @IBAction func sign_up_button(_ sender: Any) {
        let sign_up_view_controller = self.storyboard?.instantiateViewController(withIdentifier: "register_storyboard_id") as! RegisterViewController
        navigationController?.pushViewController(sign_up_view_controller, animated: true)
    }
    
    func change_view_to_coin(with identifier: String, _ username: String) {
        let view_controller = (self.storyboard?.instantiateViewController(withIdentifier: identifier))!
        view_controller.modalPresentationStyle = .fullScreen
        if let controller = view_controller as? CoinViewController {
            controller.username = username
        }
        self.present(view_controller, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
}



/*
 
 func change_view_to_coin(with identifier: String, _ username: String) {
     let view_controller = (self.storyboard?.instantiateViewController(withIdentifier: identifier))!
     view_controller.modalPresentationStyle = .fullScreen
     if ((view_controller as? CoinViewController) != nil) {
         view_controller.username = username
     }
     self.present(view_controller, animated: true, completion: nil)
 }
 */
