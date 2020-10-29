//
//  AuthAPI.swift
//  ShoppingMall
//
//  Created by Ahreum CHO on 2020/10/06.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import Foundation
import Moya
import SwiftyJSON
//인증관련된 API

enum AuthAPI {
    
    case getCurrentUser(id: String, token: String)
    
    case register(username: String, email: String, password: String)
    case login(identifier: String, password: String)
    
    case facebookLogin(userId: String, accessToken: String)
    case googleLogin(idToken: String)
    
}

extension AuthAPI: TargetType {

    
    var baseURL: URL {
        guard let url = URL(string: "http://localhost:1337/auth") else {
            fatalError("couldn't find baseURL")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .getCurrentUser(let id, _):
            return "/local/\(id)"
        case .register(_,_,_):
            return "/local/register"
        case .login(_,_):
            return "/local"
        case .facebookLogin(_,_):
            return "/facebookLogin"
        case .googleLogin(_):
            return "/googleLogin"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getCurrentUser(_, _):
            return .get
        case .register(_, _, _), .login(_, _), .facebookLogin(_,_), .googleLogin(_):
            return .post
        }
    }
    
    var sampleData: Data {
        switch self {
        case .getCurrentUser(let id,_):
            return "{'userId':\(id)}".data(using: .utf8)!
        case .register(let username, let email, let password):
            return "{'username':'\(username)', 'email':'\(email)', 'password':'\(password)'}".data(using: .utf8)!
        case .login(let identifier, let password):
            return "{'identifier':'\(identifier)','password':'\(password)'}".data(using: .utf8)!
        case .facebookLogin(let userId, let accessToken):
            return "{'userId':'\(userId)','accessToken':'\(accessToken)'}".data(using: .utf8)!
        case .googleLogin(let idToken):
            return "{'idToken':'\(idToken)'}".data(using: .utf8)!
        }
    }
    
    var task: Task {
        switch self {
        case .getCurrentUser(_,_):
            return .requestPlain
        case .register(let username, let email, let password):
            return .requestParameters(parameters: ["username":username, "email":email, "password":password], encoding: JSONEncoding.default)
        case .login(let identifier, let password):
            return .requestParameters(parameters: ["identifier":identifier,"password":password], encoding: JSONEncoding.default)
        case .googleLogin(let idToken):
            return .requestParameters(parameters: ["idToken":idToken], encoding: JSONEncoding.default)
        case .facebookLogin(let userId, let accessToken):
            return .requestParameters(parameters: ["userId":userId,"accessToken":accessToken], encoding: JSONEncoding.default)
    }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getCurrentUser(_, let token):
            return ["Authorization":"Bearer \(token)"]
        default:
            return ["Content-Type":"application/json"]
        }
    }
}
