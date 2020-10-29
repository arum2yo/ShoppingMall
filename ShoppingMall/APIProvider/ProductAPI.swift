//
//  Provider.swift
//  ShoppingMall
//
//  Created by Ahreum CHO on 2020/10/06.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import Foundation
import Moya
import SwiftyJSON

enum ProductProvider {
    case total
    case detail(id: Int)
}

extension ProductProvider: TargetType{
    var baseURL: URL {
        guard let url = URL(string: "http://localhost:1337")else {
            
            fatalError("coulnt find base url")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .total:
            return "/products"
        case .detail(let id):
            return "/products/\(id)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .total, .detail(_):
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .total:
            return Data()
        case .detail(let id):
            return "{'id':'\(id)'}".data(using: .utf8)!
        }
    }
    
    var task: Task {
        switch self {
        case .total:
            return .requestPlain
        case .detail(let id):
            return .requestParameters(parameters: ["id":id], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type":"application/json"]
    }
    
}
