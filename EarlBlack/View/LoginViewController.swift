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
        let thirdVC = self.storyboard?.instantiateViewController(withIdentifier: "sign_up_storyboard_id") as! SignUpViewController
        navigationController?.isNavigationBarHidden = true
        navigationController?.pushViewController(thirdVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

