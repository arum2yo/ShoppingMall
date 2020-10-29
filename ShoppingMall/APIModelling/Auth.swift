//
//  Auth.swift
//  ShoppingMall
//
//  Created by Ahreum CHO on 2020/10/18.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import Foundation

struct Auth: Decodable {
    var id: String!
    var name: String!
    var email: String!
    var updatedAt: String!
    var createdAt: String!
    var role: String!
}
