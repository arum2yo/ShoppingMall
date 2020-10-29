//
//  ShoppingCartItemTableViewCell.swift
//  ShoppingMall
//
//  Created by Ahreum CHO on 2020/09/24.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import UIKit

class ShoppingCartItemTableViewCell: UITableViewCell {

    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var priceLable: UILabel!
    @IBOutlet weak var removeButton: UIButton!
    
    var order: Order!{
        didSet{
            
            updateUI()
            
        }
    }
    
    func updateUI(){
        
//        productImage.image = product.images?.first
//        productName.text = product.name
//        priceLable.text = "$ \(product.price)!"
        
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
