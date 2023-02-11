//
//  UserProfileViewController.swift
//  EarlBlack
//
//  Created by queque on 10.02.2023.
//

import UIKit

class UserProfileViewController: UIViewController {
    
    @IBOutlet weak var profile_image_view: UIImageView!
    
    @IBOutlet weak var username: UILabel!
    
    @IBOutlet weak var email: UILabel!
    
    @IBOutlet weak var name: UILabel!
    
    override func viewDidLoad() {
        self.username.text = "qweqweqweqw"
        self.email.text = "mbugramw@gmail.com"
        self.name.text = "Buğra Muaz Müjde"
        super.viewDidLoad()
    }

}
