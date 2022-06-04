//
//  LoginViewController.swift
//  EarlBlack
//
//  Created by queque on 3.06.2022.
//

import UIKit

class LoginViewController: UIViewController {


    @IBOutlet weak var form_view: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let controller = storyboard!.instantiateViewController(withIdentifier: "sayfa2")
        self.add(controller, in: form_view)
    }
}


extension UIViewController {
    func add(_ child: UIViewController, in container: UIView) {
        addChild(child)
        child.view.frame = container.bounds
        container.addSubview(child.view)
        
        child.didMove(toParent: self)
    }
    
    func add(_ child: UIViewController) {
        add(child, in: view)
    }
    
    func remove(from view: UIView) {
        guard parent != nil else {
            return
        }
        
        willMove(toParent: nil)
        removeFromParent()
        view.removeFromSuperview()
    }
    
    func remove() {
        remove(from: view)
    }
}
