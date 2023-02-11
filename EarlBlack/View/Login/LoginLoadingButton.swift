//
//  LoginLoadingButton.swift
//  EarlBlack
//
//  Created by queque on 29.12.2022.
//

import UIKit

class LoginLoadingButton: UIButton {

    var original_size:CGRect?
    
    override func awakeFromNib() {
        setup()
    }

    func setup(){
        self.layer.cornerRadius = 5.0
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 10.0
        self.layer.shadowColor = UIColor.white.cgColor
        self.layer.shadowOpacity = 0.3
    }
    
    func animated_button(shoud_load: Bool){
        let sp = UIActivityIndicatorView()
        sp.style = .large
        sp.color = UIColor.white
        sp.alpha = 0.0
        sp.hidesWhenStopped = true
        sp.tag = 21
        
        if shoud_load {
            self .addSubview(sp)
            self.setTitle("", for: .normal)
            UIView.animate(withDuration: 0.2, animations: {}, completion: { (finished) in
                if finished {
                    sp.startAnimating()
                    sp.center = CGPoint(x: self.frame.width / 2 + 1, y: self.frame.height / 2 + 1)
                    sp.fadeTo(alphaValue: 1.0, withDuration: 0.2)
                }
            })
            
            self.isUserInteractionEnabled = false
        } else {
            self.isUserInteractionEnabled = true
            for sub_view in subviews{
                if sub_view.tag == 21 {
                    sub_view.removeFromSuperview()
                }
            }
        }
    }
}


extension UIView {
    func fadeTo(alphaValue:CGFloat, withDuration duration: TimeInterval){
        UIView.animate(withDuration: duration){
            self.alpha = alphaValue
        }
    }
}

