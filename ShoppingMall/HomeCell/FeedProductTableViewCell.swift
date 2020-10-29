//
//  FeedProductTableViewCell.swift
//  ShoppingMall
//
//  Created by Ahreum CHO on 2020/09/17.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import UIKit
import Kingfisher

class FeedProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    var product : Product?{
        didSet{
            updateUI()
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

    func updateUI(){
        
        if let product = product{
            
//            productImage.image = UIImage(named: "http://localhost:1337\(product.images[0].url)")
            
            productImage.kf.setImage(with: URL(string: "http://localhost:1337\(product.images[0].url)"), placeholder: nil)
            productName.text = product.name
            productPrice.text = "$ \(product.price)"
            
        }
    }
}
