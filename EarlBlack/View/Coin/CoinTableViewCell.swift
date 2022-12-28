//
//  CoinTableViewCell.swift
//  EarlBlack
//
//  Created by queque on 25.04.2022.
//

import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

class CoinTableViewCell: UITableViewCell {

    @IBOutlet weak var coinIconImageView: UIImageView!
    @IBOutlet weak var coinInfoLabel: UILabel! 
    @IBOutlet weak var coinChangeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func load_image_from_url(url: URL)
    {
        coinIconImageView.load(url: url)
    }

}
