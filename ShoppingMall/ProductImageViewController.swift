//
//  ProductImageViewController.swift
//  ShoppingMall
//
//  Created by Ahreum CHO on 2020/09/17.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import UIKit

class ProductImageViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    var image: UIImage?{
        
        didSet{
            
            self.imageView.image = image
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.imageView.image = image
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
