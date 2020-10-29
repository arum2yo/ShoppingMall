//
//  ProductImageHeaderView.swift
//  ShoppingMall
//
//  Created by Ahreum CHO on 2020/09/17.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import UIKit

class ProductImageHeaderView: UIView {
    
    @IBOutlet weak var pageCOntrol: UIPageControl!
   
    var images : [ProductImage] = []
    
   
}

extension ProductImageHeaderView: ProductImagesPageViewControllerDelegate{
  
    func turnPageController(to index: Int) {
        
        pageCOntrol.currentPage = index
    }
    
    
    func setupPageController(numberOfPage: Int) {
        pageCOntrol.numberOfPages = numberOfPage
    }
    
}
