//
//  ProductNetworking.swift
//  ShoppingMall
//
//  Created by Ahreum CHO on 2020/10/20.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import Foundation
import Moya
import SwiftyJSON

class ProductNetworking{
    
    static let decoder = JSONDecoder()
    static let provider = MoyaProvider<ProductProvider>()
    
    static func total(completion: @escaping([Product]) -> ()){
        
        provider.request(.total) { (result) in
            switch result{

            case .success(let response):
                
                
                do {
                    let results = try decoder.decode([Product].self, from: response.data)

//                    print("resultsss", results)
                    completion(results)
                    
                   

                } catch let error {
                    print(error)
                    
                    break
                }
                
//                print("response.Statuscode: \(response.statusCode)")
//
//                let jsonData = JSON(response.data)
//                print("res", jsonData)
//                completion(jsonData)
//
//                if response.statusCode == 200 {
//
////                    print(jsonData["message"].string!)
//                    let results = try decoder.decode(Products.self, from: response.data)
//
//                    completion(results)
//
//
//                } else if response.statusCode == 400 {
//
//                    print(response.data)
//
//                } else {
//
//                    print("500_error")
//                }
//
                break
            case .failure(let error):
                print(error.localizedDescription)
                break
            }
        }
        
       
    }
    
    
    static func detail(id: Int, completion: @escaping(Product) -> ()){
        
        provider.request(.detail(id: id)) { (result) in
            
            print("result??", result)
            switch result{
            
            
            case.success(let response):
                
                do {
                    let results = try decoder.decode(Product.self, from: response.data)

                    print("detail_resultsss", results)
                    completion(results)
                

                } catch let error {
                    
                    print(error)
                    
                    break
                }
                
                break
            case .failure(let error):
                print(error.localizedDescription)
                break
            }
        }
    }
}
