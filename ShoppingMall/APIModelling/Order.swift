//
//  Order.swift
//  ShoppingMall
//
//  Created by Ahreum CHO on 2020/10/29.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import Foundation
struct Orders: Decodable {
    var orders: [Order]
}
struct Order: Decodable {
    var id: Int!
    var qty: Int
    var product: Product?
    var created_at: String
//    var users_permissions_user: 
}
