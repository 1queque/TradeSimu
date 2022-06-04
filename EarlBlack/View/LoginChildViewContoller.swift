//
//  LoginChildViewContoller.swift
//  EarlBlack
//
//  Created by queque on 4.06.2022.
//

import UIKit

class LoginChildViewContoller: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func login(_ sender: Any) {
        print(emailTextField.text!)
        print(passwordTextField.text!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
