//
//  BuyButtonTableViewCell.swift
//  ShoppingMall
//
//  Created by Ahreum CHO on 2020/09/17.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import UIKit
//import Moya

class BuyButtonTableViewCell: UITableViewCell {

    @IBOutlet weak var buyButton: UIButton!
    
    var product: Product!{
        didSet{
            buyButton.setTitle("BUY FOR $ \(product.price)", for: .normal)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
