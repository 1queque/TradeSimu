//
//  SignUpTableViewCell.swift
//  EarlBlack
//
//  Created by queque on 7.06.2022.
//

import UIKit

class SignUpTableViewCell: UITableViewCell {

    @IBOutlet weak var title_label: UILabel!
    
    @IBOutlet weak var sign_up_text_field: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
