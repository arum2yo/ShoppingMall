//
//  OrderAPI.swift
//  ShoppingMall
//
//  Created by Ahreum CHO on 2020/10/29.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//


import Foundation
import Moya
import SwiftyJSON

enum OrderProvider {
    case total
    
}

extension OrderProvider: TargetType{
    var baseURL: URL {
        guard let url = URL(string: "http://localhost:1337")else {
            
            fatalError("coulnt find base url")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .total:
            return "/order-bags"
    
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .total:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .total:
            return Data()
       }
    }
    
    var task: Task {
        switch self {
        case .total:
            return .requestPlain
       }
    }
    
    var headers: [String : String]? {
        return ["Content-Type":"application/json"]
    }
    
}
