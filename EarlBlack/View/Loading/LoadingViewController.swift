//
//  LoadingViewController.swift
//  EarlBlack
//
//  Created by queque on 28.12.2022.
//

import UIKit

class LoadingViewController: UIViewController {
    
    @IBOutlet var spinner: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()

        spinner.startAnimating()
    }

}
