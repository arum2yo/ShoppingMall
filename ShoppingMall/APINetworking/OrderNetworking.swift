//
//  OrderNetworking.swift
//  ShoppingMall
//
//  Created by Ahreum CHO on 2020/10/29.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import Foundation
import Moya
import SwiftyJSON

class OrderNetworking{
    
    static let decoder = JSONDecoder()
    static let provider = MoyaProvider<OrderProvider>()
    
    static func total(completion: @escaping(Orders) -> Void){
        
        provider.request(.total) { (result) in
            
            
            switch result{

            
            
            case .success(let response):
                print("orderNEt2")
                do {
               
                    let result = JSON(response.data)
                
//                    completion(result)



                } catch let error {
                    print(error.localizedDescription)
                    
                    break
                }
                
                break
            case .failure(let error):
                
                print("errrrs?",error.localizedDescription)
                break
            }
        }
        
       
    }
    

}
