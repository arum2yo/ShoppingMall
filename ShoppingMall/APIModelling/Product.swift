//
//  Product.swift
//  ShoppingMall
//
//  Created by Ahreum CHO on 2020/09/17.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON


struct Products: Decodable {
    var products:[Product]
}

struct Product: Decodable {
    var id:Int!
    var name: String
    var price: Int
    var beforePrice: Int
    var sellerName: String?
    var created_at: String
    var images:[ProductImage]
    var description: String?
}

struct ProductImage: Decodable {
    var name: String
    var url: String
}
