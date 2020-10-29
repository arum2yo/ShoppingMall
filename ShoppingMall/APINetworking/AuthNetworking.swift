//
//  AuthNetworking.swift
//  ShoppingMall
//
//  Created by Ahreum CHO on 2020/10/20.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import Foundation
import Moya
import SwiftyJSON

class AuthNetworking{
    
    static let decoder = JSONDecoder()
    static let provider = MoyaProvider<AuthAPI>()
    
    static func registerNetworking(username: String, email: String, password: String, completion: @escaping (_ message:String) -> Void){
        
        provider.request(.register(username: username, email: email, password: password)) { (result) in
            switch result{
                
            case .success(let response):
//                print(" response.StatusCode-> \(response.statusCode)")
                
                let jsonData = JSON(response.data)
                
                if response.statusCode == 200 {
                    
                    print(jsonData)
                    
                    
                    completion("successful SignUp")
                    
                }
                
                break
                
            case .failure(let error):
                print(error)
                break
            }
        }
    }
    
    static func logInNetworking(identifier: String, password: String, onError: @escaping(_ message: String) -> Void  ,completion: @escaping() -> Void ){
        
        provider.request(.login(identifier: identifier, password: password)) { (result) in
            switch result{
                
            case .success(let response):
                
                let jsonData = JSON(response.data)
                
                if response.statusCode == 200 {
                    
                    print(jsonData)
                    
                    var tokenInfo = jsonData["token"].string
                    UserDefaults.standard.set(tokenInfo, forKey: "token") //접속정보저장 (자동로그인)
                    
                    let initialView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "Main")
                    
                    UIApplication.shared.keyWindow?.rootViewController = initialView
                    
                   
                    completion()
                    
                } else {
                    
                    onError("로그인 실패")
                }
                break
                
            case .failure(let error):
                
                print(error.localizedDescription)
                break
            }
        }
    }
    
    
}
