//
//  SuggestImageCollectionViewCell.swift
//  ShoppingMall
//
//  Created by Ahreum CHO on 2020/09/17.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import UIKit

class SuggestImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var suggestImage: UIImageView!
    
    var image: UIImage!{
        didSet {
            
            suggestImage.image = image
            setNeedsLayout()
        }
    }
}
